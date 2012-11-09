Models {#started__models}
======================
Fundamentally, simulation is about *modeling*: capturing the physical
properties of an object, process, or system in a set of relationships,
rules, and parameters that can be written down (and understood by a computer).
Much of Gazebo is concerned with building, storing, loading, instantiating,
and using models.

For Gazebo, a *model* is the specification of properties that are necessary
to simulate part of a robot or its environment.   Models are defined using
the Simulation Description Format (SDF), and XML-based language for
describing simulation environments and objects.  For the full definition of
what can be specified for a model, consult the [SDF
documentation](http://gazebosim.org/sdf/1.2.html).

The most commonly defined [components](@ref started__models__components) of
a model are:

* **link:** a rigid body with physical properties (e.g., mass, inertia,
friction), such as a robot upper arm or lower arm
* **joint:** a connection between two links, such as a robot elbow
* **sensor:** a device that gathers information about the environment, such
as a laser range-finder or camera
* **collision:** the "shape" of a link for the purposes of determining how
it physically interacts with other objects in the world; e.g., a robot
upper arm's collision body might be a cylinder
* **visual:** the "shape" of a link for the purposes of displaying it to
the user and showing it (most) sensors; e.g., a robot upper arm's visual
body might be a carefully detailed 3-D mesh

These and other properties of a model are written using SDF and are stored in
files, either locally on the user's machine or in the online 
[model database](@ref started__models__database).  
[Building a model](@ref started__models__building) is the process of writing that SDF file.  Models
can be used hierarchically: one model can include another model as a child,
such as when attaching a pre-defined model of a laser range-finder to a new
robot.  And models can be multiply instantiated, which is useful if, for
example, you want two copies of a robot in your world.  Models are easy to
share, either by giving the model file(s) directly to others, or by adding
them to the online [model database](@ref started__models__database).


### In this section:
- \subpage started__models__components
- \subpage started__models__building
- \subpage started__models__database
