with sPrint;
use sPrint;
with Ada.Exceptions;
with Ada.Text_IO; use Ada.Text_IO;

package body RailSystems with SPARK_Mode=>On is
   use all type TYPES.MAX_SIZE;
   use all type TYPES.Station_Locations;




   procedure Init(r_system: in out RailSystem)
   is
   begin
      RailSystems.LIST_TRAINS.Init(r_system.All_Trains);
      RailSystems.LIST_STATIONS.Init(r_system.All_Stations);
      Stations.LIST_TRACKS.Init(r_system.All_Tracks);
   end Init;


--     procedure InitTrack
--       (track_r: in out Tracks.Track)
--     is
--     begin
--        track_r.ID:=0;
--        track_r.Origin:= TYPES.No;
--        track_r.Destination:=TYPES.No;
--        track_r.TrainID:=0;
--     end InitTrack;

   --------------------
   -- Go (For train) --
   --------------------
   procedure go(r_system: in RailSystem; train: in out Trains.Train)
   is
   begin
      pragma Warnings(Off, r_system);

null;
   end go;

   --------------------
   -- Prepare Train --
   --------------------
   procedure prepareTrain(r_system: in RailSystem;
                          train: in out Trains.Train;
                          Origin: in TYPES.Station_Locations;
                          Destionation: in TYPES.Station_Locations;
                          StartTime: in TYPES.TimeTable)

   is
      Origin_Should_Not_Equals_No: Exception;
      Destionation_Should_Not_Equals_No: Exception;
      Already_Train_At_Station: Exception;

   begin


      if Origin = TYPES.No then
         Print("PREPARE TRAIN: Origin should not be TYPES.No");
         raise Origin_Should_Not_Equals_No;
      elsif Destionation = TYPES.No then
         Print("PREPARE TRAIN: Destionation should not be TYPES.No");
         raise Destionation_Should_Not_Equals_No;
      end if;
      train.Location.Station:= getStationByName(r_system, Origin);
      if train.Location.Station.TrainID /=0 then
         Print("PREPARE TRAIN: Destionation should not be TYPES.No");
         raise Already_Train_At_Station;
      end if;
      train.Location.Station.TrainID:=train.ID;
      train.Origin := Origin;
      train.Destination := Destionation;
      train.State:=TYPES.Open;
      train.Start_Run_Time:=StartTime;
      train.Location.currentLocation:="Station";



      train.Location.Track := getTrackByName(r_system, Origin);
      train.Location.Track.TrainID :=0;
      null;
   end prepareTrain;


   --------------------
   -- update Train --
   --------------------
   procedure updateTrain(r_system: in RailSystem;
                         train: in out Trains.Train)

   is
      pragma Warnings(Off, r_system);


   begin
      null;
   end updateTrain;
   ---------------------------------
   -- get station by station name --
   ---------------------------------

   function getStationByName(r_system: in RailSystem;
                             Origin: in TYPES.Station_Locations)
                             return Stations.Station
   is
      temp: Stations.Station;
--        l: Stations.LIST_TRACKS.LIST_PTR(MAX_SIZE =>100);
--        inTracks:Stations.LIST_TRACKS.LIST_PTR(MAX_SIZE =>100);
--        outTracks: Stations.LIST_TRACKS.LIST_PTR(MAX_SIZE =>100);
   begin
      --        Stations.Init(temp);
      pragma Warnings(Off, temp);
