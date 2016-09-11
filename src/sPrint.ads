with TYPES;
package  sPrint is
   procedure Print(s:in String) ;
   procedure Print_Natural(s: in String; n: in Natural);
   procedure Print_Train_State(s: in String; n: in TYPES.Train_State);
   procedure Print_Station_Locations(s: in String; n: in TYPES.Station_Locations);
end sPrint;
