with Trains;
with Stations;
with Tracks;
with sPrint;
with LIST;
package RailSystems
with SPARK_Mode is

   tn : Trains.Train;
   package LIST_TRAINS is new LIST
     ( DATA_TYPE => Trains.Train,
       SIZE_TYPE => Stations.MAX_SIZE,
       NO_FOUND => tn);

    sn : Stations.Station;
   package LIST_STATIONS is new LIST
     ( DATA_TYPE => Stations.Station,
       SIZE_TYPE => Stations.MAX_SIZE,
       NO_FOUND => sn);


   type RailSystem is
      record
         All_Trains: LIST_TRAINS.LIST_PTR;
         All_Stations: LIST_STATIONS.LIST_PTR;
         All_Tracks: Stations.LIST_TRACKS.LIST_PTR;
      end record;

   procedure addTrack(r_system: in out RailSystem; track_t: in Tracks.Track);
   procedure addTrain (r_system: in out RailSystem; ID: in Positive; location: in Integer);
   procedure addStation(r_system: in out RailSystem; ID: in Positive; Location: Stations.Station_Locations; Incoming: in Stations.LIST_TRACKS.LIST_PTR; Outgoing: in Stations.LIST_TRACKS.LIST_PTR);


end RailSystems;