--        Stations.LIST_TRACKS.Init(inTracks);
--        Stations.LIST_TRACKS.Init(outTracks);
      for i in 1 .. RailSystems.LIST_STATIONS.GET_SIZE(r_system.All_Stations) loop
         if RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(r_system.All_Stations, i).Location = Origin then
            return RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(r_system.All_Stations, i);
         end if;
      end loop;
      return temp;
   end getStationByName;

   ---------------------------------
   -- get track by station name --
   ---------------------------------

   function getTrackByName(r_system: in RailSystem;
                             Origin: in TYPES.Station_Locations)
                             return Tracks.Track
   is
      temp: Tracks.Track;
   begin
      --        InitTrack(temp);
      temp.ID:=0;
      temp.Origin:= TYPES.No;
      temp.Destination:=TYPES.No;
      temp.TrainID:=0;
      for i in 1 .. Stations.LIST_TRACKS.GET_SIZE(r_system.All_Tracks) loop
         if Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(r_system.All_Tracks, i).Origin = Origin then
            return Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(r_system.All_Tracks, i);
         end if;
      end loop;
      return temp;
   end getTrackByName;


   --------------
   -- addTrack --
   --------------

   procedure addTrack(r_system: in out RailSystem;
                      ID: in Natural;
                      Origin: in TYPES.Station_Locations;
                      Destination: in TYPES.Station_Locations;
                      LineOrigin: in TYPES.Station_Locations;
                      LineDestination: in TYPES.Station_Locations)
   is
      track: Tracks.Track;
      OriginExist: Boolean;
      DestinationExist: Boolean;
      sizeTracks: Natural;
      Origin_equal_Destination_Exception : Exception;
      Track_Already_Add_Exception: Exception;
      ID_Out_Of_Range_Exception: Exception;
      Origin_Not_Exist_Exception: Exception;
      Destination_Not_Exist_Exception: Exception;
      Origin_Destination_Not_Station_Location_Exception: Exception;
      Track_Already_Used_Exception: Exception;
      Tracks_Line_Origin_Destination_Equal_Exception: Exception;

   begin
      --        Tracks.Init(track);
--        track.ID:=0;
--        track.Origin:= TYPES.No;
--        track.Destination:=TYPES.No;
--        track.TrainID:=0;
      sizeTracks:= Stations.LIST_TRACKS.GET_SIZE(r_system.All_Tracks);
      if sizeTracks > 0 then
         for j in 1 ..sizeTracks loop
            track:= Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(r_system.All_Tracks, j);
            if track.Origin = Origin and track.Destination = Destination then
               print("ADD TRACK: track already exist");
               Raise Track_Already_Add_Exception;
            end if;
         end loop;
      else
--           print("ADD TRACK: tracks size = 0 (add first track)");
      end if;


      if Origin = TYPES.No or Destination = TYPES.No or LineOrigin = TYPES.No or LineDestination = TYPES.No then
         Print("Origin or Destionation has to be a Station location");
         Raise Origin_Destination_Not_Station_Location_Exception;
      end if;

      if Origin = Destination then
         Print("ADD TRACK: track Origin should not equals Destination");
         Raise Origin_equal_Destination_Exception;
      end if;

      if LineDestination = LineOrigin then
         Print("ADD TRACK: Tracks line origin should not equals tracks line destination");
         Raise Tracks_Line_Origin_Destination_Equal_Exception;
      end if;

      if Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(r_system.All_Tracks, ID).id >= 1 then
         Print("ADD TRACK: track ID already used");
         Raise Track_Already_Used_Exception;
      end if;

      if ID <1 or ID>100 then
         Print("ADD TRACK: ID should between 1 and Max_Size");
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
         Print("ADD TRACK: Origin Not Exist Exception");
         Raise Origin_Not_Exist_Exception;
      end if;
      if DestinationExist = false then
         Print("ADD TRACK: Destination Not Exist Exception");
         Raise Destination_Not_Exist_Exception;
      end if;

      track.ID:=ID;
      track.Origin:= Origin;
      track.Destination:= Destination;
      track.TracksLineOrigin:= LineOrigin;
      track.TracksLineDestination:=LineDestination;
      Stations.LIST_TRACKS.APPEND(r_system.All_Tracks,track, ID);
   end addTrack;

   --------------
   -- addTrain --
   --------------

   procedure addTrain (r_system: in out RailSystem;
                      ID: in Natural)
   is
      train: Trains.Train;

   begin
      train.ID := ID;
      LIST_TRAINS.APPEND(r_system.All_Trains, train,ID);
   end addTrain;

   ---------------------
   -- get train by id --
   ---------------------
   function getTrainById(r_system: in RailSystem; ID: in Natural)
                         return Trains.Train
   is
      ID_Out_Of_Range_Exception: Exception;
      train: Trains.train;
   begin
      if ID < 1 or ID > RailSystems.LIST_TRAINS.GET_SIZE(r_system.All_Trains) then
         Print("GET TRAIN BY ID: id out of range");
         Raise ID_Out_Of_Range_Exception;
      end if;

      for i in 1 ..  RailSystems.LIST_TRAINS.GET_SIZE(r_system.All_Trains) loop
         train:= RailSystems.LIST_TRAINS.GET_ELEMENT_BY_ID(r_system.All_Trains, ID);
         return train;
      end loop;

      return train;
   end getTrainById;

   ----------------
   -- addStation --
   ----------------

   procedure addStation
     (r_system: in out RailSystem;
      StationID: in Natural;
      Location: in TYPES.Station_Locations)
   is
      station_t: Stations.Station;
      LocationExist: Boolean;
      tempStation: Stations.Station;
      Station_Already_Exist_Exception: Exception;
      Location_Not_Exist_Exception: Exception;
   begin
