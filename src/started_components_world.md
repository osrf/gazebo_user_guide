World {#started__components__world}
======================

A World defines an environment and all of the objects in the environment.
A World is specified via [SDF](http://gazebosim.org/sdf), and can be edited
and saved in the graphical interface.

## Running a World ##

You can run a World, defined by an SDF file, from the command line using:

    gazebo <world_file_name>

You can find out the command line arguments to `gazebo` with the `-h` argument:

    gazebo -h

A useful parameter is to start simulation in a paused state:

    gazebo -u <world_file_name>

## Creating a World ##

The easiest way to create a world is to copy and make changes to an existing
[SDF](http://gazebosim.org/sdf) world file.  Please refer to the
[SDF](http://gazebosim.org/sdf) specification for additional information.

A simple mechanism to adding models to a world is through the `include` SDF element. The `include` SDF element requires a `uri` to a model, which can be of the following two forms:

1. `model://`: This specifies a model in the Model Database.
1. `file://`: This specifies a model file on disk.

Example:

A basic world may consist of just a light source and a ground plane:

    <?xml version="1.0" ?>
    <gazebo version="1.2">
      <world name="default">
        <!-- A global light source -->
        <include>
          <uri>model://sun</uri>
        </include>
    
        <!-- A ground plane -->
        <include>
          <uri>model://ground_plane</uri>
        </include>
      </world>
    </gazebo>

## Scene Parameters ##

Scene parameters define how the world environment looks. These parameters consist of:

- Ambient light: The color of global illumination.
- Sky: Cloud, sun, and moon parameters.
- Fog: Color, density, and type of fog.
- Grid: Enable or disable a grid plane visualization.

These parameters may be specified in
a [scene](http://gazebosim.org/sdf/1.2.html#scene) element in
[SDF](http://gazebosim.org/sdf), or modified in the graphical interface.

## Physics Parameters ##

Physics parameters define how the physics engine is run. These parameters
vary between physics engines. Please refer to the
[physics](http://gazebosim.org/sdf/1.2.html#physics) element in
[SDF](http://gazebosim.org/sdf).
