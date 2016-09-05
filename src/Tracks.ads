with TYPES;

package Tracks
--  is
with SPARK_Mode=>On is

   type Track is
      record
         ID: TYPES.MAX_SIZE := 0;
         Origin:TYPES.Station_Locations:=TYPES.No;
         Destination:TYPES.Station_Locations:=TYPES.No;
   end record;

   procedure setOriginAndDestination (track_r: in out Track; O: in TYPES.Station_Locations; D: in TYPES.Station_Locations);

end Tracks;
