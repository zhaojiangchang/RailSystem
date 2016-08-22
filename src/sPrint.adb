with Ada.Text_IO; use Ada.Text_IO;
package body sPrint is
   procedure print(s: in String) is
   begin
      if s = "" then
         New_Line;
      else
         Put_Line(s);
      end if;
   end print;
end sPrint;
