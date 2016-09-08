with TYPES;
with Tracks;
with Stations;
package Trains
--  is
with SPARK_Mode=>On is
   inTracks:Stations.LIST_TRACKS.LIST_PTR(MAX_SIZE =>100);
   outTracks:Stations.LIST_TRACKS.LIST_PTR(MAX_SIZE =>100);
   type Train_Location is
      record
         currentLocation:String(1..7):="None   ";
         None: String(1..4):="None";
         Track: Tracks.Track;
         Station: Stations.Station;
      end record;

   type Train is
      record
         ID: Natural:=0;
         Location: Train_Location;
         Origin: TYPES.Station_Locations:=TYPES.No;
         Destination: TYPES.Station_Locations:=TYPES.No;
         State: TYPES.Train_State:=TYPES.Close;
         Start_Run_Time: TYPES.TimeTable:=TYPES.S8;
      end record;

--     procedure SET_LOCATION(train_r: in out Train; ID: in Natural; location: in Train_Location);
--     procedure Init(train_r: in out Train);
end Trains;
--  :=(
--                                      currentLocation=>"None   ",
--                                      None=>"None",
--                                      Track=>(
--                                              ID=>0,
--                                              Origin => TYPES.No,
--                                              Destination=>TYPES.No,
--                                              TrainID=>0
--                                             ),
--                                      Station=>(
--                                                ID=>0,
--                                                Location=>TYPES.No,
--                                                TrainID=>0,
--                                                Incoming=>inTracks,
--                                                Outgoing=>outTracks
--
--                                               )
--                                     )
--  :=(
--                                       ID=>0,
--                                       Location=>TYPES.No,
--                                       TrainID=>0,
--                                       Incoming=>inTracks,
--                                       Outgoing=>outTracks
--    )
--
--  :=(
--                                 ID=>0,
--                                 Origin => TYPES.No,
--                                 Destination=>TYPES.No,
--                                 TrainID=>0
--                                )
