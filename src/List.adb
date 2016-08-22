
-- The list is implemented using the CELL_PTR access type
-- of the CELL type. a Cell contatins the data of the user
-- and a link to the next CELL (which is null if is the last
-- element of the list).
with ada.Text_IO;
use ada.Text_IO;

package body LIST is

   -----------------------
   -- Local Subprograms --
   -----------------------

   ---------------
   -- GET_FIRST --
   ---------------

   function GET_FIRST( A: LIST_PTR )
                      return DATA_TYPE
   is
   begin
      return A.FIRST.DATA;
   end GET_FIRST;


   ---------------
   -- GET_LAST  --
   ---------------

   function GET_LAST ( A: LIST_PTR )
                      return DATA_TYPE
   is
   begin
      return A.LAST.DATA;
   end GET_LAST;


   ---------------
   -- GET_SIZE  --
   ---------------

   function GET_SIZE ( A: LIST_PTR )
                      return SIZE_TYPE
   is
   begin
      return A.SIZE;
   end GET_SIZE;


   ---------------
   -- APPEND    --
   ---------------

   procedure APPEND ( A: in out LIST_PTR; D: in DATA_TYPE )
   is
      TEMP1 : CELL_PTR;
   begin

      -- create a new cell to store the new element
      TEMP1 := new CELL;
      TEMP1.DATA := D;

      -- append the new cell making it the last cell
      if  A.SIZE = 0 then
         A.FIRST := TEMP1;
         A.LAST := TEMP1;
         A.SIZE := 1;
      else
         A.LAST.NEXT := TEMP1;
         A.LAST := TEMP1;
         A.SIZE := A.SIZE + 1;
      end if;

   end APPEND;

   ---------------
   -- APPEND  TO FIRST  --
   ---------------

   procedure APPEND_TO_First ( A: in out  LIST_PTR ; D: in DATA_TYPE )
   is
      TEMP1 : CELL_PTR;
      TEMP2 : LIST_PTR;
      size: SIZE_TYPE;
      TEMP3: DATA_TYPE;
   begin
       Put_Line(A.SIZE'Image);
      size:= A.SIZE;

      -- create a new cell to store the new element
      TEMP1 := new CELL;
      TEMP1.DATA := D;


      -- append the new cell making it the last cell
      if  A.SIZE = 0 then
         A.FIRST := TEMP1;
         A.LAST := TEMP1;
         A.SIZE := 1;
      else
         TEMP2:= new LIST;
         TEMP2.FIRST :=TEMP1;
         for i in 1..size loop
            TEMP3 := GET_ELEMENT(A,i);
            if TEMP3 /= NO_FOUND then
               APPEND(TEMP2, GET_ELEMENT(A, i));
            end if;
         end loop;
        A:=TEMP2;
      end if;

   end APPEND_TO_First;


   ---------------
   -- DELETE    --
   ---------------

   procedure DELETE_ALL (A: in out LIST_PTR )
   is
   begin
      -- Set size to 0
      A.SIZE := 0;

      A.FIRST := null;
      A.LAST := null;

   end DELETE_ALL;


   -----------------
   -- GET_ELEMENT --
   -----------------

   function GET_ELEMENT( A: LIST_PTR ;LOCATION: SIZE_TYPE )
                        return DATA_TYPE
   is
      COUNT: SIZE_TYPE:=0;
      TEMP : CELL_PTR:= null;
   begin


      if  A.SIZE = 0 or LOCATION <= 0  or LOCATION >A.SIZE then

         -- If element is not in the list at this location
         return NO_FOUND;

      else
         TEMP := A.FIRST;

         while TEMP /=  null loop

            COUNT := COUNT +1;

            if  COUNT = LOCATION then
               -- if the location match return the data.
               return TEMP.DATA;
            end if;

            TEMP := TEMP.NEXT;

         end loop;

         return NO_FOUND;
      end if;

   end GET_ELEMENT;



   ----------
   -- SWAP --
   ----------

   procedure SWAP( A: LIST_PTR; FIRST: SIZE_TYPE; SECOND: SIZE_TYPE)
   is
      TEMPA,TEMPB: DATA_TYPE ;
   begin
      if A.SIZE = 0 or FIRST <=0 or SECOND >A.SIZE or FIRST >A.SIZE or SECOND <=0 then
         -- If the index to find the element is out of bounds raise the exception
         raise OUT_OF_BOUNDS;
      end if;

      if FIRST = SECOND then
         -- If first is equal to seconde then there is no need to swap!
         return;
      end if;

      -- Get the data at specified positions
      TEMPA:= GET_ELEMENT( A, FIRST);
      TEMPB:= GET_ELEMENT( A, SECOND);

      -- Swap them
      REPLACE( A, FIRST, TEMPB);
      REPLACE( A, SECOND,TEMPA);

   end SWAP;


   -------------
   -- REPLACE --
   -------------

   procedure REPLACE (A: LIST_PTR; LOCATION: SIZE_TYPE; NEWVALUE: DATA_TYPE )
   is
      COUNT: SIZE_TYPE:=0;
      TEMP : CELL_PTR:= null;
   begin
      if  A.SIZE = 0 or LOCATION <= 0 or LOCATION > A.SIZE then
         -- If the index of the element don't exist raise exception
         raise OUT_OF_BOUNDS;
      else
         TEMP := A.FIRST;

         while TEMP /=  null loop

            COUNT := COUNT +1;

            if  COUNT = LOCATION then
               -- Replace the data of the cell with new value
               TEMP.DATA := NEWVALUE;
               return;
            end if;

            TEMP := TEMP.NEXT;

         end loop;

         raise OUT_OF_BOUNDS;
      end if;

   end REPLACE;


end LIST;
