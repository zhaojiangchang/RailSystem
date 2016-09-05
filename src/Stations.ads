with Tracks;
with list;
with TYPES;
package Stations
--  is
with SPARK_Mode=>On is


     tk : Tracks.Track;

   package LIST_TRACKS is new LIST
     ( DATA_TYPE => Tracks.Track,
       SIZE_TYPE => TYPES.MAX_SIZE,
       NO_FOUND => tk);

   type Station is
      record
         ID: TYPES.MAX_SIZE:=0;
         Location: TYPES.Station_Locations :=TYPES.No;
         Train: TYPES.MAX_SIZE:=0;
         Incoming: LIST_TRACKS.LIST_PTR;
         Outgoing: LIST_TRACKS.LIST_PTR;
      end record;

   procedure Add_IncomingTrack(Station_r: in out Station; track_r: in Tracks.Track);
   procedure Add_OutgoingTrack(Station_r: in out Station; track_r: in Tracks.Track);
   procedure Remove_IncomingTrack(Station_r: in out Station; track_r: in Tracks.Track);
   procedure Remove_OutgoingTrack(Station_r: in out Station; track_r: in Tracks.Track);

end Stations;
