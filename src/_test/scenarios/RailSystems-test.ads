with AUnit;
with AUnit.Test_Cases;

package RailSystems.Test is

  type TC is new AUnit.Test_Cases.Test_Case with null record;

   overriding procedure Set_Up_Case (T: in out TC);

   overriding procedure Set_Up (T: in out TC);
   overriding procedure Tear_Down (T: in out TC);

   overriding procedure Tear_Down_Case (T: in out TC);
   private
   procedure Register_Tests (T: in out TC);
   function Name (T: TC) return Aunit.Message_String;

end RailSystems.Test;
