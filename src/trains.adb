package body Trains is

   ------------------
   -- SET_LOCATION --
   ------------------

   procedure SET_LOCATION
     (train_r: in out Train;
      ID: in Positive;
      location: in Integer)
   is
   begin
    train_r.Location := location;
   end SET_LOCATION;

end Trains;