--        Stations.Init(station_t);
      LocationExist := False;
       for l in TYPES.No .. TYPES.Johnsonville loop
         if l = Location then
            LocationExist := True;
         end if;
      end loop;
      if LocationExist = false then
         Print("ADD STATION: Station Location Not Exist Exception");
         Raise Location_Not_Exist_Exception;
      end if;

      tempStation:= LIST_STATIONS.GET_ELEMENT_BY_ID(r_system.All_Stations, StationID);
      if tempStation.ID /= 0 then
         Print("ADD STATION: station already exist");
         Raise Station_Already_Exist_Exception;
      end if;


      station_t.ID := StationID;
      station_t.Location := Location;
      LIST_STATIONS.APPEND(r_system.All_Stations, station_t,StationID);

   end addStation;


   --------------------------------
   -- set Train current Location --
   --------------------------------

   procedure setTrainLocation(r_system: in RailSystem;
                              train: in out Trains.Train;
                              LocationName: in  String;
                              LocationID: in Natural)
   is
      Location_Name_Exception: Exception;
      Station_Not_Exist_Exception: Exception;
      Track_Not_Exist_Exception: Exception;
      Train_Already_On_Track_Exception: Exception;
      Train_Already_On_Station_Exception: Exception;
      tempStation: Stations.Station;
      tempTrack: Tracks.Track;
      Location: Trains.Train_Location;
   begin
      tempTrack.TrainID:=0;

      --        Stations.Init(tempStation);
      tempStation.ID:=0;
      tempStation.TrainID:=0;
      tempStation.Location:=TYPES.No;
      if LocationName = "Track" then
         tempTrack:= Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(r_system.All_Tracks, LocationID);
         if tempTrack.TrainID /=0 then
            Print("SET TRAIN LOCATION: there is a train already on the track");
            Raise Train_Already_On_Track_Exception;
         elsif tempTrack.ID /= 0 then
            Location.Track := tempTrack;
            Location.Station := tempStation;
            Location.currentLocation:= "Track  ";
            train.Location := Location;
         else
            Print("SET TRAIN LOCATION: track not exist");
            Raise Track_Not_Exist_Exception;
         end if;

      elsif LocationName = "Station" then
         tempStation:= LIST_STATIONS.GET_ELEMENT_BY_ID(r_system.All_Stations, LocationID);
         if tempStation.TrainID /= 0 then
            Print("SET TRAIN LOCATION: there is a train already on the station");
            Raise Train_Already_On_Station_Exception;
         elsif tempStation.ID /= 0 then
            Location.Station := tempStation;
            Location.Track := tempTrack;
            Location.currentLocation:= "Station";
            train.Location := Location;
         else
            Print("SET TRAIN LOCATION: station not exist");
         Raise Station_Not_Exist_Exception;
         end if;

      elsif LocationName = "None" then
         Location.Station := tempStation;
         Location.Track := tempTrack;
         Location.currentLocation:= "None   ";
         train.Location:= Location;
      else
         Print("SET TRAIN LOCATION: location name should be Track or Station");
         Raise Location_Name_Exception;
      end if;



   end setTrainLocation;

   --------------------------------------------
   -- replace Station -------------------------
   --for addIncomingOutgoingTracksForStation---
   --------------------------------------------
   procedure replaceStation(r_system: in out RailSystem;
                        StationID: in Natural;
                        station: in Stations.Station)
   is
   begin
      LIST_STATIONS.REPLACE_BY_ID(r_system.All_Stations,StationID,station);
   end replaceStation;


   -----------------------------------------
   -- addIncomingOutgoingTracksForStation --
   -----------------------------------------
   procedure addIncomingOutgoingTracksForEachStation(r_system: in out RailSystem)
   is
      tempStation: Stations.Station;
      tempTrack: Tracks.Track;
      od_record: TYPES.ODRecord;
      size: Natural;
      found: Boolean;
      NotFindTrackIdException : Exception;
      AlreadyAddTrackException : Exception;
      StationIDNotExistException: Exception;

   begin

      for i in 1 .. LIST_STATIONS.GET_SIZE(r_system.All_Stations) loop
         tempStation:= LIST_STATIONS.GET_ELEMENT_BY_ID(r_system.All_Stations, i);

         for j in 1 ..Stations.LIST_TRACKS.GET_SIZE(r_system.All_Tracks) loop
            tempTrack:= Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(r_system.All_Tracks, j);
            if tempTrack.Origin = tempStation.Location then
               if Stations.LIST_TRACKS.CONTAINS(tempStation.Outgoing, tempTrack) = False then

                  Stations.LIST_TRACKS.APPEND(tempStation.Outgoing, tempTrack, tempTrack.ID);
                  od_record.Origin:= tempTrack.TracksLineOrigin;
                  od_record.Destination:=TempTrack.TracksLineDestination;
                  size:=TYPES.LIST_OD.GET_SIZE(tempStation.TracksLineOriginAndDestination);
                  if size<1 then
                     TYPES.LIST_OD.APPEND(tempStation.TracksLineOriginAndDestination, od_record,1);
                  elsif size>0 then
                     found:=False;
                     for w in 1 .. size loop
                        if (TYPES.LIST_OD.GET_ELEMENT(tempStation.TracksLineOriginAndDestination,w).Origin = od_record.Origin
                            and  TYPES.LIST_OD.GET_ELEMENT(tempStation.TracksLineOriginAndDestination,w).Destination = od_record.Destination)
                          or (TYPES.LIST_OD.GET_ELEMENT(tempStation.TracksLineOriginAndDestination,w).Origin = od_record.Destination
                              and  TYPES.LIST_OD.GET_ELEMENT(tempStation.TracksLineOriginAndDestination,w).Destination = od_record.Origin) then
                           found:=True;
                        end if;
                     end loop;
                     if found = False then
                        TYPES.LIST_OD.APPEND(tempStation.TracksLineOriginAndDestination, od_record,1);
                     end if;
                  end if;
               end if;
            elsif tempTrack.Destination = tempStation.Location then
               if Stations.LIST_TRACKS.CONTAINS(tempStation.Incoming, tempTrack) = False then
                  Stations.LIST_TRACKS.APPEND(tempStation.Incoming, tempTrack, tempTrack.ID);
               end if;
            end if;
         end loop;
         replaceStation(r_system,tempStation.ID,tempStation);
      end loop;
   end addIncomingOutgoingTracksForEachStation;

end RailSystems;
