Player {#started__interfaces__player}
===============

Gazebo can be used with [Player](http://playerstage.sf.net), which provides
libraries and tools useful for controlling robots, whether simulated or
physical.  Gazebo is connected to Player via a plugin, `libgazebo_player`,
that is provided with Gazebo.  This plugin implements the more common
Player interfaces (contributions are most welcome to extend the plugin).
When the plugin is loaded, Gazebo appears just like a normal Player server
and can be controlled with standard Player clients.

## Player Configuration ##

A configuration file is required by Player that tells it what drivers to load. When used with Gazebo, the Player configuration file must have the following content:

~~~~
driver
(
  name "gazebo"
  provides ["simulation:0"]
  plugin "libgazebo_player"
  server_id "default"
)
~~~~

The above driver tells Player to load the `libgazebo_player` plugin which handles communication between Gazebo and Player.

Additional Player drivers can be added, such as a position driver:

~~~
driver
(
  name "gazebo"
  provides ["position2d:0"]
  gz_id "pioneer2dx"
)
~~~

Each driver `name` must be set to `gazebo`. The `gz_id` string must match a model within a running Gazebo simulation. In the above instance, Gazebo must have a model called `pioneer2dx`.

Here is the complete player configuration file:

~~~
driver
(
  name "gazebo"
  provides ["simulation:0"]
  plugin "libgazebo_player"
  server_id "default"
)

driver
(
  name "gazebo"
  provides ["position2d:0"]
  gz_id "pioneer2dx"
)
~~~

Save the above configuration file as `gazebo.cfg`

## Gazebo World ##

An Gazebo world file that matches the above player configuration would be:

~~~
<?xml version="1.0" ?>
<gazebo version="1.2">
  <world name="default">
    <!-- Ground -->
    <include>
      <uri>model://ground_plane</uri>
    </include>

    <!-- Pioneer2dx model -->
    <include>
      <uri>model://pioneer2dx</uri>
    </include>

    <!-- A global light source -->
    <include>
      <uri>model://sun</uri>
    </include>

  </world>
</gazebo>
~~~

Save the above world file as `pioneer2dx.world`

## Running Gazebo and Player ##

Make sure you have saved the above player configuration as `gazebo.cfg`, and the Gazebo world file as `pioneer2dx.world`.

Start Gazebo:

~~~
gazebo pioneer2dx.world
~~~

Start Player:

~~~
player gazebo.cfg
~~~

You'll now be able to run `playerv` or other player clients.
