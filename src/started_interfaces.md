Interfaces {#started__interfaces}
======================
Gazebo offers several methods for interfacing with your code.  These
methods fall into two camps: in-process and inter-process.  The in-process
interface method is to use [plugins](@ref started__interfaces__plugin).  Plugins
are written in C++, compiled as shared objects, and loaded into the same
address space as Gazebo.

The inter-process interface methods are numerous, but the most common ones
are [Gazebo communication](@ref started__interfaces__comms),
[ROS](@ref started__interfaces__ros), and [Player](@ref started__interfaces__player).
If you would like to connect Gazebo to a different communication system,
you probably want to write a plugin that interacts with the simulation
environment and sends and receives messages (or whatever is appropriate);
this is how Gazebo interfaces with ROS and Player.

If you intend for your code to be transferable to a physical robot, you
should watch how you are interacting with Gazebo.  If you make unrealistic
assumptions in the code you write to control simulated robots, you may have
trouble transitioning to physical robots.  This problem is likely if
important functionality is put into Gazebo plugins when there is no
analogous environment to run that code on the robot.  For portability to
hardware, it is best to keep algorithms (perception, planning, etc.)
outside of Gazebo and use standard middleware (ROS, Player, etc.) to
communicate with simulation.


### In this section:
- \subpage started__interfaces__plugin
- \subpage started__interfaces__comms
- \subpage started__interfaces__ros
- \subpage started__interfaces__player
