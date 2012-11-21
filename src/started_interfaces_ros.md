ROS {#started__interfaces__ros}
===============

Gazebo is often used in concert with [ROS](http://ros.org), which provides
a large number of packages that are useful for controlling robots, whether
simulated or physical.  Gazebo is connected to ROS via plugins.  There are
two common types of Gazebo/ROS plugins:

* Sensor plugins: a sensor plugin is attached to a simulated sensor and is
resonsible for publishing that sensor's state to ROS in the appropriate
ROS message format.
* Robot control plugins: a robot control plugin is attached to a simulated
robot and is responsible for providing a ROS interface that matches what
the physical robot offers.  Such plugins can be simple, such as
implementing differential drive for 2-wheeled vehicles, or complex, such as
implementing sophisticated controllers for armed robots.

Examples of most commonly used ROS plugins can be found in
[gazebo_plugins](http://ros.org/wiki/gazebo_plugins) or
[drc plugins](https://bitbucket.org/osrf/drcsim).

In addition, a tutorial on how to compile a ROS enabled plugin within the
Gazebo framework can be found [in the wiki tutorials section](http://gazebosim.org/wiki/Tutorials/1.2/ros_enabled_model_plugin).

Once a ROS-enabled plugin is compiled, it should work just like any other
[Gazebo plugin](@ref started__components__plugins).
