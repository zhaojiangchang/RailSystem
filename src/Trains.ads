with TYPES;
with Tracks;
with Stations;
package Trains
--  is
with SPARK_Mode=>On is
   type Train_Location is
      record
         currentLocation:String(1..7):= "None   ";
         None: String(1..25) := "Not on the Railway System";
         Track: Tracks.Track;
         Station: Stations.Station;
      end record;

   type Train is
      record
         ID: TYPES.MAX_SIZE;
         Location: Train_Location;
         Destination: Stations.Station;
      end record;

   procedure SET_LOCATION(train_r: in out Train; ID: in TYPES.MAX_SIZE; location: in Train_Location);

end Trains;
