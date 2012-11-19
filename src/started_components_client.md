Gazebo Client {#started__components__client}
======================

The Gazebo Client is a graphical interface that attaches to and visualizes
a world on a Gazebo Server. The graphical interface runs in a separate
process from the server, and the server and client may be run on different
computers.

## Usage ##

The client is run using:

    gzclient

By default, the client will try to connect to a master in order to discover
a server. The location of the master, which is automatically started by the
server when it is run, is specified using the GAZEBO_MASTER_URI environment
variable.
