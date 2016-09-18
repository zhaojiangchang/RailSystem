with sPrint;
use sPrint;
with Ada.Exceptions;
with Ada.Calendar;
with Ada.Text_IO; use Ada.Text_IO;
use Ada.Calendar; -- for the "-" and "+" operations on Time

package body RailSystems with SPARK_Mode=>On is
   use all type TYPES.MAX_SIZE;
   use all type TYPES.Station_Locations;
   MAX_SIZE:Natural:=101;
   --------------------------------------------------
   -- Init all lists(Stations, tracks, and trains)---
   -- by Set list size = 0                        ---
   --------------------------------------------------
   procedure Init(r_system: in out RailSystem)
   is
   begin
      RailSystems.LIST_TRAINS.Init(r_system.All_Trains);
      RailSystems.LIST_STATIONS.Init(r_system.All_Stations);
      Stations.LIST_TRACKS.Init(r_system.All_Tracks);
   end Init;

   ----------------------------------------------------------------------------------
   -- Go (For train): train will start from the trian's origin                     --
   -- once reached train's destination, train's origin will changed                --
   -- to destination and train's destination will changed to orign                 --
   -- before call Go procedure - need call dfs_station_reachability_by_train       --
   -- prodedure to make sure the train can travel from orign to destination station--
   ----------------------------------------------------------------------------------
   procedure go(r_system: in out RailSystem; train: in out Trains.Train; count: in Positive)
   is
      --        Trains: Trains.Train;
      track: Tracks.Track;
      station: Stations.Station;
      tempStationLocation: TYPES.Station_Locations;
      size: Natural;
      station_count: Natural;
   begin
      pragma Warnings(Off, r_system);
      station_count:=1;

      while station_count< count loop
         if train.Location.currentLocation = "Station" then
            if train.Location.Station.Location =train.Destination then
               tempStationLocation:= train.Origin;
               train.Origin :=train.Destination;
               train.Destination:= tempStationLocation;
            end if;
            if train.Location.Station.ID /=0 then
               size:=Stations.LIST_TRACKS.GET_SIZE(A => LIST_STATIONS.GET_ELEMENT_BY_ID(A =>r_system.All_Stations,
                                                                                        ID =>train.Location.Station.ID).Outgoing);
               for i in 1 .. size loop
                  if train.Location.Station.ID /=0 then
                     track:= Stations.LIST_TRACKS.GET_ELEMENT(A        => RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(r_system.All_Stations,train.Location.Station.ID).Outgoing,
                                                              LOCATION => i);
                     if track.TracksLineDestination = train.Destination  then
                        if track.Origin/=TYPES.No and track.Destination/=TYPES.No then
                           if getTrackByName(r_system    => r_system,
                                             Origin      => track.Origin,
                                             Destination => track.Destination).TrainID = 0 then
                              train.Location.currentLocation := "Track  ";
                              train.Location.Track:= track;
                              train.Location.Station.ID := 0;
                              train.Location.Station.TrainID:=0;
                              train.State:=TYPES.Move;
                              train.Location.Track.TrainID:=train.ID;
                              station:= getStationByName(stations_list   => r_system.All_Stations,
                                                         stationLocation => track.Destination);
                              station.TrainID:=0;
                              if station.ID >0 and station.ID<MAX_SIZE and station.Location /=TYPES.No then
                                 replaceStation(r_system => r_system,
                                                station  => station);
                              end if;

                              track.TrainID:=train.ID;
                              if track.ID >0 and track.ID<MAX_SIZE then
                                 replaceTrack(r_system,track);
                              end if;
                              if train.ID>0 and train.ID<MAX_SIZE then
                                 replaceTrain(r_system,train);
                              end if;
                              Print_Natural("Train ID:  ", train.ID);
                              Print_Train_State("Train state:  ", train.State);
                              Print("Train current location:  "& train.Location.currentLocation);
                              Print_Natural("Track ID:  ",train.Location.Track.ID);
                              Print_Station_Locations("Track from:", track.Origin);
                              Print_Station_Locations("Track to:  ", track.Destination);
                              Print("--------------------------------------------------------");
                              --                             else
                              --                                Print_Natural("GO: Can not move, Other train on the track: ", track.ID);

                           end if;

                        end if;
                     end if;
                  end if;
               end loop;
            end if;

         elsif train.Location.currentLocation = "Track  " then
            if train.Location.Track.Destination /= TYPES.No then
               station:=getStationByName(stations_list   => r_system.All_Stations,
                                         stationLocation => train.Location.Track.Destination);
            end if;
            if station.Location /=TYPES.No then
               if getStationByName(r_system.All_Stations,station.Location).TrainID = 0 then
                  if train.Location.Track.Destination /= TYPES.No then
                     train.Location.Station:= getStationByName(stations_list   => r_system.All_Stations ,
                                                               stationLocation => train.Location.Track.Destination);
                  end if;
                  train.Location.currentLocation:= "Station";
                  train.State:=TYPES.Stop;
                  train.Location.Track.ID:=0;
                  train.Location.Track.TrainID:=0;
                  train.Location.Station.TrainID:= train.ID;
                  station.TrainID:=train.ID;

                  if station.ID >0 and station.ID<MAX_SIZE and station.Location /= TYPES.No then
                     replaceStation(r_system,station);
                  end if;
                  if train.Location.Track.Origin /= TYPES.No and train.Location.Track.Destination /= TYPES.No then
                     track:=getTrackByName(r_system    => r_system,
                                           Origin      => train.Location.Track.Origin,
                                           Destination => train.Location.Track.Destination);
                  end if;

                  track.TrainID:=0;
                  if track.ID >0 and track.ID<MAX_SIZE then
                     replaceTrack(r_system,track);
                  end if;
                  if train.ID>0 and train.ID<MAX_SIZE then
                     replaceTrain(r_system,train);
                  end if;
                  Print_Natural("Train state:  ", train.ID);

                  Print_Train_State("Train state:  ", train.State);
                  Print_Natural("current location station id:  ", train.Location.Station.ID);
                  Print_Station_Locations("current location station:  ", train.Location.Station.Location);

                  Print("--------------------------------------------------------");
                  --                 else
                  --                    Print_Natural("GO: Can not stop, other train at station", station.ID);
                  --                    Print_Natural("GO: Train id at the station: ", station.TrainID);

               end if;
            end if;

         end if;

         station_count:=station_count+1;
      end loop;
   end go;


   --------------------------------------------------------------------------------------
   -- deep first search - check reachability from train's origin to train's destination--
   -- if reachable - train.isReachable = True                                          --
   --------------------------------------------------------------------------------------
   procedure dfs_station_reachability_by_train(r_system: in out RailSystem; train: in out Trains.Train)
   is
      base_Location: TYPES.Station_Locations;
      temp_Location: TYPES.Station_Locations;
      stations_list: LIST_STATIONS.List_PTR(MAX_SIZE=>100);
      visted_list:   LIST_STATIONS.List_PTR(MAX_SIZE=>100);
      station: Stations.Station;
      station2: Stations.Station;
   begin
      --        if train.Location.Track.TrainID/=0 then
      --           base_Location:=train.location.Track.Destination;
      if train.Location.Station.TrainID/=0 then
         base_Location:=train.Location.Station.Location;
         Print_Station_Locations("base location", base_Location);
         if base_Location /= TYPES.No then
            if getStationByName(stations_list   => stations_list,
                                stationLocation => base_Location).ID = 0
            then

               station:=  getStationByName(stations_list   => r_system.All_Stations,
                                           stationLocation => base_Location);
               station.Location := base_Location;
               if station.Location /= TYPES.No and station.ID > 0 and station.ID< MAX_SIZE then
                  LIST_STATIONS.APPEND(A  => stations_list,
                                       D  => station,
                                       ID => station.ID);
               end if;

            end if;

            while LIST_STATIONS.GET_SIZE(A => stations_list) /=0
            loop
               temp_Location:=LIST_STATIONS.GET_ELEMENT(A        => stations_list,
                                                        LOCATION => LIST_STATIONS.GET_SIZE(A => stations_list)).Location;
               Print_Station_Locations("temp_Location", temp_Location);

               LIST_STATIONS.DELETE_LAST(A => stations_list);
               if not LIST_STATIONS.CONTAINS(A => visted_list,
                                             D => getStationByName(stations_list        => r_system.All_Stations,
                                                                   stationLocation => temp_Location)) then
                  --                    Print_Station_Locations("already visted: ",temp_Location);
                  station:=  getStationByName(stations_list   => r_system.All_Stations,
                                              stationLocation => temp_Location);
                  if station.Location /= TYPES.No and station.ID > 0 and station.ID< MAX_SIZE then
                     LIST_STATIONS.APPEND(A  => visted_list,
                                          D  => station,
                                          ID => station.ID);
                  end if;
                  if temp_Location = train.Destination then
                     train.isReachable:=True;
                     if train.ID>0 and train.ID<MAX_SIZE then
                        replaceTrain(r_system => r_system,
                                     train    => train);
                     end if;
                     return;
                  end if;
                  for Index in 1 .. Stations.LIST_TRACKS.GET_SIZE(A => r_system.All_Tracks)
                  loop
                     if Stations.LIST_TRACKS.GET_ELEMENT(A        => r_system.All_Tracks,
                                                         LOCATION => Index).Origin = temp_Location then

                        station2:=  getStationByName(stations_list   => r_system.All_Stations,
                                                     stationLocation => Stations.LIST_TRACKS.GET_ELEMENT(A        => r_system.All_Tracks,
                                                                                                         LOCATION => Index).Destination);
                        Print_Station_Locations("destination",Stations.LIST_TRACKS.GET_ELEMENT(A        => r_system.All_Tracks,
                                                                                               LOCATION => Index).Destination);
                        if station2.Location /= TYPES.No and station2.ID > 0 and station2.ID< MAX_SIZE then
                           LIST_STATIONS.APPEND(A  => Stations_list,
                                                D  => station2,
                                                ID => station2.ID);
                           Print_Station_Locations("add",station2.Location);
                        end if;
                     end if;
                  end loop;
               end if;
            end loop;
         end if;
      end if;

   end dfs_station_reachability_by_train;

   --------------------------------------------------------------------------------------
   -- deep first search - check reachability from a station to another station         --
   -- if reachable - to_station.isReachable = True                                     --
   --------------------------------------------------------------------------------------
   procedure dfs_station_reachability_by_stations(r_system: in out RailSystem; from_station: in TYPES.Station_Locations; to_Station: in TYPES.Station_Locations)

   is
      base_Location: TYPES.Station_Locations;
      temp_Location: TYPES.Station_Locations;
      stations_list: LIST_STATIONS.List_PTR(MAX_SIZE=>100);
      visted_list:   LIST_STATIONS.List_PTR(MAX_SIZE=>100);
      station: Stations.Station;
      station2: Stations.Station;
      tempStation: Stations.Station;
   begin
      if from_station /= TYPES.No and to_Station /= TYPES.No then
         base_Location:= from_station;
         if getStationByName(stations_list   => stations_list,
                             stationLocation => base_Location).ID = 0
         then

            station:=  getStationByName(stations_list   => r_system.All_Stations,
                                        stationLocation => base_Location);
            station.Location := base_Location;
            if station.Location /= TYPES.No and station.ID > 0 and station.ID< MAX_SIZE then
               LIST_STATIONS.APPEND(A  => stations_list,
                                    D  => station,
                                    ID => station.ID);
            end if;
            while LIST_STATIONS.GET_SIZE(A => stations_list) /=0
            loop
               temp_Location:=LIST_STATIONS.GET_ELEMENT(A        => stations_list,
                                                        LOCATION => LIST_STATIONS.GET_SIZE(A => stations_list)).Location;
               Print_Station_Locations("temp_Location", temp_Location);

               LIST_STATIONS.DELETE_LAST(A => stations_list);
               if LIST_STATIONS.CONTAINS(A => visted_list,
                                         D => getStationByName(stations_list        => r_system.All_Stations,
                                                               stationLocation => temp_Location)) then
                  Print_Station_Locations("already visted: ",temp_Location);
               else
                  station:=  getStationByName(stations_list   => r_system.All_Stations,
                                              stationLocation => temp_Location);
                  if station.Location /= TYPES.No and station.ID > 0 and station.ID< MAX_SIZE then
                     LIST_STATIONS.APPEND(A  => visted_list,
                                          D  => station,
                                          ID => station.ID);
                  end if;
                  if temp_Location = to_Station then
                     tempStation:=getStationByName(stations_list   => r_system.All_Stations,
                                                   stationLocation => to_Station);
                     tempStation.isReachable:=True;
                     if tempStation.ID>0 and tempStation.ID<MAX_SIZE and tempStation.Location /= TYPES.No then
                     replaceStation(r_system => r_system,
                                    station  => tempStation);
                     end if;
                     return;
                  end if;
                  for Index in 1 .. Stations.LIST_TRACKS.GET_SIZE(A => r_system.All_Tracks)
                  loop
                     if Stations.LIST_TRACKS.GET_ELEMENT(A        => r_system.All_Tracks,
                                                         LOCATION => Index).Origin = temp_Location then

                        station2:=  getStationByName(stations_list   => r_system.All_Stations,
                                                     stationLocation => Stations.LIST_TRACKS.GET_ELEMENT(A        => r_system.All_Tracks,
                                                                                                         LOCATION => Index).Destination);
                        Print_Station_Locations("destination",Stations.LIST_TRACKS.GET_ELEMENT(A        => r_system.All_Tracks,
                                                                                               LOCATION => Index).Destination);
                        if station2.Location /= TYPES.No and station2.ID > 0 and station2.ID< MAX_SIZE then
                           LIST_STATIONS.APPEND(A  => Stations_list,
                                                D  => station2,
                                                ID => station2.ID);
                           Print_Station_Locations("add",station2.Location);
                        end if;
                     end if;
                  end loop;
               end if;
            end loop;
         end if;
      end if;
   end dfs_station_reachability_by_stations;


   -----------------------------------------------------------------
   -- Prepare Train: set train origin, destination and atart time --
   -----------------------------------------------------------------
   procedure prepareTrain(r_system: in out RailSystem;
                          train: in out Trains.Train;
                          Origin: in TYPES.Station_Locations;
                          Destination: in TYPES.Station_Locations;
                          StartTime: in TYPES.TimeTable)
   is
      tempOriginStation: Stations.Station;

   begin
      train.Origin := Origin;
      train.Destination := Destination;
      train.State:=TYPES.Open;
      train.Start_Run_Time:=StartTime;
      train.Location.currentLocation:="Station";
      train.Location.Station := getStationByName(r_system.All_Stations, Origin);
      train.Location.Station.TrainID:= train.ID;
      train.Location.Track.TrainID :=0;
      tempOriginStation:= getStationByName(stations_list   => r_system.All_Stations,
                                           stationLocation => Origin);
      tempOriginStation.TrainID:= train.ID;
      if tempOriginStation.ID>0 and tempOriginStation.ID<MAX_SIZE and tempOriginStation.Location /= TYPES.No then
         replaceStation(r_system, tempOriginStation);
      end if;
      if train.ID>0 and train.ID<MAX_SIZE then
         replaceTrain(r_system => r_system,
                      train    => train);
      end if;

   end prepareTrain;

   ---------------------------------------------------------
   -- get station by station name                         --
   -- search through the list find station by station name--
   ---------------------------------------------------------

   function getStationByName(stations_list: in RailSystems.LIST_STATIONS.List_PTR;
                             stationLocation: in TYPES.Station_Locations)
                             return Stations.Station
   is
      temp: Stations.Station;

   begin
      pragma Warnings(Off, temp);
      if stationLocation /=TYPES.No then
         for i in 1 .. RailSystems.LIST_STATIONS.GET_SIZE(stations_list) loop
            if RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(stations_list, i).Location = stationLocation then
               return RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(stations_list, i);
            end if;
         end loop;
      end  if;
      return temp;
   end getStationByName;

   ---------------------------------
   -- get track by station name --
   ---------------------------------

   function getTrackByName(r_system: in RailSystem;
                           Origin: in TYPES.Station_Locations;
                           Destination: in TYPES.Station_Locations)
                              return Tracks.Track
   is
      temp: Tracks.Track;
   begin
      --        InitTrack(temp);
      --        temp.ID:=0;
      --        temp.Origin:= TYPES.No;
      --        temp.Destination:=TYPES.No;
      --        temp.TrainID:=0;
      for i in 1 .. Stations.LIST_TRACKS.GET_SIZE(r_system.All_Tracks) loop
         if Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(r_system.All_Tracks, i).Origin = Origin
           and Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(r_system.All_Tracks,i).Destination = Destination then
            temp:= Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(r_system.All_Tracks, i);
         end if;
      end loop;
      return temp;
   end getTrackByName;


   -------------------------------------------------------------------------
   -- addTrack: if id exist  or origin and destination exist will not add --
   -------------------------------------------------------------------------

   procedure addTrack(r_system: in out RailSystem;
                      ID: in Natural;
                      Origin: in TYPES.Station_Locations;
                      Destination: in TYPES.Station_Locations;
                      LineOrigin: in TYPES.Station_Locations;
                      LineDestination: in TYPES.Station_Locations)
   is
      track: Tracks.Track;
   begin
      track.ID:=ID;
      track.Origin:= Origin;
      track.Destination:= Destination;
      track.TracksLineOrigin:= LineOrigin;
      track.TracksLineDestination:=LineDestination;
      if Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(r_system.All_Tracks, ID).ID = 0 then
         if track.ID /=0 and track.Origin /=TYPES.No and track.Destination /= types.No and track.TrainID = 0 and track.TracksLineOrigin /=types.No and track.TracksLineDestination/= TYPES.No then
            Stations.LIST_TRACKS.APPEND(r_system.All_Tracks,track, ID);
         end if;
      end if;

   end addTrack;

   ---------------------------------------------
   -- addTrain: if train id exist will not add--
   ---------------------------------------------

   procedure addTrain (r_system: in out RailSystem;
                       ID: in Natural)
   is
      train: Trains.Train;
      ID_Out_Of_Range_Exception: Exception;

   begin
      train.ID := ID;
      if LIST_TRAINS.GET_ELEMENT_BY_ID(r_system.All_Trains, ID).ID = 0 then
         if train.ID /=0 then
            LIST_TRAINS.APPEND(r_system.All_Trains, train,ID);
         end if;

      end if;
   end addTrain;

   ---------------------
   -- get train by id --
   ---------------------
   function getTrainById(r_system: in RailSystem; ID: in Natural)
                            return Trains.Train
   is
      Get_Train_By_ID_ID_Out_Of_Range_Exception: Exception;
      train: Trains.train;
   begin
      train:= RailSystems.LIST_TRAINS.GET_ELEMENT_BY_ID(r_system.All_Trains, ID);
      return train;
   end getTrainById;

   ----------------
   -- addStation --
   ----------------

   procedure addStation
     (r_system: in out RailSystem;
      ID: in Natural;
      Location: in TYPES.Station_Locations)
   is
      station: Stations.Station;
   begin

      station.ID := ID;
      station.Location := Location;
      if LIST_STATIONS.GET_ELEMENT_BY_ID(r_system.All_Stations, ID).ID = 0 then
         if Station.Location /= TYPES.No then
            LIST_STATIONS.APPEND(r_system.All_Stations, station,ID);
         end if;
      end if;




   end addStation;


   -------------------------------------------------------
   -- replace Track: this procedure is going to make  ----
   -- sure to update railsysem once track modified    ----
   -------------------------------------------------------
   procedure replaceTrack(r_system: in out RailSystem;
                          track: in Tracks.Track)
   is
      begin
         for i in 1..Stations.LIST_TRACKS.GET_SIZE(A => r_system.All_Tracks) loop
            if Stations.LIST_TRACKS.GET_ELEMENT(A        => r_system.All_Tracks,
                                                LOCATION => i).Origin = track.Origin
              and  Stations.LIST_TRACKS.GET_ELEMENT(A        => r_system.All_Tracks,
                                                    LOCATION => i).Destination = track.Destination
              and Stations.LIST_TRACKS.GET_ELEMENT(A        => r_system.All_Tracks,
                                                   LOCATION => i).ID = track.ID then
               Stations.LIST_TRACKS.REPLACE_BY_ID(r_system.All_Tracks,track.ID,track);
            end if;

         end loop;

      end replaceTrack;

   -------------------------------------------------------
   -- replace train: this procedure is going to make  ----
   -- sure to update railsysem once train modified    ----
   -------------------------------------------------------
      procedure replaceTrain(r_system: in out RailSystem;
                             train: in Trains.Train)
      is
      begin
         if train.Location.Station.ID>0 and train.Location.Station.ID <MAX_SIZE then
            for i in 1.. LIST_TRAINS.GET_SIZE(A => r_system.All_Trains) loop
               if LIST_TRAINS.GET_ELEMENT(A        => r_system.All_Trains,
                                          LOCATION => i).ID = train.ID then
                  LIST_TRAINS.REPLACE_BY_ID(r_system.All_Trains,train.ID,train);
               end if;
            end loop;
         end if;

      end replaceTrain;
   ---------------------------------------------------------
   -- replace station: this procedure is going to make  ----
   -- sure to update railsysem once station modified    ----
   ---------------------------------------------------------
      procedure replaceStation(r_system: in out RailSystem;
                               station: in Stations.Station)
      is
      begin
         if station.ID /=0 then
            for i in 1..LIST_STATIONS.GET_SIZE(A => r_system.All_Stations) loop
               if LIST_STATIONS.GET_ELEMENT(A        => r_system.All_Stations,
                                            LOCATION => i).Location = station.Location
                 and LIST_STATIONS.GET_ELEMENT(A        => r_system.All_Stations,
                                               LOCATION => i).ID = station.ID then
                  LIST_STATIONS.REPLACE_BY_ID(r_system.All_Stations,station.ID,station);

               end if;
            end loop;
         end if;

      end replaceStation;


      --------------------------------------------------------------------------------
      --- addIncomingOutgoingTracksForStation: go through each station and tracks ----
      --- add all the same tracks origin to origin station and add all same tracks----
      --- destination to destination station                                      ----
      --------------------------------------------------------------------------------
      procedure addIncomingOutgoingTracksForEachStation(r_system: in out RailSystem)
      is
         tempStation: Stations.Station;
         tempTrack: Tracks.Track;
         od_record: TYPES.ODRecord;
         size: Natural;
         found: Boolean;
      begin

         for i in 1 .. LIST_STATIONS.GET_SIZE(r_system.All_Stations) loop
            tempStation:= LIST_STATIONS.GET_ELEMENT_BY_ID(r_system.All_Stations, i);

            for j in 1 ..Stations.LIST_TRACKS.GET_SIZE(r_system.All_Tracks) loop
               tempTrack:= Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(r_system.All_Tracks, j);
               if tempTrack.Origin = tempStation.Location then
                  if Stations.LIST_TRACKS.CONTAINS(tempStation.Outgoing, tempTrack) = False then
                     if tempTrack.ID /=0 and tempTrack.Origin /=TYPES.No and tempTrack.Destination /= types.No and tempTrack.TrainID = 0 and tempTrack.TracksLineOrigin /=types.No and tempTrack.TracksLineDestination/= TYPES.No
                       and tempTrack.Origin /=tempTrack.Destination and tempTrack.TracksLineOrigin /= tempTrack.TracksLineDestination
                     then
                        if tempTrack.ID>0 and tempTrack.ID<MAX_SIZE then
                           Stations.LIST_TRACKS.APPEND(tempStation.Outgoing, tempTrack, tempTrack.ID);
                        end if;

                     end if;

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
                           if od_record.Origin /= od_record.Destination then
                              TYPES.LIST_OD.APPEND(tempStation.TracksLineOriginAndDestination, od_record,1);
                           end if;

                        end if;
                     end if;
                  end if;
               elsif tempTrack.Destination = tempStation.Location then
                  if Stations.LIST_TRACKS.CONTAINS(tempStation.Incoming, tempTrack) = False then
                     if tempTrack.ID /=0 and tempTrack.Origin /=TYPES.No and tempTrack.Destination /= types.No and tempTrack.TrainID = 0 and tempTrack.TracksLineOrigin /=types.No and tempTrack.TracksLineDestination/= TYPES.No
                       and tempTrack.TracksLineOrigin /= tempTrack.TracksLineDestination then
                        if tempTrack.ID>0 and tempTrack.ID<MAX_SIZE then
                           Stations.LIST_TRACKS.APPEND(tempStation.Incoming, tempTrack, tempTrack.ID);
                        end if;

                     end if;

                  end if;
               end if;
            end loop;
            if tempStation.ID>0 and tempStation.ID<MAX_SIZE and tempStation.Location /= TYPES.No then
               replaceStation(r_system,tempStation);
            end if;

         end loop;
      end addIncomingOutgoingTracksForEachStation;


   procedure resetIsReachable(r_system: in out RailSystem)
   is
      tempStation: Stations.Station;
      tempTrain: Trains.Train;
   begin
      for i in 1 .. LIST_STATIONS.GET_SIZE(A => r_system.All_Stations) loop
         tempStation:=LIST_STATIONS.GET_ELEMENT(A        => r_system.All_Stations,
                                                LOCATION => i);
         tempStation.isReachable:= False;
         if tempStation.ID >0 and tempStation.ID<MAX_SIZE and tempStation.Location /=TYPES.No then
            replaceStation(r_system => r_system,
                           station  => tempStation);
         end if;
      end loop;

      for i in 1 .. LIST_TRAINS.GET_SIZE(A => r_system.All_Trains) loop
         tempTrain:=LIST_TRAINS.GET_ELEMENT(A        => r_system.All_Trains,
                                            LOCATION => i);
         tempTrain.isReachable:= False;
         if tempTrain.ID>0 and tempTrain.ID<MAX_SIZE then
            replaceTrain(r_system => r_system,
                         train    =>tempTrain);
         end if;
      end loop;

   end resetIsReachable;


   end RailSystems;
