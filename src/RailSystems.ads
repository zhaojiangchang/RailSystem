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
   use all type Trains.Train;
  tn : Trains.Train;
   package LIST_TRAINS is new LIST
     ( DATA_TYPE => Trains.Train,
       E_ID=>0,
       MAX_SIZE=>100,
       NO_FOUND => tn);

   sn : Stations.Station;
   package LIST_STATIONS is new LIST
     ( DATA_TYPE => Stations.Station,
       E_ID=>0,
       MAX_SIZE=>100,
       NO_FOUND => sn);


   type RailSystem is
      record
         All_Trains: LIST_TRAINS.LIST_PTR;
         All_Stations: LIST_STATIONS.LIST_PTR;
         All_Tracks: Stations.LIST_TRACKS.LIST_PTR;
      end record;

   --procedure
   procedure Init(r_system: in out RailSystem);
   procedure addTrain (r_system: in out RailSystem; ID: in Natural)
   with
       Pre =>(ID > 0
              and ID < 101
              and (
                      for all Index in 1 .. RailSystems.LIST_TRAINS.GET_SIZE(r_system.All_Trains)
                =>RailSystems.LIST_TRAINS.GET_ELEMENT(r_system.All_Trains,Index).ID /= ID )
             );

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
              and (if ID/=0 then Stations.LIST_TRACKS.GET_ELEMENT_BY_ID(r_system.All_Tracks, ID).id = 0)
              and (
                      for all Index in 1 .. Stations.LIST_TRACKS.GET_SIZE(r_system.All_Tracks)
                => Stations.LIST_TRACKS.GET_ELEMENT(r_system.All_Tracks,Index).ID /= ID )
             );
