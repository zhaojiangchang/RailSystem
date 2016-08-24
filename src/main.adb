with RailSystems;
with Stations;
with Tracks;
with Trains;
with TYPES;
with sPrint; use sPrint;
with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
   rail_system: RailSystems.RailSystem;
   intArray: TYPES.trackIDsArray;
   currentLocaiton: TYPES.Location_Type;
begin
   --  Insert code here.

   currentLocaiton :=(TYPES.L_Track=>1,TYPES.L_Station=>2,TYPES.L_Non=>0);
   --TODO: current location should be the record not integer
   RailSystems.addTrain(rail_system, 1,currentLocaiton(TYPES.L_Non));
   RailSystems.addTrain(rail_system, 2,currentLocaiton(TYPES.L_Station));
   RailSystems.addTrain(rail_system, 3,currentLocaiton(TYPES.L_Track));

   Put_Line("total trains size: "& RailSystems.LIST_TRAINS.GET_SIZE(rail_system.All_Trains)'Image);

   --add tracks
   RailSystems.addTrack(rail_system,  1, TYPES.Wellington, TYPES.UpperHutt);
   RailSystems.addTrack(rail_system,  2, TYPES.Wellington, TYPES.Johnsonville);
   RailSystems.addTrack(rail_system,  3, TYPES.Wellington, TYPES.LowerHutt);
   Put_Line("total tracks size: "&Stations.LIST_TRACKS.GET_SIZE(rail_system.All_Tracks)'Image);

   RailSystems.addStation(rail_system, 1,TYPES.Wellington);
   RailSystems.addStation(rail_system, 2,TYPES.Johnsonville);
   RailSystems.addStation(rail_system, 3,TYPES.UpperHutt);
   Put_Line("total stations size: "& RailSystems.LIST_STATIONS.GET_SIZE(rail_system.All_Stations)'Image);

   intArray:=(1=>1,others =>0);

   RailSystems.addIncomingTracksForStation(rail_system, 3, intArray);
   RailSystems.addOutgoingTracksForStation(rail_system, 3, intArray);
--
   intArray:=(1=>2,others =>0);
   RailSystems.addIncomingTracksForStation(rail_system, 2, intArray);
   RailSystems.addOutgoingTracksForStation(rail_system, 2, intArray);

   intArray:=(1=>1, 2=>2, 3=>3,others =>0);
   RailSystems.addIncomingTracksForStation(rail_system, 1, intArray);
   RailSystems.addOutgoingTracksForStation(rail_system, 1, intArray);



   --     intArray:=(1=>3,others =>0);
   --     RailSystems.addIncomingTracksForStation(rail_system, 3, intArray);
   --     RailSystems.addOutgoingTracksForStation(rail_system, 3, intArray);
   --     intArray:=(1=>2,others =>0);
   --     RailSystems.addIncomingTracksForStation(rail_system, 3, intArray);
   --     RailSystems.addOutgoingTracksForStation(rail_system, 3, intArray);

   Put_Line("station 1 incoming tracks size: "&  Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,1).Incoming)'Image);
   Put_Line("station 2 incoming tracks size: "&  Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,2).Incoming)'Image);
   Put_Line("station 3 incoming tracks size: "&  Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,3).Incoming)'Image);



end Main;
