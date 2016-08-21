# RailSystem
Swen 421 Assignment 2 
1 Modelling a Rail System
A rail system is made up of tracks, stations and trains. These components have the
following properties.
• Each track has a single Origin and Destination.
• The origin of a track may not be the same as its destination.
• Each Station potentially has multiple incoming tracks and outgoing tracks.
• Each Train has a location. That may be either a track or a station, or not on the
Rail System at all.
• Trains may either move from a track to its destination or from a station to an
outgoing track.
• Trains may travel along tracks from station to station, and do so at some constant
time.
You need to model these interactions for an unspecified number of tracks, trains and
stations while proving some correctness properties. As with any critical system, we need
to be sure that the software controlling the trains is correct. In this case we mean the
following things.
• The above criteria are maintained at all times.
• Trains never collide. Two trains are said to have collided if they are both at the
same station, or both on the same track.
• The Rail System is fully reachable. That is, all stations are reachable from any
other station.
1
Implementing and verifying the above model in SPARK/Ada requires some thought
and design. A first consideration is the representation of the Rail System. When designing
it keep in mind that while traditional implementations might make use of a graph
structure using pointers and recursive datatypes, SPARK prohibits the use of pointers,
so you should design an alternate implementation. One way would be to mimic a graph
structure using Lists. Another consideration is determining Reachability of your Rail
System. As with the representation of the Rail System, this might traditionally be done
with a graph and graph traversal, but since SPARK prohibits recursive functions you
need to design a method that avoids recursion. An alternate method would be to do a
depth first search using a stack to keep track of nodes that are currently being searched.
