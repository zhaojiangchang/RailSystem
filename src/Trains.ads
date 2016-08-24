with TYPES;
package Trains
--  is
with SPARK_Mode=>On is
   type Train is
      record
         ID: TYPES.MAX_SIZE;
         Location: Integer;
   end record;

   procedure SET_LOCATION(train_r: in out Train; ID: in TYPES.MAX_SIZE; location: in Integer);

end Trains;
