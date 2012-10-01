Introduction to Gazebo {#overview__intro}
========


What is Gazebo?
--

Gazebo is a multi-robot simulator for outdoor environments. Like Stage (part of the Player project), Gazebo is capable of simulating a population of robots, sensors and objects, but does so in a three-dimensional world. It generates both realistic sensor feedback and physically-plausible interactions between objects (it includes an accurate simulation of rigid-body physics).

Check out the [Features](overview__features.html) page for a full list of Gazebo's functionality.

Why use Gazebo?
--

Gazebo was originally designed to aid in the development process of algorithms for robotic platforms. Because Gazebo realistically simulates robots and environments, code designed to operate a physical robot can be executed on an artificial version. This helps to avoid common problems associated with hardware such as short battery life, hardware failures, and unexpected and dangerous behaviors. It is also faster to spin up a simulation engine than continually run code on a robot, especially when the simulation engine can run faster than real-time.

Over the years Gazebo has also been used for regression testing. Scenarios designed to test algorithm functionality have been established and passed through test rigs. These tests can be run continually to maintain code quality and functionality. 

Numerous researchers have also used Gazebo to develop and run experiments solely in a simulated environment. Controlled experimental setups can easily be created in which subjects interact with robots in a realistic manner. Additionally, Gazebo has been used to compare algorithms for such things as navigation and grasping in a controlled environment. 

Gazebo in the Future
--

Gazebo is under active development at the Open Source Robotics Foundation. We are continually fixing bugs, and adding new features. If you have feature requests, need help, or have bugs to report please refer to the [Support page] (http://gazebosim.org/support.html).


Useful Skills
--

While we're working to make Gazebo more accessible to users with varying technical skills and computer configurations, users will have an easier time using Gazebo if they have experience with the following:

 * programming skills?
 * something else?
 * something about ROS?
 * something about robotics?

Gazebo currently requires Linux/Ubuntu...