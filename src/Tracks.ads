with TYPES;

package Tracks
--  is
with SPARK_Mode is

   type Track is
      record
         ID: TYPES.MAX_SIZE := 0;
         Origin:TYPES.Origin_Type:=TYPES.No;
         Destination:TYPES.Destination_Type:=TYPES.No;
   end record;

   procedure setOriginAndDestination (track_r: in out Track; O: in TYPES.Origin_Type; D: in TYPES.Destination_Type);

end Tracks;
