with Trains;
with Stations;
with Tracks;
with sPrint;
with LIST;
with TYPES;
package RailSystems
--  is
with SPARK_Mode=>On is
  tn : Trains.Train;
   package LIST_TRAINS is new LIST
     ( DATA_TYPE => Trains.Train,
       SIZE_TYPE => TYPES.MAX_SIZE,
       NO_FOUND => tn);

   sn : Stations.Station;
   package LIST_STATIONS is new LIST
     ( DATA_TYPE => Stations.Station,
       SIZE_TYPE => TYPES.MAX_SIZE,
       NO_FOUND => sn);


   type RailSystem is
      record
         All_Trains: LIST_TRAINS.LIST_PTR:= new LIST_TRAINS.LIST;
         All_Stations: LIST_STATIONS.LIST_PTR:= new LIST_STATIONS.LIST;
         All_Tracks: Stations.LIST_TRACKS.LIST_PTR:= new Stations.LIST_TRACKS.LIST;
      end record;

   --procedure
   procedure addTrack(r_system: in out RailSystem; ID: in TYPES.MAX_SIZE; Origin: in TYPES.Station_Locations; Destination: in TYPES.Station_Locations);
   procedure addStation(r_system: in out RailSystem; StationID: in TYPES.MAX_SIZE; Location: TYPES.Station_Locations);
   procedure replaceStation(r_system: in out RailSystem; StationID: in TYPES.MAX_SIZE; station: in Stations.Station);
   procedure addIncomingOutgoingTracksForEachStation(r_system: in out RailSystem);
   procedure setTrainLocation(r_system: in out RailSystem; train: in out Trains.Train;LocationName: in  String; LocationID: in TYPES.MAX_SIZE);
   procedure go(r_system: in out RailSystem; train: in out Trains.Train; Origin: in TYPES.Station_Locations; Destionation: in TYPES.Station_Locations);
   --function
   function addTrain (r_system: in out RailSystem; ID: in TYPES.MAX_SIZE) return Trains.Train;
end RailSystems;
