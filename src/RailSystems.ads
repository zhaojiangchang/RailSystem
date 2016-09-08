with Trains;
with Stations;
with Tracks;
with Trains;
with sPrint;
with LIST;
with TYPES;
package RailSystems
--  is
with SPARK_Mode=>On is
  tn : Trains.Train;
   package LIST_TRAINS is new LIST
     ( DATA_TYPE => Trains.Train,
       E_ID=>0,
       NO_FOUND => tn);

   sn : Stations.Station;
   package LIST_STATIONS is new LIST
     ( DATA_TYPE => Stations.Station,
       E_ID=>0,
       NO_FOUND => sn);


   type RailSystem is
      record
         All_Trains: LIST_TRAINS.LIST_PTR(MAX_SIZE =>100);
         All_Stations: LIST_STATIONS.LIST_PTR(MAX_SIZE =>100);
         All_Tracks: Stations.LIST_TRACKS.LIST_PTR(MAX_SIZE =>100);
      end record;

   --procedure
--     procedure InitTrack(track_r: in out Tracks.Track);
   procedure Init(r_system: in out RailSystem);
   procedure addTrain (r_system: in out RailSystem; ID: in Natural);
   procedure addTrack(r_system: in out RailSystem; ID: in Natural; Origin: in TYPES.Station_Locations; Destination: in TYPES.Station_Locations);
   procedure addStation(r_system: in out RailSystem; StationID: in Natural; Location: TYPES.Station_Locations);
   procedure replaceStation(r_system: in out RailSystem; StationID: in Natural; station: in Stations.Station);
   procedure addIncomingOutgoingTracksForEachStation(r_system: in RailSystem);
   procedure setTrainLocation(r_system: in RailSystem; train: in out Trains.Train;LocationName: in  String; LocationID: in Natural);
   procedure go(r_system: in RailSystem; train: in out Trains.Train);
   procedure prepareTrain(r_system: in RailSystem; train: in out Trains.Train; Origin: in TYPES.Station_Locations; Destionation: in TYPES.Station_Locations);
   procedure updateTrain(r_system: in RailSystem; train: in out Trains.Train);
--     procedure search();
   --function
   function getStationByName(r_system: in RailSystem; Origin: in TYPES.Station_Locations) return Stations.Station;
   function getTrackByName(r_system: in RailSystem; Origin: in TYPES.Station_Locations) return Tracks.Track;
   function getTrainById(r_system: in RailSystem; ID: in Natural) return Trains.Train;
end RailSystems;
