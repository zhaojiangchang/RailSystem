package body Trains with SPARK_Mode=>On is

   ------------------
   -- SET_LOCATION --
   ------------------

--     procedure SET_LOCATION
--       (train_r: in out Train;
--        ID: in Natural;
--        location: in Train_Location)
--     is
--     begin
--      train_r.Location := location;
--     end SET_LOCATION;
 -----------------------
   -- Init Train -------
   -----------------------

   procedure Init
     (train_r: in out Train)
   is
      tempTrack: Tracks.Track;
      tempStation: Stations.Station;
   begin
      --          Tracks.Init(tempTrack);
      tempTrack.ID:=0;
      tempTrack.Origin:= TYPES.No;
      tempTrack.Destination:=TYPES.No;
      tempTrack.TrainID:=0;

--        Stations.Init(tempStation);
      tempStation.ID:=0;
      tempStation.TrainID:=0;
      Stations.LIST_TRACKS.Init(tempStation.Incoming);
      Stations.LIST_TRACKS.Init(tempStation.Outgoing);
      tempStation.Location:=TYPES.No;

      train_r.ID:=0;
      train_r.Origin:= TYPES.No;
      train_r.Destination:=TYPES.No;
      train_r.State:=TYPES.Close;
      train_r.Location.currentLocation:="None   ";
      train_r.Location.None:= "None";
      train_r.Location.Track:= tempTrack;
      train_r.Location.Station:=tempStation;

   end Init;
end Trains;
