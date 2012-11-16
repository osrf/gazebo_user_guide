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

The most commonly used ROS plugins can be found...TODO 

To load the common ROS plugins...TODO
