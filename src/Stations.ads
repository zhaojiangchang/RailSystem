with Tracks;
with List;
package Stations
with SPARK_Mode is
   type MAX_SIZE is RANGE 0..100;
   type Station_Locations is (LowerHutt, UpperHutt, Petone, Wellington, Khandallah, CroftonDowns, Ngaio, Johnsonville);
   tk : Tracks.Track;

   package LIST_TRACKS is new LIST
     ( DATA_TYPE => Tracks.Track,
       SIZE_TYPE => MAX_SIZE,
       NO_FOUND => tk);
   type Station is
      record
         ID: Positive;
         Location: Station_Locations;
         Incoming: LIST_TRACKS.LIST_PTR;
         Outgoing: LIST_TRACKS.LIST_PTR;
      end record;

   procedure Add_IncomingTrack(Station_r: in out Station; track_r: in Tracks.Track);
   procedure Add_OutgoingTrack(Station_r: in out Station; track_r: in Tracks.Track);
   procedure Remove_IncomingTrack(Station_r: in out Station; track_r: in Tracks.Track);
   procedure Remove_OutgoingTrack(Station_r: in out Station; track_r: in Tracks.Track);

end Stations;
