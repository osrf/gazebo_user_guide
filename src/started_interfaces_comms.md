TCP Communication {#started__interfaces__comms}
===============

Gazebo implements a simple publish/subscribe communication system that
provides access to and control over much of the simulation state.  This
communication system uses `boost::asio` for transport and `protobuf` for
serialization.   The Gazebo GUI uses this communication system to talk to
the Gazebo server, which is where the actual simulation is executed.

Data is organized into `topics`, which are labels that allows producers and
consumers of different kinds of data to find each other.  The `gztopic`
tool is useful for inspecting a running Gazebo system.  E.g., to 
get the list of currently published topics:

        gztopic list 

You can easily write your own program to interact with Gazebo...TODO


