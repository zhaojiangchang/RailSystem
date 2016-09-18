with Ada.Text_IO; use Ada.Text_IO;
with AUnit.Assertions; use AUnit.Assertions;
with TYPES;
with sPrint;
package body RailSystems.Test is

   rail_system: RailSystem;
   use all type TYPES.Station_Locations;
   use all type TYPES.MAX_SIZE;
   use all type TYPES.Train_State;
   TrainA: Trains.Train;
   TrainB: Trains.Train;
   TrainC: Trains.Train;
   procedure Set_Up_Case (T: in out TC) is
      pragma Unreferenced (T);
      TrainA: Trains.Train;
      TrainB: Trains.Train;
      TrainC: Trains.Train;
   begin
      New_Line;
      Put_Line ("Set up case ..");

   end Set_Up_Case;


   procedure Set_Up (T : in out TC) is
      TrainA: Trains.Train;
      TrainB: Trains.Train;
      TrainC: Trains.Train;
   begin
      New_Line;
      Put_Line("Set Up ..");
      Put_Line ("finish Set up ..");

   end;

   procedure Tear_Down (T : in out TC) is
      TrainA: Trains.Train;
      TrainB: Trains.Train;
      TrainC: Trains.Train;
   begin
      Put_Line("Tear Down ...");

   end;

   procedure Tear_Down_Case (T : in out TC) is
      TrainA: Trains.Train;
      TrainB: Trains.Train;
      TrainC: Trains.Train;
   begin
      Put_Line ("Tear Down Case ..");

   end;

   -- ===========================================================
   --                 TEST CASES/SCENARIOS
   -- ===========================================================

   procedure Test_dfs_station_reachability_by_train (CWTC : in out AUnit.Test_Cases.Test_Case'Class)
   is
      TrainA: Trains.Train;
   begin
      Init(r_system => rail_system);
      Put_Line("");
      Put_Line("Test_dfs_station_reachability_by_train");

      addTrain(rail_system, 1);
      --           setTrainLocation(rail_system, trainB, "None");
      TrainA := getTrainById(rail_system,1);

      addTrack(rail_system,  1, TYPES.Wellington, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt);
      addTrack(rail_system,  2, TYPES.Petone, TYPES.LowerHutt, TYPES.Wellington, TYPES.UpperHutt);
      addTrack(rail_system,  3, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington, TYPES.UpperHutt);

      addTrack(rail_system,  4, TYPES.Wellington, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville);
      addTrack(rail_system,  5, TYPES.CroftonDowns, TYPES.Ngaio, TYPES.Wellington, TYPES.Johnsonville);
      addTrack(rail_system,  6, TYPES.Ngaio, TYPES.Khandallah, TYPES.Wellington, TYPES.Johnsonville);
      addTrack(rail_system,  7, TYPES.Khandallah, TYPES.Johnsonville, TYPES.Wellington, TYPES.Johnsonville);

      addTrack(rail_system,  8, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt, TYPES.Wellington);
      addTrack(rail_system,  9, TYPES.LowerHutt, TYPES.Petone, TYPES.UpperHutt, TYPES.Wellington);
      addTrack(rail_system,  10, TYPES.UpperHutt, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington);

      addTrack(rail_system,  11, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville, TYPES.Wellington);
      addTrack(rail_system,  12, TYPES.Ngaio, TYPES.CroftonDowns, TYPES.Johnsonville, TYPES.Wellington);
      addTrack(rail_system,  13, TYPES.Khandallah, TYPES.Ngaio, TYPES.Johnsonville, TYPES.Wellington);
      addTrack(rail_system,  14, TYPES.Johnsonville, TYPES.Khandallah, TYPES.Johnsonville, TYPES.Wellington);
      addTrack(rail_system,  15, TYPES.Johnsonville, TYPES.UpperHutt, TYPES.Johnsonville, TYPES.UpperHutt);
      addTrack(rail_system,  16, TYPES.UpperHutt, TYPES.Johnsonville, TYPES.UpperHutt, TYPES.Johnsonville);

      addStation(rail_system, 1,TYPES.Wellington);
      addStation(rail_system, 2,TYPES.Johnsonville);
      addStation(rail_system, 3,TYPES.UpperHutt);
      addStation(rail_system, 4,TYPES.LowerHutt);
      addStation(rail_system, 5,TYPES.Petone);
      addStation(rail_system, 6,TYPES.CroftonDowns);
      addStation(rail_system, 7,TYPES.Ngaio);
      addStation(rail_system, 8,TYPES.Khandallah);
      addIncomingOutgoingTracksForEachStation(rail_system);

      prepareTrain(rail_system, trainA, Types.Wellington, Types.Johnsonville, TYPES.S8);
      dfs_station_reachability_by_train(rail_system, trainA);
      Assert (Condition => (trainA.isReachable) = True,
              Message => "Test_dfs_station_reachability_by_train: reachable from wellington to johnsonvile");
   end Test_dfs_station_reachability_by_train;

   procedure Test_dfs_station_reachability_by_train_station_trainid_equls_zero_Exception (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is
         TrainA: Trains.Train;
      begin
           Init(r_system => rail_system);
      Put_Line("");
      Put_Line("Test_dfs_station_reachability_by_train_station_trainid_equls_zero_Exception");

      addTrain(rail_system, 1);
      --           setTrainLocation(rail_system, trainB, "None");
      TrainA := getTrainById(rail_system,1);


      addTrack(rail_system,  1, TYPES.Wellington, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville);
      addTrack(rail_system,  2, TYPES.CroftonDowns, TYPES.Ngaio, TYPES.Wellington, TYPES.Johnsonville);
      addTrack(rail_system,  3, TYPES.Ngaio, TYPES.Khandallah, TYPES.Wellington, TYPES.Johnsonville);
      addTrack(rail_system,  4, TYPES.Khandallah, TYPES.Johnsonville, TYPES.Wellington, TYPES.Johnsonville);

      addTrack(rail_system,  5, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville, TYPES.Wellington);
      addTrack(rail_system,  6, TYPES.Ngaio, TYPES.CroftonDowns, TYPES.Johnsonville, TYPES.Wellington);
      addTrack(rail_system,  7, TYPES.Khandallah, TYPES.Ngaio, TYPES.Johnsonville, TYPES.Wellington);
      addTrack(rail_system,  8, TYPES.Johnsonville, TYPES.Khandallah, TYPES.Johnsonville, TYPES.Wellington);


      addStation(rail_system, 1,TYPES.Wellington);
      addStation(rail_system, 2,TYPES.Johnsonville);
      addStation(rail_system, 3,TYPES.CroftonDowns);
      addStation(rail_system, 4,TYPES.Ngaio);
      addStation(rail_system, 5,TYPES.Khandallah);
      addIncomingOutgoingTracksForEachStation(rail_system);

         prepareTrain(rail_system, trainA, Types.Wellington, Types.Johnsonville, TYPES.S8);
         TrainA.Location.Station.Location:= TYPES.No;
         replaceStation(r_system => rail_system,
                        station  => getStationByName(stations_list   => rail_system.All_Stations,
                                                     stationLocation => trainA.Location.Station.Location));
         dfs_station_reachability_by_train(rail_system, trainA);
      end;
   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"Test_dfs_station_reachability_by_train_station_trainid_equls_zero_Exception: train.location.station.trainId = 0");
   end Test_dfs_station_reachability_by_train_station_trainid_equls_zero_Exception;

   procedure Test_dfs_station_reachability_by_train_base_location_No_Exception (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is
         TrainA: Trains.Train;
      begin
           Init(r_system => rail_system);
      Put_Line("");
      Put_Line("Test_dfs_station_reachability_by_train_base_location_No_Exception");

      addTrain(rail_system, 1);
      --           setTrainLocation(rail_system, trainB, "None");
      TrainA := getTrainById(rail_system,1);


      addTrack(rail_system,  1, TYPES.Wellington, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville);
      addTrack(rail_system,  2, TYPES.CroftonDowns, TYPES.Ngaio, TYPES.Wellington, TYPES.Johnsonville);
      addTrack(rail_system,  3, TYPES.Ngaio, TYPES.Khandallah, TYPES.Wellington, TYPES.Johnsonville);
      addTrack(rail_system,  4, TYPES.Khandallah, TYPES.Johnsonville, TYPES.Wellington, TYPES.Johnsonville);

      addTrack(rail_system,  5, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville, TYPES.Wellington);
      addTrack(rail_system,  6, TYPES.Ngaio, TYPES.CroftonDowns, TYPES.Johnsonville, TYPES.Wellington);
      addTrack(rail_system,  7, TYPES.Khandallah, TYPES.Ngaio, TYPES.Johnsonville, TYPES.Wellington);
      addTrack(rail_system,  8, TYPES.Johnsonville, TYPES.Khandallah, TYPES.Johnsonville, TYPES.Wellington);


      addStation(rail_system, 1,TYPES.Wellington);
      addStation(rail_system, 2,TYPES.Johnsonville);
      addStation(rail_system, 3,TYPES.CroftonDowns);
      addStation(rail_system, 4,TYPES.Ngaio);
      addStation(rail_system, 5,TYPES.Khandallah);
      addIncomingOutgoingTracksForEachStation(rail_system);

         prepareTrain(rail_system, trainA, Types.Wellington, Types.Johnsonville, TYPES.S8);
         TrainA.Location.Station.TrainID:= 0;
         replaceTrain(r_system => rail_system,
                      train    => trainA);
         dfs_station_reachability_by_train(rail_system, trainA);
      end;
   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"Test_dfs_station_reachability_by_train_base_location_No_Exception: train.location.station.trainId = 0");
   end Test_dfs_station_reachability_by_train_base_location_No_Exception;

   procedure Test_dfs_station_reachability_by_stations (CWTC : in out AUnit.Test_Cases.Test_Case'Class)
   is
      TrainA: Trains.Train;
   begin
      Init(r_system => rail_system);
      Put_Line("");
      Put_Line("Test_dfs_station_reachability_by_stations");

      addTrain(rail_system, 1);
      --           setTrainLocation(rail_system, trainB, "None");
      TrainA := getTrainById(rail_system,1);

      addTrack(rail_system,  1, TYPES.Wellington, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt);
      addTrack(rail_system,  2, TYPES.Petone, TYPES.LowerHutt, TYPES.Wellington, TYPES.UpperHutt);
      addTrack(rail_system,  3, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington, TYPES.UpperHutt);

      addTrack(rail_system,  4, TYPES.Wellington, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville);
      addTrack(rail_system,  5, TYPES.CroftonDowns, TYPES.Ngaio, TYPES.Wellington, TYPES.Johnsonville);
      addTrack(rail_system,  6, TYPES.Ngaio, TYPES.Khandallah, TYPES.Wellington, TYPES.Johnsonville);
      addTrack(rail_system,  7, TYPES.Khandallah, TYPES.Johnsonville, TYPES.Wellington, TYPES.Johnsonville);

      addTrack(rail_system,  8, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt, TYPES.Wellington);
      addTrack(rail_system,  9, TYPES.LowerHutt, TYPES.Petone, TYPES.UpperHutt, TYPES.Wellington);
      addTrack(rail_system,  10, TYPES.UpperHutt, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington);

      addTrack(rail_system,  11, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville, TYPES.Wellington);
      addTrack(rail_system,  12, TYPES.Ngaio, TYPES.CroftonDowns, TYPES.Johnsonville, TYPES.Wellington);
      addTrack(rail_system,  13, TYPES.Khandallah, TYPES.Ngaio, TYPES.Johnsonville, TYPES.Wellington);
      addTrack(rail_system,  14, TYPES.Johnsonville, TYPES.Khandallah, TYPES.Johnsonville, TYPES.Wellington);
      addTrack(rail_system,  15, TYPES.Johnsonville, TYPES.UpperHutt, TYPES.Johnsonville, TYPES.UpperHutt);
      addTrack(rail_system,  16, TYPES.UpperHutt, TYPES.Johnsonville, TYPES.UpperHutt, TYPES.Johnsonville);

      addStation(rail_system, 1,TYPES.Wellington);
      addStation(rail_system, 2,TYPES.Johnsonville);
      addStation(rail_system, 3,TYPES.UpperHutt);
      addStation(rail_system, 4,TYPES.LowerHutt);
      addStation(rail_system, 5,TYPES.Petone);
      addStation(rail_system, 6,TYPES.CroftonDowns);
      addStation(rail_system, 7,TYPES.Ngaio);
      addStation(rail_system, 8,TYPES.Khandallah);
      addIncomingOutgoingTracksForEachStation(rail_system);
      dfs_station_reachability_by_stations(rail_system, TYPES.Wellington, TYPES.Johnsonville);
      Assert (Condition => (getStationByName(stations_list   => rail_system.All_Stations,
                                             stationLocation => TYPES.Johnsonville).isReachable) = True,
              Message => "Test_dfs_station_reachability_by_stations: reachable from wellington to johnsonvile");
       dfs_station_reachability_by_stations(rail_system, TYPES.Wellington, TYPES.UpperHutt);
      Assert (Condition => (getStationByName(stations_list   => rail_system.All_Stations,
                                             stationLocation => TYPES.UpperHutt).isReachable) = True,
              Message => "Test_dfs_station_reachability_by_stations: reachable from wellington to UpperHutt");
       dfs_station_reachability_by_stations(rail_system, TYPES.Wellington, TYPES.Johnsonville);
      Assert (Condition => (getStationByName(stations_list   => rail_system.All_Stations,
                                             stationLocation => TYPES.Johnsonville).isReachable) = True,
              Message => "Test_dfs_station_reachability_by_stations: reachable from wellington to johnsonvile");
       dfs_station_reachability_by_stations(rail_system, TYPES.UpperHutt, TYPES.Johnsonville);
      Assert (Condition => (getStationByName(stations_list   => rail_system.All_Stations,
                                             stationLocation => TYPES.Johnsonville).isReachable) = True,
              Message => "Test_dfs_station_reachability_by_stations: reachable from UpperHutt to johnsonvile");
   end Test_dfs_station_reachability_by_stations;

   procedure Test_GET_ELEMENT_No_Found (CWTC : in out AUnit.Test_Cases.Test_Case'Class)
   is

      station: Stations.Station;
   begin
      Put_Line("");
      Put_Line("Test add station");
      addStation(rail_system, 1,TYPES.Wellington);
      station:=LIST_STATIONS.GET_ELEMENT(A        => rail_system.All_Stations,
                                         LOCATION => 0);
      Assert (Condition => (station.ID) = 0,
              Message => "Test_GET_ELEMENT_No_Found: Station not found");

   end Test_GET_ELEMENT_No_Found;

   procedure Test_Contains(CWTC : in out AUnit.Test_Cases.Test_Case'Class)
   is

      station: Stations.Station;
      contain: Boolean;
   begin
      Put_Line("");
      Put_Line("Test add station");
      Init(r_system => rail_system);
      addStation(rail_system, 1,TYPES.Wellington);
      contain:=LIST_STATIONS.CONTAINS(A        => rail_system.All_Stations,
                                      D => LIST_STATIONS.GET_ELEMENT_BY_ID(A  => rail_system.All_Stations,
                                                                           ID => 1));
      Assert (Condition => (contain) = True,
              Message => "Test_Contains: true");

   end Test_Contains;


   procedure Test_AddTrain (CWTC : in out AUnit.Test_Cases.Test_Case'Class)
   is

      TrainA: Trains.Train;
      TrainB: Trains.Train;
      TrainC: Trains.Train;
   begin
      Put_Line("");
      Put_Line("Test add train");
      Init(r_system => rail_system);

      addTrain(rail_system, 1);
      -- Set train 1 current location to None (not on the railsystem)
      --        setTrainLocation(rail_system, trainA, "None", 1);
      TrainA := getTrainById(rail_system,1);


      addTrain(rail_system, 2);
      -- Set train 2 current location to None (not on the railsystem)
      --        setTrainLocation(rail_system, trainB, "None", 2);
      TrainB := getTrainById(rail_system,2);

      addTrain(rail_system, 3);
      -- Set train 3 current location to None (not on the railsystem)
      --        setTrainLocation(rail_system, trainC, "None", 3);
      TrainC := getTrainById(rail_system,3);

      Put_Line("total trains size: "& LIST_TRAINS.GET_SIZE(rail_system.All_Trains)'Image);

      Assert (Condition => TrainA.ID = 1,
              Message => "trainA.id = 1");
   end Test_AddTrain;

   procedure Test_AddTrack (CWTC : in out AUnit.Test_Cases.Test_Case'Class)
   is
   begin
      Put_Line("");
      Put_Line("Test add tracks");
      Init(r_system => rail_system);
      addTrack(rail_system,  1, TYPES.Wellington, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt);

      Assert (Condition => (Stations.LIST_TRACKS.GET_SIZE(rail_system.All_Tracks)) = 1,
              Message => "total tracks added should = 1");
      Assert (Condition => (Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(rail_system.All_Tracks, 1).Origin) = TYPES.Wellington,
              Message=>"track origin should equals Wellington");
      Assert (Condition => (Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(A  => rail_system.All_Tracks,
                                                                   ID => 1).Destination) = TYPES.Petone,
              Message=>"track Destination should equals Petone");
   end Test_AddTrack;


   procedure Test_AddStation (CWTC : in out AUnit.Test_Cases.Test_Case'Class)
   is


   begin
      Put_Line("");
      Put_Line("Test add station");
      Init(r_system => rail_system);
      addStation(rail_system, 1,TYPES.Wellington);

      Assert (Condition => (LIST_STATIONS.GET_SIZE(rail_system.All_Stations)) = 1,
              Message => "total station added should = 1");
      Assert (Condition => (LIST_STATIONS.GET_ELEMENT_BY_ID(A  => rail_system.All_Stations,
                                                            ID => 1).Location) = TYPES.Wellington,
              Message=>"station location should equals Wellington");
   end Test_AddStation;


   procedure Test_AddIncomingTracksAndOutgoingTracks (CWTC : in out AUnit.Test_Cases.Test_Case'Class)
   is


   begin
      Put_Line("");
      Put_Line("Test_AddIncomingTracksAndOutgoingTracks");
      Init(r_system => rail_system);

      addTrack(rail_system,  1, TYPES.Wellington, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt);
      addTrack(rail_system,  2, TYPES.Petone, TYPES.LowerHutt, TYPES.Wellington, TYPES.UpperHutt);
      addTrack(rail_system,  3, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington, TYPES.UpperHutt);

      addTrack(rail_system,  4, TYPES.Wellington, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville);
      addTrack(rail_system,  5, TYPES.CroftonDowns, TYPES.Ngaio, TYPES.Wellington, TYPES.Johnsonville);
      addTrack(rail_system,  6, TYPES.Ngaio, TYPES.Khandallah, TYPES.Wellington, TYPES.Johnsonville);
      addTrack(rail_system,  7, TYPES.Khandallah, TYPES.Johnsonville, TYPES.Wellington, TYPES.Johnsonville);

      addTrack(rail_system,  8, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt, TYPES.Wellington);
      addTrack(rail_system,  9, TYPES.LowerHutt, TYPES.Petone, TYPES.UpperHutt, TYPES.Wellington);
      addTrack(rail_system,  10, TYPES.UpperHutt, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington);

      addTrack(rail_system,  11, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville, TYPES.Wellington);
      addTrack(rail_system,  12, TYPES.Ngaio, TYPES.CroftonDowns, TYPES.Johnsonville, TYPES.Wellington);
      addTrack(rail_system,  13, TYPES.Khandallah, TYPES.Ngaio, TYPES.Johnsonville, TYPES.Wellington);
      addTrack(rail_system,  14, TYPES.Johnsonville, TYPES.Khandallah, TYPES.Johnsonville, TYPES.Wellington);

      addTrack(rail_system,  15, TYPES.Johnsonville, TYPES.UpperHutt, TYPES.Johnsonville, TYPES.UpperHutt);
      addTrack(rail_system,  16, TYPES.UpperHutt, TYPES.Johnsonville, TYPES.UpperHutt, TYPES.Johnsonville);

      addStation(rail_system, 1,TYPES.Wellington);
      addStation(rail_system, 2,TYPES.Johnsonville);
      addStation(rail_system, 3,TYPES.UpperHutt);
      addStation(rail_system, 4,TYPES.LowerHutt);
      addStation(rail_system, 5,TYPES.Petone);
      addStation(rail_system, 6,TYPES.CroftonDowns);
      addStation(rail_system, 7,TYPES.Ngaio);
      addStation(rail_system, 8,TYPES.Khandallah);

      addIncomingOutgoingTracksForEachStation(rail_system);

      Assert (Condition => (Stations.LIST_TRACKS.GET_SIZE(LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations, 1).Incoming)) = 2,
              Message => "wellington incoming tracks = 2");
      Assert (Condition => (Stations.LIST_TRACKS.GET_SIZE(LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations, 1).Outgoing)) = 2,
              Message => "wellington outgoing tracks = 2");
      Assert (Condition => (Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(A  => LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,1).Outgoing,
                                                                   ID => 1).Origin) = TYPES.Wellington,
              Message => "wellington outgoing track id 1's origin should equal wellington");
      Put_Line(Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(A  => LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,1).Outgoing,
                                                      ID => 1).Destination'Image);
      Assert (Condition => (Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(A  => LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,1).Outgoing,
                                                                   ID => 1).Destination) = TYPES.PETONE,
              Message => "wellington outgoing track id 1's Destination should equal PETONE");
   end Test_AddIncomingTracksAndOutgoingTracks;


   procedure Test_AlreadyAddTrackException (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is
      begin
         Put_Line("");
         Put_Line("Test_AlreadyAddTrackException");
         Init(r_system => rail_system);
         addTrack(rail_system,  1, TYPES.Wellington, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt);
         addTrack(rail_system,  1, TYPES.Wellington, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt);

      end;
   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"ADD TRACK: track already exist");
   end Test_AlreadyAddTrackException;

   procedure Test_AddTrackTrackIDAlreadyUsedException (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is
      begin
         Put_Line("");
         Put_Line("Test_AddTrackTrackIDAlreadyUsedException");
         Init(r_system => rail_system);
         addTrack(rail_system,  1, TYPES.Wellington, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt);
         addTrack(rail_system,  1, TYPES.Wellington, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville);

      end;
   begin

      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"ADD TRACK: track ID already used");

   end Test_AddTrackTrackIDAlreadyUsedException;

   procedure Test_AddTrack_Origin_Destination_Not_Station_Location_Exception (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is
      begin
         Put_Line("");
         Put_Line("Test_AddTrack_Origin_Destination_Not_Station_Location_Exception");
         Init(r_system => rail_system);
         addTrack(rail_system,  1, TYPES.No, TYPES.No, TYPES.Wellington, TYPES.UpperHutt);

      end;
   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"ADD TRACK: Origin or Destionation has to be a Station location");
   end Test_AddTrack_Origin_Destination_Not_Station_Location_Exception;

   procedure Test_AddTrack_Origin_equal_Destination_Exception (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is
      begin
         Put_Line("");
         Put_Line("Test_AddTrack_Origin_equal_Destination_Exception");
         Init(r_system => rail_system);
         addTrack(rail_system,  1, TYPES.Wellington, TYPES.Wellington, TYPES.Wellington, TYPES.UpperHutt);

      end;
   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"ADD TRACK:  track Origin should not equals Destination");
   end Test_AddTrack_Origin_equal_Destination_Exception;


   procedure Test_AddTrack_Tracks_Line_Origin_Destination_Equal_Exception (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is
      begin
         Put_Line("");
         Put_Line("Test_AddTrack_Tracks_Line_Origin_Destination_Equal_Exception");
         Init(r_system => rail_system);
         addTrack(rail_system,  1, TYPES.Wellington, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Wellington);

      end;
   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"ADD TRACK: Tracks line origin should not equals tracks line destination");
   end Test_AddTrack_Tracks_Line_Origin_Destination_Equal_Exception;

   procedure Test_AddTrack_ID_Out_Of_Range_Less_1_Exception (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is
      begin
         Put_Line("");
         Put_Line("Test_AlreadyAddTrackException");
         Init(r_system => rail_system);
         addTrack(rail_system, 0, TYPES.Wellington, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville);
      end;
   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"ADD TRACK: ID should not less than 1");
   end Test_AddTrack_ID_Out_Of_Range_Less_1_Exception;

   procedure Test_AddTrack_ID_Out_Of_Range_Great_100_Exception (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is
      begin
         Put_Line("");
         Put_Line("Test_AddTrack_ID_Out_Of_Range_Great_100_Exception");
         Init(r_system => rail_system);
         addTrack(rail_system, 101, TYPES.Wellington, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville);

      end;
   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"ADD TRACK: ID should not Great than 100");
   end Test_AddTrack_ID_Out_Of_Range_Great_100_Exception;

   procedure Test_Get_Train_By_ID_ID_Out_Of_Range_Less_1_Exception (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is
         TrainA: Trains.Train;
      begin
         Put_Line("");
         Put_Line("Test_Get_Train_By_ID_ID_Out_Of_Range_Less_1_Exception");
         Init(r_system => rail_system);

         addTrain(rail_system, 1);
         -- Set train 1 current location to None (not on the railsystem)
         --           setTrainLocation(rail_system, trainA, "None");
         TrainA := getTrainById(rail_system,0);
      end;
   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"GET TRAIN BY ID: id should not less than 1");
   end Test_Get_Train_By_ID_ID_Out_Of_Range_Less_1_Exception;

   procedure Test_Get_Train_By_ID_ID_Out_Of_Range_Great_Train_Size_Exception (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is
         TrainA: Trains.Train;
      begin
         Put_Line("");
         Put_Line("Test_Get_Train_By_ID_ID_Out_Of_Range_Great_Train_Size_Exception");
         Init(r_system => rail_system);

         addTrain(rail_system, 1);
         -- Set train 1 current location to None (not on the railsystem)
         --           setTrainLocation(rail_system, trainA, "None");
         TrainA := getTrainById(rail_system,2);
      end;
   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"GET TRAIN BY ID: id out great than the size of the trains");
   end Test_Get_Train_By_ID_ID_Out_Of_Range_Great_Train_Size_Exception;


   procedure Test_Add_Train_ID_Out_Of_Range_Less_1_Exception (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is

      begin
         Put_Line("");
         Put_Line("Test_Add_Train_ID_Out_Of_Range_Less_1_Exception");
         Init(r_system => rail_system);
         addTrain(rail_system, 0);
         -- Set train 1 current location to None (not on the railsystem)

      end;
   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"ADD TRAIN: ID should between 1 and 100");
   end Test_Add_Train_ID_Out_Of_Range_Less_1_Exception;

   procedure Test_Add_Train_ID_Out_Of_Range_Great_MaxSize_Exception (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is

      begin
         Put_Line("");
         Put_Line("Test_Add_Train_ID_Out_Of_Range_Great_MaxSize_Exception");
         Init(r_system => rail_system);

         addTrain(rail_system, 1000);
      end;

   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"ADD TRAIN: ID should between 1 and 100");
   end Test_Add_Train_ID_Out_Of_Range_Great_MaxSize_Exception;


   procedure Test_Add_Station_Station_ID_Already_Exist_Exception (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is

      begin
         Put_Line("");
         Put_Line("Test_Add_Station_Station_ID_Already_Exist_Exception");
         Init(r_system => rail_system);

         addStation(rail_system, 1,TYPES.Wellington);
         addStation(rail_system, 1,TYPES.Johnsonville);
      end;

   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"ADD STATION: station id already exist");
   end Test_Add_Station_Station_ID_Already_Exist_Exception;


   procedure Test_Add_Station_Location_Already_Exist_Exception (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is

      begin
         Put_Line("");
         Put_Line("Test_Add_Station_Location_Already_Exist_Exception");
         Init(r_system => rail_system);

         addStation(rail_system, 1,TYPES.Wellington);
         addStation(rail_system, 2,TYPES.Wellington);
      end;

   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"ADD STATION: station id already exist");
   end Test_Add_Station_Location_Already_Exist_Exception;

   procedure Test_Add_Station_ID_Out_Of_Range_Less_1_Exception (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is

      begin
         Put_Line("");
         Put_Line("Test_Add_Station_ID_Out_Of_Range_Less_1_Exception");
         Init(r_system => rail_system);

         addStation(rail_system, 0,TYPES.Wellington);
         -- Set train 1 current location to None (not on the railsystem)

      end;
   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"ADD Station: ID should between 1 and 100");
   end Test_Add_Station_ID_Out_Of_Range_Less_1_Exception;

   procedure Test_Add_Station_ID_Out_Of_Range_Great_MaxSize_Exception (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is

      begin
         Put_Line("");
         Put_Line("Test_Add_Station_ID_Out_Of_Range_Great_MaxSize_Exception");
         Init(r_system => rail_system);

         addStation(rail_system, 101,TYPES.Wellington);
      end;

   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"ADD Station: ID should between 1 and 100");

   end Test_Add_Station_ID_Out_Of_Range_Great_MaxSize_Exception;


   --     procedure Test_Set_Train_Location_LocationID_Out_Of_Range_Exception_Less_1 (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
   --        procedure Test_Raising_Exception is
   --           TrainA: Trains.Train;
   --        begin
   --           Put_Line("");
   --           Put_Line("Test_Set_Train_Location_LocationID_Out_Of_Range_Exception_Less_1");
   --
   --           addTrain(rail_system, 1);
   --  --           setTrainLocation(rail_system, trainA, "None");
   --
   --
   --        end;
   --     begin
   --        Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
   --                          Message =>"ADD Station: ID should between 1 and 100");
   --     end Test_Set_Train_Location_LocationID_Out_Of_Range_Exception_Less_1;
   --
   --     procedure Test_Set_Train_Location_LocationID_Out_Of_Range_Exception_Great_Trains_Size (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
   --        procedure Test_Raising_Exception is
   --           TrainA: Trains.Train;
   --        begin
   --           Put_Line("");
   --           Put_Line("Test_Set_Train_Location_LocationID_Out_Of_Range_Exception_Great_Trains_Size");
   --
   --           addTrain(rail_system, 1);
   --  --           setTrainLocation(rail_system, trainA, "None");
   --        end;
   --
   --     begin
   --        Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
   --                          Message =>"ADD Station: ID should between 1 and 100");
   --     end Test_Set_Train_Location_LocationID_Out_Of_Range_Exception_Great_Trains_Size;
   --
   --
   --     procedure Test_Set_Train_Location_LocationName_Incorrect_Exception (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
   --        procedure Test_Raising_Exception is
   --           TrainA: Trains.Train;
   --        begin
   --           Put_Line("");
   --           Put_Line("Test_Set_Train_Location_LocationName_Incorrect_Exception");
   --
   --           addTrain(rail_system, 1);
   --  --           setTrainLocation(rail_system, trainA, "a");
   --        end;
   --
   --     begin
   --        Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
   --                          Message =>"SET TRAIN LOCATION: location name should be None");
   --     end Test_Set_Train_Location_LocationName_Incorrect_Exception;

   procedure Test_PrepareTrain (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      TrainA: Trains.Train;

   begin
      Put_Line("");
      Put_Line("Test_PrepareTrain");
      Init(r_system => rail_system);

      addTrain(rail_system, 1);
      --        setTrainLocation(rail_system, trainA, "None");
      TrainA := getTrainById(rail_system,1);

      addTrack(rail_system,  1, TYPES.Wellington, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt);
      addTrack(rail_system,  2, TYPES.Petone, TYPES.LowerHutt, TYPES.Wellington, TYPES.UpperHutt);
      addTrack(rail_system,  3, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington, TYPES.UpperHutt);
      addTrack(rail_system,  4, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt, TYPES.Wellington);
      addTrack(rail_system,  5, TYPES.LowerHutt, TYPES.Petone, TYPES.UpperHutt, TYPES.Wellington);
      addTrack(rail_system,  6, TYPES.UpperHutt, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington);

      addStation(rail_system, 1,TYPES.Wellington);
      addStation(rail_system, 2,TYPES.UpperHutt);
      addStation(rail_system, 3,TYPES.LowerHutt);
      addStation(rail_system, 4,TYPES.Petone);

      addIncomingOutgoingTracksForEachStation(rail_system);

      prepareTrain(rail_system, trainA, Types.Wellington, Types.UpperHutt, TYPES.S8);

      Put_Line(TrainA.Location.Track.ID'Image);
      Put_Line(TrainA.Location.Track.Destination'Image);
      Put_Line(TrainA.Location.Track.Origin'Image);
      Put_Line(TrainA.Location.currentLocation);


      Assert (Condition => (TrainA.Origin) = TYPES.Wellington,
              Message =>"TrainA.Origin = Wellington");
      Assert (Condition => (TrainA.State) = TYPES.Open,
              Message =>"TrainA.State = Open");
   end Test_PrepareTrain;


   procedure Test_PrepareTrain_Origin_Should_Not_Equals_No (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is
         TrainA: Trains.Train;
      begin
         Put_Line("");
         Put_Line("Test_PrepareTrain_Origin_Should_Not_Equals_No");
         Init(r_system => rail_system);

         addTrain(rail_system, 1);
         --        setTrainLocation(rail_system, trainA, "None");
         TrainA := getTrainById(rail_system,1);

         addTrack(rail_system,  1, TYPES.Wellington, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt);
         addTrack(rail_system,  2, TYPES.Petone, TYPES.LowerHutt, TYPES.Wellington, TYPES.UpperHutt);
         addTrack(rail_system,  3, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington, TYPES.UpperHutt);
         addTrack(rail_system,  4, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt, TYPES.Wellington);
         addTrack(rail_system,  5, TYPES.LowerHutt, TYPES.Petone, TYPES.UpperHutt, TYPES.Wellington);
         addTrack(rail_system,  6, TYPES.UpperHutt, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington);

         addStation(rail_system, 1,TYPES.Wellington);
         addStation(rail_system, 2,TYPES.UpperHutt);
         addStation(rail_system, 3,TYPES.LowerHutt);
         addStation(rail_system, 4,TYPES.Petone);

         addIncomingOutgoingTracksForEachStation(rail_system);

         prepareTrain(rail_system, trainA, Types.No, Types.UpperHutt, TYPES.S8);
      end;

   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"PREPARE TRAIN: Origin should not be TYPES.No");
   end Test_PrepareTrain_Origin_Should_Not_Equals_No;

   procedure Test_PrepareTrain_Destionation_Should_Not_Equals_No (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is
         TrainA: Trains.Train;
      begin
         Put_Line("");
         Put_Line("Test_PrepareTrain_Destionation_Should_Not_Equals_No");
         Init(r_system => rail_system);

         addTrain(rail_system, 1);
         --        setTrainLocation(rail_system, trainA, "None");
         TrainA := getTrainById(rail_system,1);

         addTrack(rail_system,  1, TYPES.Wellington, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt);
         addTrack(rail_system,  2, TYPES.Petone, TYPES.LowerHutt, TYPES.Wellington, TYPES.UpperHutt);
         addTrack(rail_system,  3, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington, TYPES.UpperHutt);
         addTrack(rail_system,  4, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt, TYPES.Wellington);
         addTrack(rail_system,  5, TYPES.LowerHutt, TYPES.Petone, TYPES.UpperHutt, TYPES.Wellington);
         addTrack(rail_system,  6, TYPES.UpperHutt, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington);

         addStation(rail_system, 1,TYPES.Wellington);
         addStation(rail_system, 2,TYPES.UpperHutt);
         addStation(rail_system, 3,TYPES.LowerHutt);
         addStation(rail_system, 4,TYPES.Petone);

         addIncomingOutgoingTracksForEachStation(rail_system);

         prepareTrain(rail_system, trainA, Types.Wellington, Types.No, TYPES.S8);
      end;

   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"PREPARE TRAIN: Destionation should not be TYPES.No");
   end Test_PrepareTrain_Destionation_Should_Not_Equals_No;

   procedure Test_PrepareTrain_Origin_Should_Not_Equals_Destionation (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is
         TrainA: Trains.Train;
      begin
         Put_Line("");
         Put_Line("Test_PrepareTrain_Origin_Should_Not_Equals_Destionation");
         Init(r_system => rail_system);

         addTrain(rail_system, 1);
         --           setTrainLocation(rail_system, trainA, "None");
         TrainA := getTrainById(rail_system,1);

         addTrack(rail_system,  1, TYPES.Wellington, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt);
         addTrack(rail_system,  2, TYPES.Petone, TYPES.LowerHutt, TYPES.Wellington, TYPES.UpperHutt);
         addTrack(rail_system,  3, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington, TYPES.UpperHutt);
         addTrack(rail_system,  4, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt, TYPES.Wellington);
         addTrack(rail_system,  5, TYPES.LowerHutt, TYPES.Petone, TYPES.UpperHutt, TYPES.Wellington);
         addTrack(rail_system,  6, TYPES.UpperHutt, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington);

         addStation(rail_system, 1,TYPES.Wellington);
         addStation(rail_system, 2,TYPES.UpperHutt);
         addStation(rail_system, 3,TYPES.LowerHutt);
         addStation(rail_system, 4,TYPES.Petone);

         addIncomingOutgoingTracksForEachStation(rail_system);

         prepareTrain(rail_system, trainA, Types.Wellington, Types.Wellington, TYPES.S8);
      end;

   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"PREPARE TRAIN: Destionation should not be TYPES.No");
   end Test_PrepareTrain_Origin_Should_Not_Equals_Destionation;


   procedure Test_PrepareTrain_Already_Train_At_Station (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is
         TrainA: Trains.Train;
         TrainB: Trains.Train;
         station: Stations.Station;
      begin
         Put_Line("");
         Put_Line("Test_PrepareTrain_Already_Train_At_Station");
         Init(r_system => rail_system);

         addTrain(rail_system, 1);
         --           setTrainLocation(rail_system, trainA, "None");
         TrainA := getTrainById(rail_system,1);
         addTrain(rail_system, 2);
         --           setTrainLocation(rail_system, trainB, "None");
         TrainB := getTrainById(rail_system,2);
         addTrack(rail_system,  1, TYPES.Wellington, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt);
         addTrack(rail_system,  2, TYPES.Petone, TYPES.LowerHutt, TYPES.Wellington, TYPES.UpperHutt);
         addTrack(rail_system,  3, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington, TYPES.UpperHutt);
         addTrack(rail_system,  4, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt, TYPES.Wellington);
         addTrack(rail_system,  5, TYPES.LowerHutt, TYPES.Petone, TYPES.UpperHutt, TYPES.Wellington);
         addTrack(rail_system,  6, TYPES.UpperHutt, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington);

         addStation(rail_system, 1,TYPES.Wellington);
         addStation(rail_system, 2,TYPES.UpperHutt);
         addStation(rail_system, 3,TYPES.LowerHutt);
         addStation(rail_system, 4,TYPES.Petone);

         addIncomingOutgoingTracksForEachStation(rail_system);
         TrainA.State:=TYPES.Open;
         TrainA.Origin:=TYPES.Wellington;
         TrainA.Destination:= TYPES.Johnsonville;
         TrainA.Location.Station.TrainID:=TrainA.ID;
         station:= LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations, 1);
         station.TrainID:=TrainA.ID;
         replaceStation(rail_system,station );
         prepareTrain(rail_system, trainB, Types.Wellington, Types.Johnsonville, TYPES.S8);
      end;

   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"PREPARE TRAIN: Already train at station");
   end Test_PrepareTrain_Already_Train_At_Station;

   procedure Test_PrepareTrain_Origin_Station_Destionation_Station_Not_Same_Route_Line (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is
         TrainB: Trains.Train;
      begin
         Put_Line("");
         Put_Line("Test_PrepareTrain_Origin_Station_Destionation_Station_Not_Same_Route_Line");
         Init(r_system => rail_system);

         addTrain(rail_system, 1);
         --           setTrainLocation(rail_system, trainB, "None");
         TrainB := getTrainById(rail_system,1);

         addTrack(rail_system,  1, TYPES.Wellington, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt);
         addTrack(rail_system,  2, TYPES.Petone, TYPES.LowerHutt, TYPES.Wellington, TYPES.UpperHutt);
         addTrack(rail_system,  3, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington, TYPES.UpperHutt);

         addTrack(rail_system,  4, TYPES.Wellington, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville);
         addTrack(rail_system,  5, TYPES.CroftonDowns, TYPES.Ngaio, TYPES.Wellington, TYPES.Johnsonville);
         addTrack(rail_system,  6, TYPES.Ngaio, TYPES.Khandallah, TYPES.Wellington, TYPES.Johnsonville);
         addTrack(rail_system,  7, TYPES.Khandallah, TYPES.Johnsonville, TYPES.Wellington, TYPES.Johnsonville);

         addTrack(rail_system,  8, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt, TYPES.Wellington);
         addTrack(rail_system,  9, TYPES.LowerHutt, TYPES.Petone, TYPES.UpperHutt, TYPES.Wellington);
         addTrack(rail_system,  10, TYPES.UpperHutt, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington);

         addTrack(rail_system,  11, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville, TYPES.Wellington);
         addTrack(rail_system,  12, TYPES.Ngaio, TYPES.CroftonDowns, TYPES.Johnsonville, TYPES.Wellington);
         addTrack(rail_system,  13, TYPES.Khandallah, TYPES.Ngaio, TYPES.Johnsonville, TYPES.Wellington);
         addTrack(rail_system,  14, TYPES.Johnsonville, TYPES.Khandallah, TYPES.Johnsonville, TYPES.Wellington);

         addStation(rail_system, 1,TYPES.Wellington);
         addStation(rail_system, 2,TYPES.Johnsonville);
         addStation(rail_system, 3,TYPES.UpperHutt);
         addStation(rail_system, 4,TYPES.LowerHutt);
         addStation(rail_system, 5,TYPES.Petone);
         addStation(rail_system, 6,TYPES.CroftonDowns);
         addStation(rail_system, 7,TYPES.Ngaio);
         addStation(rail_system, 8,TYPES.Khandallah);

         addIncomingOutgoingTracksForEachStation(rail_system);

         prepareTrain(rail_system, trainB, Types.UpperHutt, Types.Johnsonville, TYPES.S8);
      end;

   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"PREPARE TRAIN: Origin station and Destionation station not at the same route line");
   end Test_PrepareTrain_Origin_Station_Destionation_Station_Not_Same_Route_Line;

   procedure Test_Get_Station_By_Name (CWTC : in out AUnit.Test_Cases.Test_Case'Class)
   is

      station:Stations.Station;
   begin
      Put_Line("");
      Put_Line("Test_Get_Station_By_Name");
      Init(r_system => rail_system);


      addStation(rail_system, 1,TYPES.Wellington);
      station:= getStationByName(rail_system.All_Stations, TYPES.Wellington);

      Assert (Condition => (station.ID) = 1,
              Message => "StationLocation  = Wellington");

   end Test_Get_Station_By_Name;


   procedure Test_Get_Track_By_Name (CWTC : in out AUnit.Test_Cases.Test_Case'Class)
   is

      track:Tracks.Track;
   begin
      Put_Line("");
      Put_Line("Test_Get_Track_By_Name");

      Init(r_system => rail_system);

      addTrack(rail_system,  1, TYPES.Wellington, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt);

      track:= getTrackByName(rail_system, TYPES.Wellington, TYPES.Petone);

      Assert (Condition => (track.ID) = 1,
              Message => "track id = 1");
      track:= getTrackByName(rail_system, TYPES.Petone, TYPES.LowerHutt);

      Assert (Condition => (track.ID) = 0,
              Message => "track petone to lower hutt not exist");

   end Test_Get_Track_By_Name;

   procedure Test_Go(CWTC : in out AUnit.Test_Cases.Test_Case'Class)
   is
      TrainA: Trains.Train;
      TrainB: Trains.Train;

      track:Tracks.Track;
   begin
      Put_Line("");
      Put_Line("Test_Go");

      Init(r_system => rail_system);

      addTrain(rail_system, 1);
      TrainA := getTrainById(rail_system,1);
      addTrain(rail_system, 2);
      TrainB := getTrainById(rail_system,2);

      addTrack(rail_system,  1, TYPES.Wellington, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt);
      addTrack(rail_system,  2, TYPES.Petone, TYPES.LowerHutt, TYPES.Wellington, TYPES.UpperHutt);
      addTrack(rail_system,  3, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington, TYPES.UpperHutt);

      addTrack(rail_system,  4, TYPES.Wellington, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville);
      addTrack(rail_system,  5, TYPES.CroftonDowns, TYPES.Ngaio, TYPES.Wellington, TYPES.Johnsonville);
      addTrack(rail_system,  6, TYPES.Ngaio, TYPES.Khandallah, TYPES.Wellington, TYPES.Johnsonville);
      addTrack(rail_system,  7, TYPES.Khandallah, TYPES.Johnsonville, TYPES.Wellington, TYPES.Johnsonville);

      addTrack(rail_system,  8, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt, TYPES.Wellington);
      addTrack(rail_system,  9, TYPES.LowerHutt, TYPES.Petone, TYPES.UpperHutt, TYPES.Wellington);
      addTrack(rail_system,  10, TYPES.UpperHutt, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington);

      addTrack(rail_system,  11, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville, TYPES.Wellington);
      addTrack(rail_system,  12, TYPES.Ngaio, TYPES.CroftonDowns, TYPES.Johnsonville, TYPES.Wellington);
      addTrack(rail_system,  13, TYPES.Khandallah, TYPES.Ngaio, TYPES.Johnsonville, TYPES.Wellington);
      addTrack(rail_system,  14, TYPES.Johnsonville, TYPES.Khandallah, TYPES.Johnsonville, TYPES.Wellington);

      addStation(rail_system, 1,TYPES.Wellington);
      addStation(rail_system, 2,TYPES.Johnsonville);
      addStation(rail_system, 3,TYPES.UpperHutt);
      addStation(rail_system, 4,TYPES.LowerHutt);
      addStation(rail_system, 5,TYPES.Petone);
      addStation(rail_system, 6,TYPES.CroftonDowns);
      addStation(rail_system, 7,TYPES.Ngaio);
      addStation(rail_system, 8,TYPES.Khandallah);

      addIncomingOutgoingTracksForEachStation(rail_system);
      prepareTrain(rail_system, trainA, Types.Wellington, Types.Johnsonville, TYPES.S8);
      go(rail_system,trainA,10);


      Assert (Condition => (trainA.Location.Track.ID) = 14,
              Message => "TEST GO: trainA stop at Track id 14");
      Assert (Condition => (trainA.Location.Track.Origin) = TYPES.Johnsonville,
              Message => "TEST GO: trainA stop at Track origin: johnsonville");
      Assert (Condition => (trainA.Location.Track.Destination) = TYPES.Khandallah,
              Message => "TEST GO: trainA stop at Track destination: khandallah");
   end Test_Go;

   procedure Test_Go_Train_Already_On_Track (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is
         TrainA: Trains.Train;
         TrainB: Trains.Train;
      begin

         Put_Line("");
         Put_Line("Test_Go_Train_Already_On_Track");
         Init(r_system => rail_system);

         addTrain(rail_system, 1);
         --           setTrainLocation(rail_system, trainA, "None", 1);
         TrainA := getTrainById(rail_system,1);
         addTrain(rail_system, 2);
         --           setTrainLocation(rail_system, trainB, "None", 2);
         TrainB := getTrainById(rail_system,2);

         addTrack(rail_system,  1, TYPES.Wellington, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt);
         addTrack(rail_system,  2, TYPES.Petone, TYPES.LowerHutt, TYPES.Wellington, TYPES.UpperHutt);
         addTrack(rail_system,  3, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington, TYPES.UpperHutt);

         addTrack(rail_system,  4, TYPES.Wellington, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville);
         addTrack(rail_system,  5, TYPES.CroftonDowns, TYPES.Ngaio, TYPES.Wellington, TYPES.Johnsonville);
         addTrack(rail_system,  6, TYPES.Ngaio, TYPES.Khandallah, TYPES.Wellington, TYPES.Johnsonville);
         addTrack(rail_system,  7, TYPES.Khandallah, TYPES.Johnsonville, TYPES.Wellington, TYPES.Johnsonville);

         addTrack(rail_system,  8, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt, TYPES.Wellington);
         addTrack(rail_system,  9, TYPES.LowerHutt, TYPES.Petone, TYPES.UpperHutt, TYPES.Wellington);
         addTrack(rail_system,  10, TYPES.UpperHutt, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington);

         addTrack(rail_system,  11, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville, TYPES.Wellington);
         addTrack(rail_system,  12, TYPES.Ngaio, TYPES.CroftonDowns, TYPES.Johnsonville, TYPES.Wellington);
         addTrack(rail_system,  13, TYPES.Khandallah, TYPES.Ngaio, TYPES.Johnsonville, TYPES.Wellington);
         addTrack(rail_system,  14, TYPES.Johnsonville, TYPES.Khandallah, TYPES.Johnsonville, TYPES.Wellington);

         addStation(rail_system, 1,TYPES.Wellington);
         addStation(rail_system, 2,TYPES.Johnsonville);
         addStation(rail_system, 3,TYPES.UpperHutt);
         addStation(rail_system, 4,TYPES.LowerHutt);
         addStation(rail_system, 5,TYPES.Petone);
         addStation(rail_system, 6,TYPES.CroftonDowns);
         addStation(rail_system, 7,TYPES.Ngaio);
         addStation(rail_system, 8,TYPES.Khandallah);

         addIncomingOutgoingTracksForEachStation(rail_system);
         prepareTrain(rail_system, trainA, Types.Wellington, Types.Johnsonville, TYPES.S8);
         prepareTrain(rail_system, trainB, Types.Johnsonville, Types.Wellington, TYPES.S8);
         go(rail_system,trainA,10);
         go(rail_system,trainB,10);
      end;

   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"Test GO: trainA stopped at track id: 14, trainB can not move to track 14");
   end Test_Go_Train_Already_On_Track;

   --==========================================================
   --               REGISTRATION/NAMING
   --==========================================================
   --
   procedure Register_Tests (T: in out TC) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (Test => T,
                        Routine => Test_AddTrain'Access,
                        Name => "Test_AddTrain");
      Register_Routine (Test => T,
                        Routine => Test_AddTrack'Access,
                        Name => "Test_AddTrack");
      Register_Routine (Test => T,
                        Routine => Test_AddStation'Access,
                        Name => "Test_AddStation");
      Register_Routine (Test => T,
                        Routine => Test_AddIncomingTracksAndOutgoingTracks'Access,
                        Name => "Test_AddIncomingTracksAndOutgoingTracks");

      Register_Routine (Test => T,
                        Routine => Test_AlreadyAddTrackException'Access,
                        Name => "Test_AlreadyAddTrackException");

      Register_Routine (Test => T,
                        Routine => Test_AddTrackTrackIDAlreadyUsedException'Access,
                        Name => "Test_AddTrackTrackIDAlreadyUsedException");

      Register_Routine (Test => T,
                        Routine => Test_AddTrack_Origin_Destination_Not_Station_Location_Exception'Access,
                        Name => "Test_AddTrack_Origin_Destination_Not_Station_Location_Exception");

      Register_Routine (Test => T,
                        Routine => Test_AddTrack_Origin_equal_Destination_Exception'Access,
                        Name => "Test_AddTrack_Origin_equal_Destination_Exception");
      Register_Routine (Test => T,
                        Routine => Test_AddTrack_ID_Out_Of_Range_Less_1_Exception'Access,
                        Name => "Test_AddTrack_ID_Out_Of_Range_Less_1_Exception");
      Register_Routine (Test => T,
                        Routine => Test_AddTrack_ID_Out_Of_Range_Great_100_Exception'Access,
                        Name => "Test_AddTrack_ID_Out_Of_Range_Great_100_Exception");
      Register_Routine (Test => T,
                        Routine => Test_AddTrack_Tracks_Line_Origin_Destination_Equal_Exception'Access,
                        Name => "Test_AddTrack_Tracks_Line_Origin_Destination_Equal_Exception");
      Register_Routine (Test => T,
                        Routine => Test_Get_Train_By_ID_ID_Out_Of_Range_Less_1_Exception'Access,
                        Name => "Test_Get_Train_By_ID_ID_Out_Of_Range_Less_1_Exception");
      Register_Routine (Test => T,
                        Routine => Test_Get_Train_By_ID_ID_Out_Of_Range_Great_Train_Size_Exception'Access,
                        Name => "Test_Get_Train_By_ID_ID_Out_Of_Range_Great_Train_Size_Exception");
      Register_Routine (Test => T,
                        Routine => Test_Add_Train_ID_Out_Of_Range_Less_1_Exception'Access,
                        Name => "Test_Add_Train_ID_Out_Of_Range_Less_1_Exception");
      Register_Routine (Test => T,
                        Routine => Test_Add_Train_ID_Out_Of_Range_Great_MaxSize_Exception'Access,
                        Name => "Test_Add_Train_ID_Out_Of_Range_Great_MaxSize_Exception");
      Register_Routine (Test => T,
                        Routine => Test_Add_Station_Location_Already_Exist_Exception'Access,
                        Name => "Test_Add_Station_Location_Already_Exist_Exception");
      Register_Routine (Test => T,
                        Routine => Test_Add_Station_ID_Out_Of_Range_Less_1_Exception'Access,
                        Name => "Test_Add_Station_ID_Out_Of_Range_Less_1_Exception");

      Register_Routine (Test => T,
                        Routine => Test_Add_Station_ID_Out_Of_Range_Great_MaxSize_Exception'Access,
                        Name => "Test_Add_Station_ID_Out_Of_Range_Great_MaxSize_Exception");
      Register_Routine (Test => T,
                        Routine => Test_GET_ELEMENT_No_Found'Access,
                        Name => "Test_GET_ELEMENT_No_Found");
      Register_Routine (Test => T,
                        Routine => Test_Contains'Access,
                        Name => "Test_Contains");
      Register_Routine (Test => T,
                        Routine => Test_Add_Station_Station_ID_Already_Exist_Exception'Access,
                        Name => "Test_Add_Station_Station_ID_Already_Exist_Exception");

      Register_Routine (Test => T,
                        Routine => Test_PrepareTrain'Access,
                        Name => "Test_PrepareTrain");
      Register_Routine (Test => T,
                        Routine => Test_PrepareTrain_Origin_Should_Not_Equals_No'Access,
                        Name => "Test_PrepareTrain_Origin_Should_Not_Equals_No");
      Register_Routine (Test => T,
                        Routine => Test_PrepareTrain_Destionation_Should_Not_Equals_No'Access,
                        Name => "Test_PrepareTrain_Destionation_Should_Not_Equals_No");
      Register_Routine (Test => T,
                        Routine => Test_PrepareTrain_Origin_Should_Not_Equals_Destionation'Access,
                        Name => "Test_PrepareTrain_Origin_Should_Not_Equals_Destionation");

      Register_Routine (Test => T,
                        Routine => Test_PrepareTrain_Already_Train_At_Station'Access,
                        Name => "Test_PrepareTrain_Already_Train_At_Station");
      Register_Routine (Test => T,
                        Routine => Test_PrepareTrain_Origin_Station_Destionation_Station_Not_Same_Route_Line'Access,
                        Name => "Test_PrepareTrain_Origin_Station_Destionation_Station_Not_Same_Route_Line");
      Register_Routine (Test => T,
                        Routine => Test_Get_Station_By_Name'Access,
                        Name => "Test_Get_Station_By_Name");
      Register_Routine (Test => T,
                        Routine => Test_Get_Track_By_Name'Access,
                        Name => "Test_Get_Track_By_Name");
      Register_Routine (Test => T,
                        Routine => Test_Go'Access,
                        Name => "Test_Go");
      Register_Routine (Test => T,
                        Routine => Test_Go_Train_Already_On_Track'Access,
                        Name => "Test_Go_Train_Already_On_Track");
      Register_Routine (Test => T,
                        Routine => Test_dfs_station_reachability_by_train'Access,
                        Name => "Test_dfs_station_reachability_by_train");
      Register_Routine (Test => T,
                        Routine => Test_dfs_station_reachability_by_stations'Access,
                        Name => "Test_dfs_station_reachability_by_stations");

        Register_Routine (Test => T,
                        Routine => Test_dfs_station_reachability_by_train_base_location_No_Exception'Access,
                        Name => "Test_dfs_station_reachability_by_train_base_location_No_Exception");
 Register_Routine (Test => T,
                        Routine => Test_dfs_station_reachability_by_train_station_trainid_equls_zero_Exception'Access,
                        Name => "Test_dfs_station_reachability_by_train_station_trainid_equls_zero_Exception");




   end Register_Tests;

   function Name (T: TC) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Tests: Standard Tests");
   end Name;

end RailSystems.Test;
