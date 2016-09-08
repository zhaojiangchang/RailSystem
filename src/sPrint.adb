with Ada.Text_IO; use Ada.Text_IO;
package body sPrint is
   procedure Print(s: in String) is
   begin
      if s = "" then
         New_Line;
      else
         Put_Line(s);
      end if;
   end Print;
end sPrint;
