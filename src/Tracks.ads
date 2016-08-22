package Tracks
with SPARK_Mode is
   type Origin_Type is (No,LowerHutt, UpperHutt, Wellington, Johnsonville);
   type Destination_Type is (No, LowerHutt, UpperHutt, Wellington, Johnsonville);
   type Track is
      record
         id: Positive;
         Origin:Origin_Type:=No;
         Destination:Destination_Type:=No;
   end record;

   procedure setOriginAndDestination (track_r: in out Track; O: in Origin_Type; D: in Destination_Type);

end Tracks;
