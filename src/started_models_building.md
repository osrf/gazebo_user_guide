Building a Model {#started__models__building}
======================

Models can range from simple shapes to complex robots. The name **model** refers
to the `<model>` [SDF](http://gazebosim.org/sdf) tag, and should
be thought of as a collection of links, joints, collision objects, visuals, and
plugins.  Creating a model file can be difficult depending on the complexity
of the desired model. This page will offer some tips on how to build a
model.

### Building a Model ###

**Step 1: Collect your meshes**
 
This step involves gathering all of the necessary 3D mesh files that are required
to build your model. Gazebo provides a set of simple shapes: box, sphere, and
cylinder. If your model needs something more complex, then continue reading.

Meshes can come from a number of places, if you don't already have them. [Google's 3D Warehouse](http://sketchup.google.com/3dwarehouse) is a good repository of 3D models. Alternatively, you can make your own meshes using a 3D modeler such as [Blender](http://blender.org) or [Sketchup](http://sketchup.google.com).  

Gazebo requires that mesh files be formatted as STL or COLLADA, with COLLADA
being the preferred format. 

* **Tip:** Use your 3D modeling software to move each mesh so that it is centered on the origin. This will make placement of the model in Gazebo significantly easier.

* **Tip:** COLLADA file formats allow you to attach materials to the meshes.  Use this mechanism to improve the visual appearance of your meshes.

* **Tip:** Keep meshes simple. This is especially true if you plan on using the mesh as a collision element. A common practice is to use a low polygon mesh for a collision element, and a higher polygon mesh for the visual. An even better practice is to use one of the built-in shapes (box, sphere, cylinder) as the collision element. 


**Step 2: Make your .model file**
 
Start by creating an extremely simple model file, or copy an existing model
file. The key here is to start with something that you know works, or can debug
very easily.
 
Here is a very rudimentary box model file with just a unit-sized box
shape as a collision geometry and the same unit box visual:

~~~~
<gazebo version="1.2">
<model name="my_model">
  <pose>0 0 0.5 0 0 0</pose>
  <static>true</static>
  <link name="link">
    <collision name="collision">
      <geometry>
        <box>
          <size>1 1 1</size>
        </box>
      </geometry>
    </collision>
    <visual name="visual">
      <geometry>
        <box>
          <size>1 1 1</size>
        </box>
      </geometry>
    </visual>
  </link>
</model>
</gazebo>
~~~~

Note that the origin of the Box-geometry is at the geometric center of the box,
so to have the bottom of the box flush with the ground plane, an
origin of `<pose>0 0 0.5 0 0 0</pose>` is added to raise the box above the
ground plane.

> **Tip:** The above example sets the simple box model to be static, which makes the model immovable. This feature is useful during model creation. Once you are done creating your model, set the `<static>` tag to "false" if you want your model to be movable.


**Step 3: Add to the .model file**

With a working model file, slowly start adding in more complexity. With each
new addition, load the model using the graphical client to make sure your model
is correct.

Here is a good order in which to add features:

 1.  Add a link
 2.  Set the collision element
 3.  Set the visual element
 4.  Set the inertial properties
 5.  Go to #1 until all links have been added.
 6.  Add all joints (if any) and unset model static flag
 7.  Add all plugins (if any)
