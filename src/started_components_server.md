Gazebo Server {#started__components__server}
======================

The Gazebo Server is an executable called `gzserver` that runs the physics
engine and sensor generation. This executable runs the core features of
Gazebo, but does not provide a graphical interface. The separation of
a graphical interface gives Gazebo greater flexibility. For example, the
server may be run on remote machines, and in instances when a graphical
interface is not needed.

## Usage ##

The server may be run using:

    gzserver

You may also specify an SDF file to load:

    gzserver <world_filename>

The server automatically instantiates a master which is used by clients to
discover the server and subsequently worlds within the server. The location
of the master is specified using the GAZEBO_MASTER_URI environment variable.