--       post =>(if Stations.LIST_TRACKS.GET_SIZE(r_system'Old.All_Tracks )< 100 and Stations.LIST_TRACKS.GET_SIZE(r_system'Old.All_Tracks )>=0
--                   then Stations.LIST_TRACKS.GET_SIZE(r_system'Old.All_Tracks ) <= Stations.LIST_TRACKS.GET_SIZE(r_system.All_Tracks)
--                  );
--           Post=>(if j in 1..Stations.LIST_TRACKS.GET_SIZE(r_system.All_Tracks)
--                         then  Stations.LIST_TRACKS.GET_ELEMENT(r_system.All_Tracks,j).Origin /=Origin
--                 and Stations.LIST_TRACKS.GET_ELEMENT(r_system.All_Tracks,j).Destination /=Destination);
   procedure addStation(r_system: in out RailSystem; ID: in Natural; Location: TYPES.Station_Locations)
     with
       pre =>(ID >=1
              and ID <=100
              and (if ID /= 0 then LIST_STATIONS.GET_ELEMENT_BY_ID(r_system.All_Stations, ID).ID = 0)
              and (
                      for all Index in 1 .. LIST_STATIONS.GET_SIZE(r_system.All_Stations)
                => LIST_STATIONS.GET_ELEMENT(r_system.All_Stations,Index).ID /= ID )

              and (
                      for all Index in 1 .. LIST_STATIONS.GET_SIZE(r_system.All_Stations)
                => LIST_STATIONS.GET_ELEMENT(r_system.All_Stations,Index).Location /= Location )
             );
   --       post =>(if LIST_STATIONS.GET_SIZE(r_system'Old.All_Stations )< 100 and LIST_STATIONS.GET_SIZE(r_system'Old.All_Stations )>=0
   --                   then LIST_STATIONS.GET_SIZE(r_system'Old.All_Stations ) <= LIST_STATIONS.GET_SIZE(r_system.All_Stations)
   --                  );
   procedure replaceStation(r_system: in out RailSystem; station: in Stations.Station)
     with
       pre => station.ID /=0;

   procedure replaceTrain(r_system: in out RailSystem; train: in Trains.Train)
     with
       pre => train.ID > 0;

   procedure replaceTrack(r_system: in out RailSystem;track: in Tracks.Track)
     with
       pre => track.ID > 0;

   procedure addIncomingOutgoingTracksForEachStation(r_system: in out RailSystem);

   procedure go(r_system: in out RailSystem; train: in out Trains.Train; count: in Positive)
     with
       pre =>(train.ID /=0
              and train.Origin /= TYPES.No
              and train.Destination /= types.No
              and train.State = Open
              and (
                      if train.Location.currentLocation = "Station"
                and train.Location.Station.ID /=0 then
                  (for all Index in 1 .. Stations.LIST_TRACKS.GET_SIZE(LIST_STATIONS.GET_ELEMENT_BY_ID(r_system.All_Stations, train.Location.Station.ID).Outgoing)
                   =>
                     (if Stations.LIST_TRACKS.GET_ELEMENT(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(r_system.All_Stations, train.Location.Station.ID).Outgoing, Index).TracksLineDestination = train.Destination
                      and Stations.LIST_TRACKS.GET_ELEMENT(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(r_system.All_Stations, train.Location.Station.ID).Outgoing, Index).Origin /=TYPES.No
                      and Stations.LIST_TRACKS.GET_ELEMENT(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(r_system.All_Stations, train.Location.Station.ID).Outgoing, Index).Destination /=TYPES.No
                        then
                          RailSystems.getTrackByName(r_system,
                        Stations.LIST_TRACKS.GET_ELEMENT(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(r_system.All_Stations, train.Location.Station.ID).Outgoing, Index).Origin,
                        Stations.LIST_TRACKS.GET_ELEMENT(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(r_system.All_Stations, train.Location.Station.ID).Outgoing, Index).Destination ).TrainID =0
                     )
                  )
               )
              and (
                      if train.Location.currentLocation = "Track "
                and train.Location.Track.Origin /= TYPES.No
                and train.Location.Track.Destination /= TYPES.No
                and train.Location.Track.ID /=0
                and RailSystems.getStationByName(r_system, train.Location.Track.Destination).Location /=TYPES.No
                  then
                    RailSystems.getStationByName(r_system, train.Location.Track.Destination).TrainID = 0
               )
             );

   procedure prepareTrain(r_system: in out RailSystem; train: in out Trains.Train; Origin: in TYPES.Station_Locations; Destination: in TYPES.Station_Locations; StartTime: in TYPES.TimeTable)
     with
       pre =>(Origin /= TYPES.No
              and Destination /= TYPES.No
              and Origin /= Destination
              and train.Location.Station.TrainID = 0
              and (if Origin /=TYPES.No then (for some Index in 1.. TYPES.LIST_OD.GET_SIZE(RailSystems.getStationByName(r_system,Origin).TracksLineOriginAndDestination)
                =>(TYPES.LIST_OD.GET_ELEMENT(RailSystems.getStationByName(r_system,Origin).TracksLineOriginAndDestination, Index).Origin = Origin
                   or TYPES.LIST_OD.GET_ELEMENT(RailSystems.getStationByName(r_system,Origin).TracksLineOriginAndDestination, Index).Destination = Origin)
                and (TYPES.LIST_OD.GET_ELEMENT(RailSystems.getStationByName(r_system,Origin).TracksLineOriginAndDestination, Index).Origin = Destination
                  or TYPES.LIST_OD.GET_ELEMENT(RailSystems.getStationByName(r_system,Origin).TracksLineOriginAndDestination, Index).Destination = Destination)))),
     post => (train.Origin = Origin
              and train.Destination = Destination
              and train.State = TYPES.Open);



   --function
   function getStationByName(r_system: in RailSystem; stationLocation: in TYPES.Station_Locations) return Stations.Station;

   function getTrackByName(r_system: in RailSystem; Origin: in TYPES.Station_Locations; Destination: in TYPES.Station_Locations) return Tracks.Track
     with
       pre => (Origin/= TYPES.No
               and Destination /= TYPES.No);

   function getTrainById(r_system: in RailSystem; ID: in Natural) return Trains.Train
     with
       pre => (ID >=1
               and ID <= LIST_TRAINS.GET_SIZE(r_system.All_Trains));
end RailSystems;
