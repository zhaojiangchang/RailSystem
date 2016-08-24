
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



generic

	type DATA_TYPE is PRIVATE;
	type SIZE_TYPE is range <>;
	NO_FOUND: DATA_TYPE;

package LIST is

   --  DATA_TYPE specifies the type of the data that will be stored in
   --  the list while SIZE_TYPE is a integer range that specifies the
   --  values of the index to acess the list.

   --  NO_FOUND will be returned if a search method is called and no
   --  element matched it.


   OUT_OF_BOUNDS: exception;
   --  Raised when accesing elements outside the valid range of the list

   type CELL is private ;
   --  Private type for a Cell

   type LIST is private ;
   --  Private type for a List

   type LIST_PTR is access LIST;
   --  Access Type that represent a instance of a list
   type CELL_PTR is access CELL;

   ---------------------
   -- Methods of LIST --
   ---------------------

   function GET_FIRST ( A: LIST_PTR ) return DATA_TYPE;
   --  Returns the first element of the list. Could be null

   function GET_LAST ( A: LIST_PTR ) return DATA_TYPE;
   --  Returns the last element of the list

   function GET_SIZE ( A: LIST_PTR ) return SIZE_TYPE;
   --  Returns the current size of the list, which is 0 if empty

   function GET_ELEMENT( A: LIST_PTR ; LOCATION: SIZE_TYPE ) return DATA_TYPE;
   --  Returns an element at the specified LOCATION.
   --  If the element don't exist it returns NO_FOUND. Don't raise OUT_OF_BOUNDS
   function GET_ELEMENT_BY_ID( A: LIST_PTR ; ID: SIZE_TYPE ) return DATA_TYPE;
   function GET_CELL( A: LIST_PTR ;LOCATION: SIZE_TYPE ) return CELL_PTR;


   procedure APPEND ( A: in out  LIST_PTR ; D: in DATA_TYPE; ID: in SIZE_TYPE  );
   --  Add the new element at the back of the list and increments the list size

   procedure APPEND_TO_FIRST ( A: in out  LIST_PTR ; D: in DATA_TYPE; ID: in SIZE_TYPE  );
   --  Add the new element at the first of the list and increments the list size

   procedure DELETE_ALL (A: in out LIST_PTR );
   --  Empty the list and put its size to 0

   procedure SWAP( A: LIST_PTR; FIRST: SIZE_TYPE; SECOND: SIZE_TYPE);
   --  Interchange elements inside the list.
   --  If the first and second positions are out of bound then
   --  OUT_OF_BOUNDS is raised.

   procedure REPLACE( A: LIST_PTR; LOCATION: SIZE_TYPE; NEWVALUE: DATA_TYPE );
   --  Replace an element inside the list with a new value in the specified
   --  location.
   --  If location is out of bounds then OUT_OF_BOUNDS is raised.
   procedure REPLACE_BY_ID( A: LIST_PTR; ID: SIZE_TYPE; NEWVALUE: DATA_TYPE );
   --  Replace an element inside the list with a new value in the specified
   --  location.
   --  If location is out of bounds then OUT_OF_BOUNDS is raised.

private

   --  Access type for cell ptrs.

   -- Cell implementation
   type CELL is
      record
         NEXT: CELL_PTR:= null;
         DATA: DATA_TYPE;
         ID: SIZE_TYPE;
      end record;

   -- List implementation
   type LIST is
      record
         SIZE: SIZE_TYPE := 0;
         FIRST:  CELL_PTR:= null;
         LAST:   CELL_PTR:= null;
      end record;

end LIST;
