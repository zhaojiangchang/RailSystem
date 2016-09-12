with Trains;
with Stations;
with Tracks;
with Trains;
with sPrint;
with LIST;
with TYPES;
package RailSystems
--  is
with SPARK_Mode=>On is
   use all type TYPES.Station_Locations;
   use all type TYPES.Train_State;
  tn : Trains.Train;
   package LIST_TRAINS is new LIST
     ( DATA_TYPE => Trains.Train,
       E_ID=>0,
       NO_FOUND => tn);

   sn : Stations.Station;
   package LIST_STATIONS is new LIST
     ( DATA_TYPE => Stations.Station,
       E_ID=>0,
       NO_FOUND => sn);


   type RailSystem is
      record
         All_Trains: LIST_TRAINS.LIST_PTR(MAX_SIZE =>100);
         All_Stations: LIST_STATIONS.LIST_PTR(MAX_SIZE =>100);
         All_Tracks: Stations.LIST_TRACKS.LIST_PTR(MAX_SIZE =>100);
      end record;

   --procedure
   --     procedure InitTrack(track_r: in out Tracks.Track);
   procedure Init(r_system: in out RailSystem);
   procedure addTrain (r_system: in out RailSystem; ID: in Natural)
     with
       Pre =>(ID>0
              and ID<101),
     Post =>(if LIST_TRAINS.GET_SIZE(r_system'Old.All_Trains)<LIST_TRAINS.GET_SIZE(r_system.All_Trains)
                 then LIST_TRAINS.GET_ELEMENT_BY_ID(r_system.All_Trains,ID).ID > 0
             and LIST_TRAINS.GET_ELEMENT_BY_ID(r_system.All_Trains,ID).ID < 101 );
   procedure addTrack(r_system: in out RailSystem; ID: in Natural; Origin: in TYPES.Station_Locations; Destination: in TYPES.Station_Locations; LineOrigin: in TYPES.Station_Locations; LineDestination: in TYPES.Station_Locations)
     with
       Pre =>(ID >=1
              and ID<=100
              and Origin /= TYPES.No
              and Destination /= TYPES.No
              and LineOrigin /= TYPES.No
              and LineDestination /= TYPES.No
              and Origin /= Destination
              and LineOrigin /= LineDestination
              and Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(r_system.All_Tracks, ID).id = 0),
         post =>(if Stations.LIST_TRACKS.GET_SIZE(r_system'Old.All_Tracks )< 100
                         then Stations.LIST_TRACKS.GET_SIZE(r_system'Old.All_Tracks ) <= Stations.LIST_TRACKS.GET_SIZE(r_system.All_Tracks)
                );
--           Post=>(if j in 1..Stations.LIST_TRACKS.GET_SIZE(r_system.All_Tracks)
--                         then  Stations.LIST_TRACKS.GET_ELEMENT(r_system.All_Tracks,j).Origin /=Origin
--                 and Stations.LIST_TRACKS.GET_ELEMENT(r_system.All_Tracks,j).Destination /=Destination);
   procedure addStation(r_system: in out RailSystem; StationID: in Natural; Location: TYPES.Station_Locations)
     with
       pre =>(StationID >=1
              and StationID <=100
              and LIST_STATIONS.GET_ELEMENT_BY_ID(r_system.All_Stations, StationID).ID = 0),
   Post => (LIST_STATIONS.GET_ELEMENT_BY_ID(r_system.All_Stations, StationID).ID = StationID);
   procedure replaceStation(r_system: in out RailSystem; StationID: in Natural; station: in Stations.Station);
   procedure replaceTrain(r_system: in out RailSystem; TrainID: in Natural; train: in Trains.Train);
   procedure replaceTrack(r_system: in out RailSystem; TrackID: in Natural;track: in Tracks.Track);
   procedure addIncomingOutgoingTracksForEachStation(r_system: in out RailSystem);
   procedure setTrainLocation(r_system: in RailSystem; train: in out Trains.Train;LocationName: in  String; LocationID: in Natural)
     with
       pre =>(train.ID /=0
              and LocationName = "None"
              and LocationID >=1
              and LocationID <= LIST_TRAINS.GET_SIZE(r_system.All_Trains)),
         post =>(train.Location.currentLocation ="None   ");
   procedure go(r_system: in out RailSystem; train: in out Trains.Train; count: in Positive)
     with
       pre =>(train.ID /=0);
   procedure prepareTrain(r_system: in out RailSystem; train: in out Trains.Train; Origin: in TYPES.Station_Locations; Destination: in TYPES.Station_Locations; StartTime: in TYPES.TimeTable)
     with
       pre =>(Origin /= TYPES.No
              and Destination /= TYPES.No
              and Origin /= Destination
              and RailSystems.getStationByName(r_system,Origin).TrainID = 0
              and train.Location.Station.TrainID = 0),
     post => (train.Origin = Origin
              and train.Destination = Destination
              and train.State = TYPES.Open);
   --     procedure updateTrain(r_system: in RailSystem; train: in out Trains.Train);
   --     procedure search(r_system: in RailSystem; train: in Trains.Train);
   --function
   function getStationByName(r_system: in RailSystem; stationLocation: in TYPES.Station_Locations) return Stations.Station;
   function getTrackByName(r_system: in RailSystem; Origin: in TYPES.Station_Locations; Destination: in TYPES.Station_Locations) return Tracks.Track;
   function getTrainById(r_system: in RailSystem; ID: in Natural) return Trains.Train
     with
       pre => (ID >=1
               and ID <= LIST_TRAINS.GET_SIZE(r_system.All_Trains));
end RailSystems;
