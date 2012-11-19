Components {#started__components}
======================

A Gazebo simulation consists of many parts that work together to produce an accurate and realistic environment for robots, sensors, and other objects.

The components of a simulation environment consist of:

- [World](@ref started__components__world): A collection of Models, Lights, Plugins, and global properties
  - [Models](@ref started__models): A collection of Links, Joints, Sensors, and Plugins
    - [Links](@ref started__models__components): A collection of Collision and Visual elements
      - [Collision](@ref started__models__components): A geometry that defines a colliding surface
      - [Visual](@ref started__models__components): A geometry that defines a visual representation
    - [Joints](@ref started__models__components): Constraints between Links
    - [Sensors](@ref started__models__components): Collect, process, and output data
- [Plugins](@ref started__components__plugins): Code attached to a World, Model, Sensor, or the simulator itself

The above hierarchy indicates the parent-child relationship between components. A set of components define how a simulation is run. 
A simulation run involves multiple processes working together:

- [Server](@ref started__components__server): The executable that runs the physics engine and sensor generation
- [Client](@ref started__components__client): This is the graphical interface, command line tools, and custom programs that interface with the Server
- [Messages](@ref started__components__messages): The set of messages that facilitate communication between the Server and Clients
- [Environment Variables](@ref started__components__env): A set of parameters that tell Gazebo where to look for resources, and how to run


### In this section:
- \subpage started__components__world
- \subpage started__components__plugins
- \subpage started__components__server
- \subpage started__components__client
- \subpage started__components__messages
- \subpage started__components__env
