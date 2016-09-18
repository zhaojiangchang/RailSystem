
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
   -- CONTAINS --
   ---------------
   function CONTAINS (A: LIST_PTR; D: DATA_TYPE) return Boolean
   is
      size: Natural;
      contain:Boolean;
   begin
      size:= A.SIZE;
      contain:=False;
      for i in 1 .. size loop
         if i < A.MAX_SIZE then
            if A.ELEMENTS(i).ID /=0 then
               if A.ELEMENTS(i).DATA = D then
                  contain:= True;
                  return contain;
               end if;
            end if;
         end if;

         pragma Loop_Invariant(contain = False);
      end loop;
      return contain;
   end CONTAINS;

   -----------------------
   -- get last element  --
   -----------------------

   function GET_LAST(A: LIST_PTR) return DATA_TYPE
   is
   begin
      return GET_ELEMENT(A        => A,
                         LOCATION => A.SIZE);
   end GET_LAST;
   ---------------------
   -- Delete element  --
   ---------------------

   procedure DELETE_LAST(A: in out LIST_PTR)
   is
   begin
      if A.SIZE > 0 then
         A.SIZE := A.SIZE -1;
      end if;

   end DELETE_LAST;

   ---------------
   -- GET_SIZE  --
   ---------------

   function GET_SIZE ( A: LIST_PTR )
                      return Natural
   is
   begin
      return A.SIZE;
   end GET_SIZE;

   ---------------
   -- FULL  --
   ---------------
   function FULL ( A : in LIST_PTR) return Boolean is
   begin
      return A.SIZE = A.MAX_SIZE;
   end FULL;
   ---------------
   -- APPEND    --
   ---------------

   procedure APPEND ( A: in out LIST_PTR; D: in DATA_TYPE; ID: in Natural)
   is
   begin

      -- create a new cell to store the new element
      if not FULL(A) then
         if A.SIZE < A.MAX_SIZE then
            A.SIZE:= A.SIZE +1;
            A.ELEMENTS(A.SIZE).DATA := D;
            A.ELEMENTS(A.SIZE).ID:= ID;
         end if;

      end if;
   end APPEND;

   ---------------
   -- APPEND  TO FIRST  --
   ---------------

--     procedure APPEND_TO_FIRST ( A: in out  LIST_PTR ; D: in DATA_TYPE; ID: in Natural)
--     is
--  --        size: Natural;
--     begin
--        A.SIZE:= A.SIZE +1;
--        if not FULL(A) then
--           for i in reverse 2 .. A.SIZE loop
--              A.ELEMENTS(i) :=  A.ELEMENTS(i-1);
--           end loop;
--           A.ELEMENTS(1).DATA := D;
--           A.ELEMENTS(1).ID:= ID;
--        end if;
--
--
--     end APPEND_TO_FIRST;


   ---------------
   -- DELETE    --
   ---------------

   procedure DELETE_ALL (A: in out LIST_PTR )
   is
   begin
      -- Set size to 0
      A.SIZE := 0;
      A.HEAD := 1;

   end DELETE_ALL;


   -----------------
   -- GET_ELEMENT --
   -----------------

   function GET_ELEMENT( A: LIST_PTR ;LOCATION: Natural )
                        return DATA_TYPE
   is
   begin
      if  A.SIZE = 0 or LOCATION <= 0  or LOCATION >A.SIZE or LOCATION > A.MAX_SIZE then

         -- If element is not in the list at this location
         return NO_FOUND;
      else
         return A.ELEMENTS(LOCATION).DATA;
      end if;

   end GET_ELEMENT;

   ----------------------
   -- GET_ELEMENT_BY_ID--
   ----------------------

   function GET_ELEMENT_BY_ID( A: LIST_PTR ;ID: Natural )
                        return DATA_TYPE
   is
      data: DATA_TYPE;
   begin


      if  A.SIZE = 0 or ID <= 0  or ID >A.SIZE then

         -- If element is not in the list at this location
         return NO_FOUND;

      else

         for i in 1 .. A.SIZE loop
            if i< A.MAX_SIZE then
               if A.ELEMENTS(i).ID = ID then
                  data:=A.ELEMENTS(i).DATA;
               end if;
            end if;
         end loop;
         return data;

      end if;

   end GET_ELEMENT_BY_ID;


--     ----------
--     -- SWAP --
--     ----------
--
--     procedure SWAP( A: in out LIST_PTR; FIRST: Natural; SECOND: Natural)
--     is
--        TEMPA,TEMPB: DATA ;
--     begin
--        if A.SIZE = 0 or FIRST <=0 or SECOND >A.SIZE or FIRST >A.SIZE or SECOND <=0 then
--           -- If the index to find the element is out of bounds raise the exception
--           raise OUT_OF_BOUNDS;
--        end if;
--
--        if FIRST = SECOND then
--           -- If first is equal to seconde then there is no need to swap!
--           return;
--        end if;
--
--        -- Get the data at specified positions
--        TEMPA:= GET_ELEMENT_RECORD( A, FIRST);
--        TEMPB:= GET_ELEMENT_RECORD( A, SECOND);
--
--        -- Swap them
--        REPLACE( A, FIRST, TEMPB);
--        REPLACE( A, SECOND,TEMPA);
--
--     end SWAP;

--
--     -------------
--     -- REPLACE --
--     -------------
--
--     procedure REPLACE (A: in out LIST_PTR; LOCATION: Natural; NEWVALUE: DATA )
--     is
--     begin
--        if  A.SIZE = 0 or LOCATION <= 0 or LOCATION > A.SIZE or LOCATION > MAX_SIZE then
--           -- If the index of the element don't exist raise exception
--           return;
--        else
--           A.ELEMENTS(LOCATION):= NEWVALUE;
--        end if;
--
--     end REPLACE;


   -------------
   -- REPLACE_BY_ID --
   -------------

   procedure REPLACE_BY_ID (A: in out LIST_PTR; ID: Natural; NEWVALUE: DATA_TYPE )
   is
   begin
      if  A.SIZE > 0 or ID > 0 or ID <= A.SIZE then
         for i in 1 .. A.SIZE loop
            if i <A.MAX_SIZE then
               if A.ELEMENTS(i).ID = ID then
                  A.ELEMENTS(i).DATA := NEWVALUE;
                  return;
               end if;
            end if;
         end loop;
      end if;

   end REPLACE_BY_ID;


   procedure Init (A : in out LIST_PTR) is
   begin
      A.Head := 1;
      A.Size := 0;
   end Init;
end LIST;
