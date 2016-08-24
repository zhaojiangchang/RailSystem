with Ada.Text_IO; use Ada.Text_IO;
with AUnit.Assertions; use AUnit.Assertions;
with sPrint;
package body RailSystems.Test is

   rail_system: RailSystem;

   use all type TYPES.MAX_SIZE;

   procedure Set_Up_Case (T: in out TC) is
      pragma Unreferenced (T);

   begin
      New_Line;
      Put_Line ("Set up case ..");

   end Set_Up_Case;


   procedure Set_Up (T : in out TC) is
   begin
      New_Line;
      Put_Line("Set Up ..");
      if LIST_STATIONS.GET_SIZE(rail_system.All_Stations) >0 then
         LIST_STATIONS.DELETE_ALL(rail_system.All_Stations);
      end if;
      if  LIST_TRAINS.GET_SIZE(rail_system.All_Trains) >0 then
         LIST_TRAINS.DELETE_ALL(rail_system.All_Trains);
      end if;
      if Stations.LIST_TRACKS.GET_SIZE(rail_system.All_Tracks) >0 then
         Stations.LIST_TRACKS.DELETE_ALL(rail_system.All_Tracks);
      end if;
      Put_Line ("finish Set up ..");


   end;

   procedure Tear_Down (T : in out TC) is
   begin
      Put_Line("Tear Down ...");
      if LIST_STATIONS.GET_SIZE(rail_system.All_Stations) >0 then
         LIST_STATIONS.DELETE_ALL(rail_system.All_Stations);
      end if;
      if  LIST_TRAINS.GET_SIZE(rail_system.All_Trains) >0 then
         LIST_TRAINS.DELETE_ALL(rail_system.All_Trains);
      end if;
      if Stations.LIST_TRACKS.GET_SIZE(rail_system.All_Tracks) >0 then
         Stations.LIST_TRACKS.DELETE_ALL(rail_system.All_Tracks);
      end if;



   end;

   procedure Tear_Down_Case (T : in out TC) is
   begin
      Put_Line ("Tear Down Case ..");
      if LIST_STATIONS.GET_SIZE(rail_system.All_Stations) >0 then
         LIST_STATIONS.DELETE_ALL(rail_system.All_Stations);
      end if;
      if  LIST_TRAINS.GET_SIZE(rail_system.All_Trains) >0 then
         LIST_TRAINS.DELETE_ALL(rail_system.All_Trains);
      end if;
      if Stations.LIST_TRACKS.GET_SIZE(rail_system.All_Tracks) >0 then
         Stations.LIST_TRACKS.DELETE_ALL(rail_system.All_Tracks);
      end if;

   end;

   -- ===========================================================
   --                 TEST CASES/SCENARIOS
   -- ===========================================================


   procedure Test_AddTrain (CWTC : in out AUnit.Test_Cases.Test_Case'Class) is


      currentLocaiton: TYPES.Location_Type;
      intArray: TYPES.trackIDsArray;
   begin
      Put_Line("");
      Put_Line("Test add train");
      currentLocaiton :=(TYPES.L_Track=>1,TYPES.L_Station=>2,TYPES.L_Non=>0);
      --TODO: current location should be the record not integer
      addTrain(rail_system, 1,currentLocaiton(TYPES.L_Non));
      addTrain(rail_system, 2,currentLocaiton(TYPES.L_Station));
      addTrain(rail_system, 3,currentLocaiton(TYPES.L_Track));

      Put_Line("total trains size: "& RailSystems.LIST_TRAINS.GET_SIZE(rail_system.All_Trains)'Image);

      --add tracks
      addTrack(rail_system,  1, TYPES.Wellington, TYPES.UpperHutt);
      addTrack(rail_system,  2, TYPES.Wellington, TYPES.Johnsonville);
      addTrack(rail_system,  3, TYPES.Wellington, TYPES.LowerHutt);
      Put_Line("total tracks size: "&Stations.LIST_TRACKS.GET_SIZE(rail_system.All_Tracks)'Image);

      addStation(rail_system, 1,TYPES.Wellington);
      addStation(rail_system, 2,TYPES.Johnsonville);
      addStation(rail_system, 3,TYPES.UpperHutt);
      Put_Line("total stations size: "& RailSystems.LIST_STATIONS.GET_SIZE(rail_system.All_Stations)'Image);

      intArray:=(1=>1,others =>0);

      addIncomingOutgoingTracksForStation(rail_system, 1, intArray, "Incoming");
      addIncomingOutgoingTracksForStation(rail_system, 1, intArray, "Outgoing");
      --
      intArray:=(1=>2,others =>0);
      addIncomingOutgoingTracksForStation(rail_system, 2, intArray, "Incoming");
      addIncomingOutgoingTracksForStation(rail_system, 2, intArray, "Outgoing");

      intArray:=(1=>1, 2=>2, 3=>3,others =>0);
      addIncomingOutgoingTracksForStation(rail_system, 3, intArray, "Incoming");
      addIncomingOutgoingTracksForStation(rail_system, 3, intArray, "Outgoing");



      --     intArray:=(1=>3,others =>0);
      --     RailSystems.addIncomingTracksForStation(rail_system, 3, intArray);
      --     RailSystems.addOutgoingTracksForStation(rail_system, 3, intArray);
      --     intArray:=(1=>2,others =>0);
      --     RailSystems.addIncomingTracksForStation(rail_system, 3, intArray);
      --     RailSystems.addOutgoingTracksForStation(rail_system, 3, intArray);

      Put_Line("station 1 incoming tracks size: "&  Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,1).Incoming)'Image);
      Put_Line("station 2 incoming tracks size: "&  Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,2).Incoming)'Image);
      Put_Line("station 3 incoming tracks size: "&  Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,3).Incoming)'Image);
      Put_Line("station 1 outgoing tracks size: "&  Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,1).Outgoing)'Image);
      Put_Line("station 2 outgoing tracks size: "&  Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,2).Outgoing)'Image);
      Put_Line("station 3 outgoing tracks size: "&  Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,3).Outgoing)'Image);


      Assert (Condition => (Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,1).Incoming) = 1),
              Message => "station 1 should income tracks = 1");

      Assert (Condition => (Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,2).Incoming) = 1),
              Message => "station 2 should income tracks = 1");

      Assert (Condition => (Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,3).Incoming) = 3),
              Message => "station 3 should income tracks = 3");
      Assert (Condition => (Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,1).Outgoing) = 1),
              Message => "station 1 should outgoing tracks = 1");

      Assert (Condition => (Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,2).Outgoing) = 1),
              Message => "station 2 should outgoing tracks = 1");

      Assert (Condition => (Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,3).Outgoing) = 3),
              Message => "station 3 should outgoing tracks = 3");
   end Test_AddTrain;

   procedure Test_AlreadyAddTrackException_Incoming (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is
         currentLocaiton: TYPES.Location_Type;
         intArray: TYPES.trackIDsArray;
      begin
         currentLocaiton :=(TYPES.L_Track=>1,TYPES.L_Station=>2,TYPES.L_Non=>0);
         --TODO: current location should be the record not integer
         addTrain(rail_system, 1,currentLocaiton(TYPES.L_Non));
         addTrack(rail_system,  1, TYPES.Wellington, TYPES.UpperHutt);
         addStation(rail_system, 1,TYPES.Wellington);

         intArray:=(1=>1,others =>0);

         addIncomingOutgoingTracksForStation(rail_system, 1, intArray, "Incoming");
         addIncomingOutgoingTracksForStation(rail_system, 1, intArray, "Outgoing");
         addIncomingOutgoingTracksForStation(rail_system, 1, intArray, "Incoming");


      end;
   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"can not add same track (station incoming tracks)");
   end Test_AlreadyAddTrackException_Incoming;


    procedure Test_AlreadyAddTrackException_Outgoing (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is
         currentLocaiton: TYPES.Location_Type;
         intArray: TYPES.trackIDsArray;
      begin
         currentLocaiton :=(TYPES.L_Track=>1,TYPES.L_Station=>2,TYPES.L_Non=>0);
         --TODO: current location should be the record not integer
         addTrain(rail_system, 1,currentLocaiton(TYPES.L_Non));
         addTrack(rail_system,  1, TYPES.Wellington, TYPES.UpperHutt);
         addStation(rail_system, 1,TYPES.Wellington);

         intArray:=(1=>1,others =>0);

         addIncomingOutgoingTracksForStation(rail_system, 1, intArray, "Incoming");
         addIncomingOutgoingTracksForStation(rail_system, 1, intArray, "Outgoing");
         addIncomingOutgoingTracksForStation(rail_system, 1, intArray, "Outgoing");


      end;
   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"can not add same track (station incoming tracks)");
   end Test_AlreadyAddTrackException_Outgoing;


   procedure Test_NotFindTrackIdException (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is
         currentLocaiton: TYPES.Location_Type;
         intArray: TYPES.trackIDsArray;
      begin
         currentLocaiton :=(TYPES.L_Track=>1,TYPES.L_Station=>2,TYPES.L_Non=>0);
         --TODO: current location should be the record not integer
         addTrain(rail_system, 1,currentLocaiton(TYPES.L_Non));
         addTrack(rail_system,  1, TYPES.Wellington, TYPES.UpperHutt);
         addStation(rail_system, 1,TYPES.Wellington);

         intArray:=(1=>2,others =>0);

         addIncomingOutgoingTracksForStation(rail_system, 1, intArray, "Incoming");
      end;
   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"track id not exist (station incoming tracks)");
   end Test_NotFindTrackIdException;

   procedure Test_StationIDNotExistException (CWTC: in out AUnit.Test_Cases.Test_Case'Class) is
      procedure Test_Raising_Exception is
         currentLocaiton: TYPES.Location_Type;
         intArray: TYPES.trackIDsArray;
      begin
         currentLocaiton :=(TYPES.L_Track=>1,TYPES.L_Station=>2,TYPES.L_Non=>0);
         --TODO: current location should be the record not integer
         addTrain(rail_system, 1,currentLocaiton(TYPES.L_Non));
         addTrack(rail_system,  1, TYPES.Wellington, TYPES.UpperHutt);
         addStation(rail_system, 1,TYPES.Wellington);

         intArray:=(1=>2,others =>0);

         addIncomingOutgoingTracksForStation(rail_system, 2, intArray, "Incoming");
      end;
   begin
      Assert_Exception (Proc => Test_Raising_Exception'Unrestricted_Access,
                        Message =>"station id not exist (station incoming tracks)");
   end Test_StationIDNotExistException;
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
                        Routine => Test_AlreadyAddTrackException_Incoming'Access,
                        Name => "Test_AlreadyAddTrackException_Incoming");
       Register_Routine (Test => T,
                        Routine => Test_AlreadyAddTrackException_Outgoing'Access,
                        Name => "Test_AlreadyAddTrackException_Outgoing");
      Register_Routine (Test => T,
                        Routine => Test_NotFindTrackIdException'Access,
                        Name => "Test_NotFindTrackIdException");
      Register_Routine (Test => T,
                        Routine => Test_StationIDNotExistException'Access,
                        Name => "Test_StationIDNotExistException");
   end Register_Tests;

   function Name (T: TC) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Tests: Standard Tests");
   end Name;

end RailSystems.Test;
