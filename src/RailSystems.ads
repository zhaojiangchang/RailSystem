with Trains;
with Stations;
with Tracks;
with sPrint;
with LIST;
with TYPES;
package RailSystems
--  is
with SPARK_Mode is
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

   procedure addTrack(r_system: in out RailSystem; ID: in TYPES.MAX_SIZE; Origin: in TYPES.Origin_Type; Destination: in TYPES.Destination_Type);
   procedure addTrain (r_system: in out RailSystem; ID: in TYPES.MAX_SIZE; location: in Integer);
   procedure addStation(r_system: in out RailSystem; StationID: in TYPES.MAX_SIZE; Location: TYPES.Station_Locations);
   procedure setStation(r_system: in out RailSystem; StationID: in TYPES.MAX_SIZE; station: in Stations.Station);
   procedure addIncomingOutgoingTracksForStation(r_system: in out RailSystem; StationID: in TYPES.MAX_SIZE; trackIds: in TYPES.trackIDsArray;
                                        IOSwitch: in String);
--     procedure addOutgoingTracksForStation(r_system: in out RailSystem; StationID: in TYPES.MAX_SIZE; trackIds: in TYPES.trackIDsArray);

end RailSystems;
