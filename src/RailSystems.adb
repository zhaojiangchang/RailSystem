with ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions;

package body RailSystems with SPARK_Mode=>On is
   use all type TYPES.MAX_SIZE;
   use all type TYPES.Station_Locations;

   --------------
   -- addTrack --
   --------------

   procedure addTrack
     (r_system: in out RailSystem; ID: in TYPES.MAX_SIZE; Origin: in TYPES.Station_Locations; Destination: in TYPES.Station_Locations)
   is
      track: Tracks.Track;
      OriginExist: Boolean;
      DestinationExist: Boolean;
      Origin_equal_Destination_Exception : Exception;
      Track_Already_Add_Exception: Exception;
      ID_Out_Of_Range_Exception: Exception;
      Origin_Not_Exist_Exception: Exception;
      Destination_Not_Exist_Exception: Exception;
      Origin_Destination_Not_Station_Location_Exception: Exception;

   begin
      if Origin = TYPES.No or Destination = TYPES.No then
         Put_Line("Origin or Destionation has to be a Station location");
         Raise Origin_Destination_Not_Station_Location_Exception;
      end if;

      if Origin = Destination then
         Put_Line("ADD TRACK: track Origin should not equals Destination");
         Raise Origin_equal_Destination_Exception;
      end if;

      if Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(r_system.All_Tracks, ID).id > 0 then
         Put_Line("ADD TRACK: track already exist");
         Raise Track_Already_Add_Exception;
      end if;

      if ID <1 or ID>100 then
         Put_Line("ADD TRACK: ID should between 1 and Max_Size");
         Raise ID_Out_Of_Range_Exception;
      end if;
      OriginExist := false;
      DestinationExist := false;
      for location in TYPES.No .. TYPES.Johnsonville loop
         if location = Origin then
            OriginExist := True;
         end if;
         if location = Destination then
            DestinationExist := true;
         end if;

      end loop;
      if OriginExist = false then
         Put_Line("ADD TRACK: Origin Not Exist Exception");
         Raise Origin_Not_Exist_Exception;
      end if;
      if DestinationExist = false then
         Put_Line("ADD TRACK: Destination Not Exist Exception");
         Raise Destination_Not_Exist_Exception;
      end if;

      track.ID:=ID;
      track.Origin:= Origin;
      track.Destination:= Destination;
      Stations.LIST_TRACKS.APPEND(r_system.All_Tracks,track, ID);
   end addTrack;

   --------------
   -- addTrain --
   --------------

   function addTrain (r_system: in out RailSystem;
                      ID: in TYPES.MAX_SIZE)
     return Trains.Train
   is
      train_t: Trains.Train;
      train_location: Trains.Train_Location;
      Station: Stations.Station;
   begin
      train_t.ID := ID;
      train_t.Location:= train_location;
      train_t.Destination:= Station;
      LIST_TRAINS.APPEND(r_system.All_Trains, train_t,ID);
      return train_t;
   end addTrain;

   ----------------
   -- addStation --
   ----------------

   procedure addStation
     (r_system: in out RailSystem;
      StationID: in TYPES.MAX_SIZE;
      Location: in TYPES.Station_Locations)
   is
      station_t: Stations.Station;
      Incoming: Stations.LIST_TRACKS.LIST_PTR;
      Outgoing: Stations.LIST_TRACKS.LIST_PTR;
      LocationExist: Boolean;
      tempStation: Stations.Station;
      Station_Already_Exist_Exception: Exception;
      Location_Not_Exist_Exception: Exception;
   begin
      LocationExist := False;
       for l in TYPES.No .. TYPES.Johnsonville loop
         if l = Location then
            LocationExist := True;
         end if;
      end loop;
      if LocationExist = false then
         Put_Line("ADD STATION: Station Location Not Exist Exception");
         Raise Location_Not_Exist_Exception;
      end if;

      tempStation:= LIST_STATIONS.GET_ELEMENT_BY_ID(r_system.All_Stations, StationID);
      if tempStation.ID /= 0 then
         Put_Line("ADD STATION: station already exist");
         Raise Station_Already_Exist_Exception;
      end if;

      Incoming := new Stations.LIST_TRACKS.LIST;
      Outgoing := new Stations.LIST_TRACKS.LIST;
      station_t.ID := StationID;
      station_t.Incoming := Incoming;
      station_t.Outgoing := Outgoing;
      LIST_STATIONS.APPEND(r_system.All_Stations, station_t,StationID);

   end addStation;


   --------------------------------
   -- set Train current Location --
   --------------------------------

   procedure setTrainLocation(r_system: in out RailSystem;
                              train: in out Trains.Train;
                              LocationName: in  String;
                              LocationID: in TYPES.MAX_SIZE)
   is
      Location_Name_Exception: Exception;
      Station_Not_Exist_Exception: Exception;
      Track_Not_Exist_Exception: Exception;
      tempStation: Stations.Station;
      tempTrack: Tracks.Track;
      Location: Trains.Train_Location;
   begin

      if LocationName = "Track" then
         tempTrack:= Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(r_system.All_Tracks, LocationID);
          if tempTrack.ID /= 0 then
            Location.Track := tempTrack;
            Location.Station := tempStation;
            Location.currentLocation:= "Track  ";
            train.Location := Location;
         else
            Put_Line("SET TRAIN LOCATION: track not exist");
         Raise Track_Not_Exist_Exception;
         end if;

      elsif LocationName = "Station" then
         tempStation:= LIST_STATIONS.GET_ELEMENT_BY_ID(r_system.All_Stations, LocationID);
         if tempStation.ID /= 0 then
            Location.Station := tempStation;
            Location.Track := tempTrack;
            Location.currentLocation:= "Station";
            train.Location := Location;
         else
            Put_Line("SET TRAIN LOCATION: station not exist");
         Raise Station_Not_Exist_Exception;
         end if;

      elsif LocationName = "None" then
         Location.Station := tempStation;
         Location.Track := tempTrack;
         Location.currentLocation:= "None   ";
         train.Location:= Location;
      else
         Put_Line("SET TRAIN LOCATION: location name should be Track or Station");
         Raise Location_Name_Exception;
      end if;



   end setTrainLocation;

   --------------------------------------------
   -- replace Station -------------------------
   --for addIncomingOutgoingTracksForStation---
   --------------------------------------------
   procedure replaceStation(r_system: in out RailSystem;
                        StationID: in TYPES.MAX_SIZE;
                        station: in Stations.Station)
   is
   begin
      LIST_STATIONS.REPLACE_BY_ID(r_system.All_Stations,StationID,station);
   end replaceStation;


   -----------------------------------------
   -- addIncomingOutgoingTracksForStation --
   -----------------------------------------
   --TODO: add income and outgoing tracks
   procedure addIncomingOutgoingTracksForStation(r_system: in out RailSystem)
   is
      temp: Stations.Station;
      NotFindTrackIdException : Exception;
      AlreadyAddTrackException : Exception;
      StationIDNotExistException: Exception;
   begin
      temp:= LIST_STATIONS.GET_ELEMENT_BY_ID(r_system.All_Stations, StationID);
      if temp.ID /= 0 then

         for i in 1..trackIds'Last loop
            if trackIds(i) >0 then
               if Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(r_system.All_Tracks, trackIds(i)).id > 0 then
                  if IOSwitch = "Incoming" then
                     if Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(temp.Incoming, trackIds(i)).id  =0 then
                        Stations.LIST_TRACKS.APPEND(temp.Incoming, Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(r_system.All_Tracks,trackIds(i)),trackIds(i) );
                     else
                        Put_Line("track already exist in the income tracks");
                        Raise AlreadyAddTrackException;
                     end if;
                  elsif IOSwitch = "Outgoing" then
                      if Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(temp.Outgoing, trackIds(i)).id  =0 then
                        Stations.LIST_TRACKS.APPEND(temp.Outgoing, Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(r_system.All_Tracks,trackIds(i)),trackIds(i) );
                     else
                        Put_Line("track already exist in the outgoing tracks");
                        Raise AlreadyAddTrackException;
                     end if;
                  end if;
               else
                  Put_Line("track id not exist");
                  Raise NotFindTrackIdException;
               end if;
            end if;

         end loop;
      elsif temp.ID = 0 then
         Put_Line("station id not exist");
         Raise StationIDNotExistException;
      end if;
      replaceStation(r_system,StationID,temp);
   end addIncomingOutgoingTracksForStation;

end RailSystems;
