with RailSystems;
with Stations;
with Tracks;
with Trains;
with TYPES;
with sPrint; use sPrint;
--  with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
   rail_system: RailSystems.RailSystem;
   TrainA: Trains.Train;
   TrainB: Trains.Train;
   TrainC: Trains.Train;
   timeTable: TYPES.TimeTable:=TYPES.S8;

   size: Positive;
   tempSize: Positive;
begin
   RailSystems.Init(rail_system);
   RailSystems.addTrain(rail_system, 1);
   -- Set train 1 current location to None (not on the railsystem)
   RailSystems.setTrainLocation(rail_system, trainA, "None", 1);
   TrainA := RailSystems.getTrainById(rail_system,1);

   RailSystems.addTrain(rail_system, 2);
   -- Set train 2 current location to None (not on the railsystem)
   RailSystems.setTrainLocation(rail_system, trainB, "None", 2);
   TrainB := RailSystems.getTrainById(rail_system,2);

   RailSystems.addTrain(rail_system, 3);
   -- Set train 3 current location to None (not on the railsystem)
   RailSystems.setTrainLocation(rail_system, trainC, "None", 3);
   TrainC := RailSystems.getTrainById(rail_system,3);

   print("total trains size: "& RailSystems.LIST_TRAINS.GET_SIZE(rail_system.All_Trains)'Image);

   --add tracks
   RailSystems.addTrack(rail_system,  1, TYPES.Wellington, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt);
   RailSystems.addTrack(rail_system,  2, TYPES.Petone, TYPES.LowerHutt, TYPES.Wellington, TYPES.UpperHutt);
   RailSystems.addTrack(rail_system,  3, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington, TYPES.UpperHutt);

   RailSystems.addTrack(rail_system,  4, TYPES.Wellington, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville);
   RailSystems.addTrack(rail_system,  5, TYPES.CroftonDowns, TYPES.Ngaio, TYPES.Wellington, TYPES.Johnsonville);
   RailSystems.addTrack(rail_system,  6, TYPES.Ngaio, TYPES.Khandallah, TYPES.Wellington, TYPES.Johnsonville);
   RailSystems.addTrack(rail_system,  7, TYPES.Khandallah, TYPES.Johnsonville, TYPES.Wellington, TYPES.Johnsonville);

   RailSystems.addTrack(rail_system,  8, TYPES.Petone, TYPES.Wellington, TYPES.Wellington, TYPES.UpperHutt);
   RailSystems.addTrack(rail_system,  9, TYPES.LowerHutt, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt);
   RailSystems.addTrack(rail_system,  10, TYPES.UpperHutt, TYPES.LowerHutt, TYPES.Wellington, TYPES.UpperHutt);

   RailSystems.addTrack(rail_system,  11, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Wellington, TYPES.Johnsonville);
   RailSystems.addTrack(rail_system,  12, TYPES.Ngaio, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville);
   RailSystems.addTrack(rail_system,  13, TYPES.Khandallah, TYPES.Ngaio, TYPES.Wellington, TYPES.Johnsonville);
   RailSystems.addTrack(rail_system,  14, TYPES.Johnsonville, TYPES.Khandallah, TYPES.Wellington, TYPES.Johnsonville);

   print("total tracks size: "&Stations.LIST_TRACKS.GET_SIZE(rail_system.All_Tracks)'Image);

   RailSystems.addStation(rail_system, 1,TYPES.Wellington);
   RailSystems.addStation(rail_system, 2,TYPES.Johnsonville);
   RailSystems.addStation(rail_system, 3,TYPES.UpperHutt);
   RailSystems.addStation(rail_system, 4,TYPES.LowerHutt);
   RailSystems.addStation(rail_system, 5,TYPES.Petone);
   RailSystems.addStation(rail_system, 6,TYPES.CroftonDowns);
   RailSystems.addStation(rail_system, 7,TYPES.Ngaio);
   RailSystems.addStation(rail_system, 8,TYPES.Khandallah);

   print("total stations size: "& RailSystems.LIST_STATIONS.GET_SIZE(rail_system.All_Stations)'Image);

   RailSystems.addIncomingOutgoingTracksForEachStation(rail_system);
   size:= RailSystems.LIST_STATIONS.GET_SIZE(rail_system.All_Stations);
   print("");
   print("");
   print("Station info: ");
   for i in 1 .. size loop
      print("  station ID: "& i'Image &"  Location: "& RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Location'Image);
      tempSize:=TYPES.LIST_OD.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT(rail_system.All_Stations, i).TracksLineOriginAndDestination);
      for j in 1 .. tempSize loop
         print("    Route Line Between: "& Stations.LIST_TRACKS.GET_ELEMENT(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Incoming,j).TracksLineOrigin'Image &
                 " and "&Stations.LIST_TRACKS.GET_ELEMENT(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Incoming,j).TracksLineDestination'Image);
      end loop;

      print("");
      print("    incoming tracks size: "&  Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Incoming)'Image);
      for income in 1..  Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Incoming) loop
         Print("      Track id: "& Stations.LIST_TRACKS.GET_ELEMENT(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Incoming, income).ID'Image&
                 "  Between: "&Stations.LIST_TRACKS.GET_ELEMENT(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Incoming, income).Origin'Image&
                 " and "&Stations.LIST_TRACKS.GET_ELEMENT(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Incoming, income).Destination'Image);
      end loop;
      print("");
      print("    outgoing tracks size: "&  Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Outgoing)'Image);
      for outgo in 1..  Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Outgoing) loop
         Print("      Track id: "& Stations.LIST_TRACKS.GET_ELEMENT(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Outgoing, outgo).ID'Image&
                 "  Between: "&Stations.LIST_TRACKS.GET_ELEMENT(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Outgoing, outgo).Origin'Image&
                 " and "&Stations.LIST_TRACKS.GET_ELEMENT(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Outgoing, outgo).Destination'Image);
      end loop;
      print("-------------------------------------------------------------");
      print("=============================================================");
   end loop;


   --prepare train to start

   --parameter: rail system, train, From, To, Start run time at 8am
   RailSystems.prepareTrain(rail_system, trainA, Types.Wellington, Types.UpperHutt, TYPES.S8);
   RailSystems.go(rail_system, trainA);
   Print(trainA.Origin'Image);
   Print(trainA.ID'Image);

end Main;
