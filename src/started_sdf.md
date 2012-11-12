Simulation Description Format (SDF) {#started__sdf}
======================

Gazebo uses XML to load and save information about a simulation world or model. We have defined our own format, called Simulation Description Format (SDF), that encapsulates all the necessary information for a robotic simulator. This information includes:

-  **Scene**: Ambient lighting, sky properties, shadows.
-  **Physics**: Gravity, time step, physics engine.
-  **Models**: Collection of links, collision objects, joints, and sensors.
-  **Lights**: Point, spot, and directional light sources.
-  **Plugins**: World, model, sensor, and system plugins.


SDF is easily extensible and self-descriptive, and a command line tool (gzsdf) can update old versions of SDF to the latest version. 

The complete description of the SDF format is located at http://gazebosim.org/sdf

##SDF vs URDF##

URDF can be used for specifying only the kinematic and dynamic properties of a
single robot in isolation. URDF can not specify the pose of the robot itself
within a world. It is also not a *universal* description format since it cannot
specify joint loops, and it lacks friction and other properties. Additionally,
it cannot specify things that are not robots, such as lights, heightmaps, etc.

On an implementation side, the URDF syntax breaks proper formatting with
heavy use of XML attributes, which in turns makes URDF more inflexible.
There is also no mechanism for backward compatibility.

SDF solves all these problems. It is a complete description for everything from
the world level down to the robot level. It is highly scalable, and extremely
easy to add and modify elements. The SDF format is itself described using XML,
which facilitates a simple upgrade tool to migrate old versions to new
versions. It is also self descriptive.
