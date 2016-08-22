package body RailSystems is


   --------------
   -- addTrack --
   --------------

   procedure addTrack
     (r_system: in out RailSystem; track_t: in Tracks.Track)
   is
   begin
      Stations.LIST_TRACKS.APPEND_TO_FIRST(r_system.All_Tracks, track_t);
   end addTrack;

   --------------
   -- addTrain --
   --------------

   procedure addTrain (r_system: in out RailSystem;
                       ID: in Positive;
                       location: in Integer)
   is
      train_t: Trains.Train;
   begin
      train_t.ID := ID;
      train_t.Location := location;

      LIST_TRAINS.APPEND_TO_FIRST(r_system.All_Trains, train_t);
   end addTrain;

   ----------------
   -- addStation --
   ----------------

   procedure addStation
     (r_system: in out RailSystem;
      ID: in Positive;
      Location: in Stations.Station_Locations;
      Incoming: in Stations.LIST_TRACKS.LIST_PTR;
      Outgoing: in Stations.LIST_TRACKS.LIST_PTR)
   is
      station_t: Stations.Station;
   begin
      station_t.ID := ID;
      station_t.Incoming := Incoming;
      station_t.Outgoing := Outgoing;

      LIST_STATIONS.APPEND_TO_FIRST(r_system.All_Stations, station_t);

   end addStation;

end RailSystems;
