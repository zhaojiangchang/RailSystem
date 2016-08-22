with RailSystems;
with Stations;
with Tracks;
with Trains;
with sPrint; use sPrint;
with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
   rail_system: RailSystems.RailSystem;
   trainsList: RailSystems.LIST_TRAINS.LIST_PTR;
   stationsList: RailSystems.LIST_STATIONS.LIST_PTR;
   tracksList: Stations.LIST_TRACKS.LIST_PTR;
   incomingTracks: Stations.LIST_TRACKS.LIST_PTR;
   outgoingTracks: Stations.LIST_TRACKS.LIST_PTR;

   track1: Tracks.Track;
   track2: Tracks.Track;

   currentLocaiton: Trains.Location_Type;
begin
   --  Insert code here.
   stationsList := new RailSystems.LIST_STATIONS.LIST;
   trainsList:= new RailSystems.LIST_TRAINS.LIST;
   tracksList := new Stations.LIST_TRACKS.LIST;

   currentLocaiton :=(Trains.L_Track=>1,Trains.L_Station=>2,Trains.L_Non=>0);
   Put_Line(currentLocaiton(Trains.L_Track)'Image);
   RailSystems.addTrain(rail_system,1,currentLocaiton(Trains.L_Non));
   RailSystems.addTrain(rail_system,2,currentLocaiton(Trains.L_Station));
   RailSystems.addTrain(rail_system,3,currentLocaiton(Trains.L_Track));

   track1.ID:=1;
   track1.Origin:= Tracks.Wellington;
   track1.Destination:= Tracks.UpperHutt;
    --add track 1
   RailSystems.addTrack(rail_system,track1);
   track2.ID:=2;
   track2.Origin:= Tracks.Wellington;
   track2.Destination:= Tracks.Johnsonville;
   --add track 2
   RailSystems.addTrack(rail_system,track2);

   incomingTracks := new Stations.LIST_TRACKS.LIST;
   outGoingTracks := new Stations.LIST_TRACKS.LIST;
   -- add station wellington
   Stations.LIST_TRACKS.APPEND_TO_FIRST(incomingTracks, track1);
   Stations.LIST_TRACKS.APPEND_TO_FIRST(outGoingTracks, track1);
   Stations.LIST_TRACKS.APPEND_TO_FIRST(incomingTracks, track2);
   Stations.LIST_TRACKS.APPEND_TO_FIRST(outGoingTracks, track2);
   RailSystems.addStation(rail_system,1,Stations.Wellington, incomingTracks, outgoingTracks);
   Put_Line("wellington station incoming tracks: "& Stations.LIST_TRACKS.GET_SIZE(incomingTracks)'Image);
   Stations.LIST_TRACKS.DELETE_ALL(incomingTracks);
   Stations.LIST_TRACKS.DELETE_ALL(outgoingTracks);
   --add station johnsonville
   Stations.LIST_TRACKS.APPEND_TO_FIRST(incomingTracks, track1);
   Stations.LIST_TRACKS.APPEND_TO_FIRST(outGoingTracks, track1);
   RailSystems.addStation(rail_system,2,Stations.Johnsonville, incomingTracks, outgoingTracks);
   Put_Line("Johnsonville station incoming tracks: "& Stations.LIST_TRACKS.GET_SIZE(incomingTracks)'Image);
   Stations.LIST_TRACKS.DELETE_ALL(incomingTracks);
   Stations.LIST_TRACKS.DELETE_ALL(outgoingTracks);

     --add station upper hutt
   Stations.LIST_TRACKS.APPEND_TO_FIRST(incomingTracks, track2);
   Stations.LIST_TRACKS.APPEND_TO_FIRST(outGoingTracks, track2);
   RailSystems.addStation(rail_system,3,Stations.UpperHutt, incomingTracks, outgoingTracks);
   Put_Line("Johnsonville station incoming tracks: "& Stations.LIST_TRACKS.GET_SIZE(incomingTracks)'Image);

end Main;
