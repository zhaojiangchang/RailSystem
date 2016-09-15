with List;
package TYPES is
   type MAX_SIZE is RANGE 0..100;
   --Move on Track
   --Stop at Station
   --Open ready for use
   --Close Off from the railsystem
   type Train_State is (Move, Stop, Open, Close);
--     type Location_Type is array ( Location_State_Type ) of Integer;

   type Station_Locations is (No, LowerHutt, UpperHutt, Petone, Wellington, Khandallah, CroftonDowns, Ngaio, Johnsonville);

   -- 8 means 8.00 clock and 22 mians 22.00 clock
   type TimeTable is(S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20,S21,S22);

   type ODRecord is record
      Origin: Station_Locations:=No;
      Destination: Station_Locations:=No;
   end record;
   od:ODRecord;
   package LIST_OD is new LIST
     ( DATA_TYPE => ODRecord,
       E_ID=>0,
       MAX_SIZE=>100,
       NO_FOUND => od);

--     type ListTracksOrigionAndDesttination is record
--        ListTracksOandD: LIST_OD.LIST_PTR(MAX_SIZE =>100);
--     end record;


end TYPES;
