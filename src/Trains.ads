with Stations;
package Trains
with SPARK_Mode is
   type Location_State_Type is (L_Track, L_Station, L_Non);
   type Location_Type is array ( Location_State_Type ) of Integer;

   type Train is
      record
         ID: Positive;
         Location: Integer;
   end record;

   procedure SET_LOCATION(train_r: in out Train; ID: in Positive; location: in Integer);

end Trains;
