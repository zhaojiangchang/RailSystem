with List;
package TYPES is
   type MAX_SIZE is RANGE 0..100;
   type Location_State_Type is (L_Track, L_Station, L_Non);
   type Location_Type is array ( Location_State_Type ) of Integer;
   type Origin_Type is (No,LowerHutt, UpperHutt, Wellington, Johnsonville);
   type Destination_Type is (No, LowerHutt, UpperHutt, Wellington, Johnsonville);
   type Station_Locations is (LowerHutt, UpperHutt, Petone, Wellington, Khandallah, CroftonDowns, Ngaio, Johnsonville);
   type trackIDsArray is array( MAX_SIZE ) of TYPES.MAX_SIZE;






end TYPES;
