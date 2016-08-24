with ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions;

package body RailSystems with SPARK_Mode=>On is
   use all type TYPES.MAX_SIZE;
   --------------
   -- addTrack --
   --------------

   procedure addTrack
     (r_system: in out RailSystem; ID: in TYPES.MAX_SIZE; Origin: in TYPES.Origin_Type; Destination: in TYPES.Destination_Type)
   is
      track: Tracks.Track;

   begin
      track.ID:=ID;
      track.Origin:= Origin;
      track.Destination:= Destination;
      Stations.LIST_TRACKS.APPEND(r_system.All_Tracks,track, ID);
   end addTrack;

   --------------
   -- addTrain --
   --------------

   procedure addTrain (r_system: in out RailSystem;
                       ID: in TYPES.MAX_SIZE;
                       location: in Integer)
   is
      train_t: Trains.Train;
   begin
      train_t.ID := ID;
      train_t.Location := location;
      LIST_TRAINS.APPEND(r_system.All_Trains, train_t,ID);
   end addTrain;

   ----------------
   -- addStation --
   ----------------

   procedure addStation
     (r_system: in out RailSystem;
--        stationsList: in out LIST_STATIONS.LIST_PTR;
      StationID: in TYPES.MAX_SIZE;
      Location: in TYPES.Station_Locations)
   is
      station_t: Stations.Station;
      Incoming: Stations.LIST_TRACKS.LIST_PTR;
      Outgoing: Stations.LIST_TRACKS.LIST_PTR;
   begin
      Incoming := new Stations.LIST_TRACKS.LIST;
      Outgoing := new Stations.LIST_TRACKS.LIST;
      station_t.ID := StationID;
      station_t.Incoming := Incoming;
      station_t.Outgoing := Outgoing;
      LIST_STATIONS.APPEND(r_system.All_Stations, station_t,StationID);
--        r_system.All_Stations:= stationsList;
   end addStation;


   procedure setStation(r_system: in out RailSystem;
                        StationID: in TYPES.MAX_SIZE;
                        station: in Stations.Station)
   is
   begin
      LIST_STATIONS.REPLACE_BY_ID(r_system.All_Stations,StationID,station);
   end setStation;

   procedure addIncomingOutgoingTracksForStation(r_system: in out RailSystem;
                                         StationID: in TYPES.MAX_SIZE;
                                         trackIds: in TYPES.trackIDsArray;
                                        IOSwitch: in String)
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

      setStation(r_system,StationID,temp);



   end addIncomingOutgoingTracksForStation;

--   procedure addOutgoingTracksForStation(r_system: in out RailSystem;
--                                           StationID: in TYPES.MAX_SIZE;
--                                           trackIds: in TYPES.trackIDsArray)
--     is
--        temp: Stations.Station;
--        NotFindTrackIdException : Exception;
--        AlreadyAddTrackException : Exception;
--        IncrectTrackIDException: Exception;
--        StationIDNotExistException: Exception;
--     begin
--        temp:= LIST_STATIONS.GET_ELEMENT_BY_ID(r_system.All_Stations, StationID);
--        if temp.ID /= 0 then
--           for i in 1..trackIds'Last loop
--              if trackIds(i) >0 then
--                 if Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(r_system.All_Tracks, trackIds(i)).id > 0 then
--                    if Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(temp.Outgoing, trackIds(i)).id  =0 then
--
--                       Stations.LIST_TRACKS.APPEND(temp.Outgoing, Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(r_system.All_Tracks,trackIds(i)),trackIds(i) );
--
--                    else
--                       Put_Line("track already exist in the income tracks");
--                       Raise AlreadyAddTrackException;
--                    end if;
--
--
--                 else
--                    Put_Line("track id not exist");
--                    Raise NotFindTrackIdException;
--                 end if;
--              elsif trackIds(i)<0 or trackIds(i)>100 then
--                 Put_Line("increat track id should > 0 and < 100");
--                 Raise IncrectTrackIDException;
--              end if;
--
--           end loop;
--        elsif temp.ID = 0 then
--           Raise StationIDNotExistException;
--        end if;
--
--        setStation(r_system,StationID,temp);
--
--
--
--     end addOutgoingTracksForStation;

end RailSystems;
