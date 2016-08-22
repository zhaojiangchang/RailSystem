with Ada.Text_IO; use Ada.Text_IO;
with AUnit.Assertions; use AUnit.Assertions;
with sPrint;
package body RailSystems.Test is

   System_r: RailSystem;
   trainsList: LIST_TRAINS.LIST_PTR;
   stationsList: LIST_STATIONS.LIST_PTR;
   tracksList: Stations.LIST_TRACKS.LIST_PTR;
   incomingTracks: Stations.LIST_TRACKS.LIST_PTR;
   outgoingTracks: Stations.LIST_TRACKS.LIST_PTR;


   procedure Set_Up_Case (T: in out TC) is
      pragma Unreferenced (T);

   begin
      New_Line;
      Put_Line ("Set up case ..");
      --        trainsList := Stations.LIST_TRACKS.LIST;
      stationsList := new LIST_STATIONS.LIST;
      trainsList:= new LIST_TRAINS.LIST;
      tracksList := new Stations.LIST_TRACKS.LIST;
      LIST_STATIONS.DELETE_ALL(System_r.All_Stations);
      LIST_TRAINS.DELETE_ALL(System_r.All_Trains);
      Stations.LIST_TRACKS.DELETE_ALL(System_r.All_Tracks);
   end Set_Up_Case;


   procedure Set_Up (T : in out TC) is
   begin
      New_Line;
      Put_Line("Set Up ..");
      LIST_STATIONS.DELETE_ALL(System_r.All_Stations);
      LIST_TRAINS.DELETE_ALL(System_r.All_Trains);
      Stations.LIST_TRACKS.DELETE_ALL(System_r.All_Tracks);

   end;

   procedure Tear_Down (T : in out TC) is
   begin
      Put_Line("Tear Down ...");
      LIST_STATIONS.DELETE_ALL(System_r.All_Stations);
      LIST_TRAINS.DELETE_ALL(System_r.All_Trains);
      Stations.LIST_TRACKS.DELETE_ALL(System_r.All_Tracks);



   end;

   procedure Tear_Down_Case (T : in out TC) is
   begin
      Put_Line ("Tear Down Case ..");
      LIST_STATIONS.DELETE_ALL(System_r.All_Stations);
      LIST_TRAINS.DELETE_ALL(System_r.All_Trains);
      Stations.LIST_TRACKS.DELETE_ALL(System_r.All_Tracks);

   end;

   -- ===========================================================
   --                 TEST CASES/SCENARIOS
   -- ===========================================================
   procedure Test_AddTrain (CWTC : in out AUnit.Test_Cases.Test_Case'Class) is
      track1: Tracks.Track;
      track2: Tracks.Track;
--        stationWellington: Stations.Station;
--        StationUpperHutt: Stations.Station;
--        StationJohnsonville: Stations.Station;
      currentLocaiton: Trains.Location_Type;

   begin
      Put_Line("");
      Put_Line("Test add train");
      currentLocaiton :=(Trains.L_Track=>1,Trains.L_Station=>2,Trains.L_Non=>0);
      Put_Line(currentLocaiton(Trains.L_Track)'Image);
--        addTrain(System_r,1,currentLocaiton(Trains.L_Non));
--        addTrain(System_r,2,Trains.L_Station);
--        addTrain(System_r,3,Trains.L_Track);

      track1.ID:=1;
      track1.Origin:= Tracks.Wellington;
      track1.Destination:= Tracks.UpperHutt;

      track2.ID:=2;
      track2.Origin:= Tracks.Wellington;
      track2.Destination:= Tracks.Johnsonville;

      incomingTracks := new Stations.LIST_TRACKS.LIST;
      outGoingTracks := new Stations.LIST_TRACKS.LIST;
      --add track 1
      addTrack(System_r,track1);
      --add track 2
      addTrack(System_r,track2);
      -- add station wellington
      Stations.LIST_TRACKS.APPEND_TO_FIRST(incomingTracks, track1);
      Stations.LIST_TRACKS.APPEND_TO_FIRST(outGoingTracks, track1);
      Stations.LIST_TRACKS.APPEND_TO_FIRST(incomingTracks, track2);
      Stations.LIST_TRACKS.APPEND_TO_FIRST(outGoingTracks, track2);
      addStation(System_r,1,Stations.Wellington, incomingTracks, outgoingTracks);
      Put_Line("wellington station incoming tracks: "& Stations.LIST_TRACKS.GET_SIZE(incomingTracks)'Image);
      Stations.LIST_TRACKS.DELETE_ALL(incomingTracks);
      Stations.LIST_TRACKS.DELETE_ALL(outgoingTracks);
      --add station johnsonville
      Stations.LIST_TRACKS.APPEND_TO_FIRST(incomingTracks, track2);
      Stations.LIST_TRACKS.APPEND_TO_FIRST(outGoingTracks, track2);
      addStation(System_r,1,Stations.Johnsonville, incomingTracks, outgoingTracks);
      Put_Line("Johnsonville station incoming tracks: "& Stations.LIST_TRACKS.GET_SIZE(incomingTracks)'Image);
      Stations.LIST_TRACKS.DELETE_ALL(incomingTracks);
      Stations.LIST_TRACKS.DELETE_ALL(outgoingTracks);

      --







--        Assert (Condition => (GET_TANKS_SIZE(UNIT_1.PUMP_95) = 1000.00),
--                Message => "Did not add  95 pump to pump unit");
--        Assert (Condition => (GET_TANKS_SIZE(UNIT_1.PUMP_91) = 1000.00),
--                Message => "Did not add 91 pump to pump unit");
--        Assert (Condition => (GET_TANKS_SIZE(UNIT_1.PUMP_Diesel) = 1000.00),
--                Message => "Did not add diesel pump to pump unit");
   end Test_AddTrain;

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
   end Register_Tests;

   function Name (T: TC) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Tests: Standard Tests");
   end Name;

end RailSystems.Test;
