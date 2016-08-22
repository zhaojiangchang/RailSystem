with AUnit.Reporter.Text;
with AUnit.Run;
with RailSystems_Suite;

procedure RailSystems_Harness is

   procedure Runner is new AUnit.Run.Test_Runner (RailSystems_Suite.Suite);

   Reporter : AUnit.Reporter.Text.Text_Reporter;

begin
   Runner (Reporter);
end RailSystems_Harness;
