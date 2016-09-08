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

   procedure Print_Natural(s: in String; n: in Natural)
   is
   begin
      Put_Line(s &":  "& n'Image);
   end Print_Natural;
end sPrint;
