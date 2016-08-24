package body Trains with SPARK_Mode is

   ------------------
   -- SET_LOCATION --
   ------------------

   procedure SET_LOCATION
     (train_r: in out Train;
      ID: in TYPES.MAX_SIZE;
      location: in Integer)
   is
   begin
    train_r.Location := location;
   end SET_LOCATION;

end Trains;
