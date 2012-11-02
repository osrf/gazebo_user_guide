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
