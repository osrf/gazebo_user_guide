Architecture {#started__arch}
======================

**Gazebo is divided into several libraries:**

 + **Physics:** Maintains and updates the physical state of the simulation.
 + **Rendering:** Visualizes the simulation state.
 + **Sensors:** Generates sensor data.
 + **Transport:** Handles communication between processes.
 + **GUI:** Allows visualization and manipulation of the simulation.

**These libraries are used by two main processes:**

+ **Server:** Runs the physics loop and generates sensor data.
  + *Executable:* `gzserver`   
  + *Libraries:* Physics, Sensors, Rendering, Transport

+ **Client:** Provides user interaction and visualization of a simulation.
  + *Executable:* `gzclient`
  + *Libraries:* Transport, Rendering, GUI

![Gazebo Architecture Diagram](architecture.png)

### Physics Library
  The physics library runs the physics update cycle, loads and maintains all the models and their plugins, and is capable of saving and loading simulation state.
  Gazebo utilizes 3rd party physics engines, such as [ODE](http://opende.sourceforge.net) or [Bullet](http://bulletphysics.org), to compute the proper dynamic and kinematic effects.

  > **Plugin Support:** Plugins can be loaded into the World and into individual models.

### Rendering Library
  The rendering library utilizes [OGRE](http://ogre3d.org) to visualize the
  simulation world. This library is used by the graphical interface to
  allow the user to see and interact with simulation.  It is also used by
  the sensor library to generate data for sensors like cameras.

  > **Plugin Support:** Forthcoming
 
### Sensors Library
  The responsiblity of this library is to load and update individual
  sensors such as lasers, cameras, and IMUs.

  > **Plugin Support:** Plugins can be loaded into each sensor.

### Transport Library
  This library uses [boost::asio](http://www.boost.org/doc/libs/1_51_0/doc/html/boost_asio.html) to create and maintain socket-based connections between Gazebo components. [Google protobuf](http://code.google.com/p/protobuf/) provides the message serialization and deserialization infrastructure to pass data between components.

  > **Plugin Support:** None

### GUI Library
  This library uses [Qt](http://qt-project.org/) to allow users access to a running simulation. The GUI provides a mechanism to view, create, modify, and save simulation instances.

  > **Plugin Support:** Forthcoming
