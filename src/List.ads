
--  Simple Linked List support

--  This package provides an implementation of a linked list to
--  store any data type. The list provides with common functions
--  for retrieving and storing elements in the list.

--  To use the list first (after instantiating the package) create a
--  variable of type LIST_PTR and then use the new operator.
--
--      var1 : LIST_PTR;
--  	var1 := new LIST;
--
--  After that you can begin using the list methods to insert, remove
--  or modify its content.

pragma SPARK_Mode (On);


generic

   type DATA_TYPE is PRIVATE;
   E_ID:Natural;
--     MAX_SIZE:Positive;
   NO_FOUND: DATA_TYPE;

package LIST is

   --  DATA_TYPE specifies the type of the data that will be stored in
   --  the list while SIZE_TYPE is a integer range that specifies the
   --  values of the index to acess the list.

   --  NO_FOUND will be returned if a search method is called and no
   --  element matched it.

   type DATA is private;
   OUT_OF_BOUNDS: exception;
   --  Raised when accesing elements outside the valid range of the list


      type LIST_PTR(MAX_SIZE: Positive ) is private ;
--     type List_PTR is private;
   --  Private type for a List


   ---------------------
   -- Methods of LIST --
   ---------------------
   function CONTAINS ( A: LIST_PTR; D: in DATA_TYPE) return Boolean;

   function GET_LAST(A: LIST_PTR) return DATA_TYPE;

   function GET_SIZE ( A: LIST_PTR ) return Natural;
   --  Returns the current size of the list, which is 0 if empty

   function GET_ELEMENT( A: LIST_PTR ; LOCATION: Natural ) return DATA_TYPE;
   --  Returns an element at the specified LOCATION.
   --  If the element don't exist it returns NO_FOUND. Don't raise OUT_OF_BOUNDS
   function GET_ELEMENT_BY_ID( A: LIST_PTR ; ID: Natural ) return DATA_TYPE;

   function FULL ( A : in LIST_PTR) return Boolean;

   procedure DELETE_LAST(A: in out LIST_PTR);

   procedure APPEND ( A: in out  LIST_PTR ; D: in DATA_TYPE; ID: in Natural  )
   with
       Pre =>(ID > 0
              and ID <= A.MAX_SIZE
--                and (if ID > 0  and ID < 101 then ( for all Index in 1 .. GET_SIZE(A)
--                  =>GET_ELEMENT(A,Index) /= D))
         );

   --  Add the new element at the back of the list and increments the list size

--     procedure APPEND_TO_FIRST ( A: in out  LIST_PTR ; D: in DATA_TYPE; ID: in Natural);
   --  Add the new element at the first of the list and increments the list size

   procedure DELETE_ALL (A: in out LIST_PTR );
   --  Empty the list and put its size to 0

--     procedure SWAP( A: in out LIST_PTR; FIRST: Natural; SECOND: Natural);
   --  Interchange elements inside the list.
   --  If the first and second positions are out of bound then
   --  OUT_OF_BOUNDS is raised.

--     procedure REPLACE( A: in out LIST_PTR; LOCATION: Natural; NEWVALUE: DATA );
   --  Replace an element inside the list with a new value in the specified
   --  location.
   --  If location is out of bounds then OUT_OF_BOUNDS is raised.
   procedure REPLACE_BY_ID( A: in out LIST_PTR; ID: Natural; NEWVALUE: DATA_TYPE );
   --  Replace an element inside the list with a new value in the specified
   --  location.
   --  If location is out of bounds then OUT_OF_BOUNDS is raised.
   procedure Init(A: in out LIST_PTR);

private

 type DATA is
      record
         DATA: DATA_TYPE;
         ID: Natural:=E_ID;
      end record;
   -- List implementation


   type List_Array is array (Positive range <>) of DATA;
   type LIST_PTR(MAX_SIZE: Positive ) is
--     type LIST_PTR is
      record
         SIZE: Natural:=E_ID;
         ELEMENTS: List_Array(1 .. MAX_SIZE);
         HEAD: Positive:=1;
      end record;

end LIST;
