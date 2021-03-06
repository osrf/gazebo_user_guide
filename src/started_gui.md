Graphical User Interface {#started_gui}
======================
The Graphical User Interface (GUI) displays the simulation and lets users interact with the world via four components.  The GUI consists of the World View, Tree, Toolbar and Clock. The World View contains the world and models. The Tree hierarchically presents all of the components that make up the world and models. The Toolbar contains various controls that allow the user to switch interaction modes and insert simple shapes and lights. The clock at the bottom lets users play, pause and step through the simulation.

![](GUIwithLabels.png)


## The World View
The World View displays the world and all of the models therein. It is here that users can add, manipulate, and remove models. Users can switch between the View, Translate and Rotate modes in the left side of the Toolbar to switch between interaction modes within the World View. In View Mode, users can navigate around the world by panning, orbiting and zooming. Translate Mode lets users translate an object, and Rotate Mode, well, it lets you rotate an object. 

<!-- When an object is selected in the World View (by left-clicking in View Mode, or left-pressing in Translate or Rotate Modes), it is outlined in white. -->  

### Navigating in the World View
To take advantage of Gazebo's camera and object manipulation controls, you'll need a three-button mouse with a scroll wheel. There are three modes for interacting with the 3D window. To switch between modes, select the appropriate arrow from the Toolbar.

![](GUIMouseControls.png)


## The Tree
The Tree lists the models in the world, and allows users to change a variety of parameters for most models. The Tree is also where users can add new models to the world. The Tree consists of the World and Insert tabs. 

![](TreeTabs.png)

### World Tab
This tab is divided into Scene, Physics, Models, and Lights. Each section contains relevant parameters that can be altered by the user. These parameters appear in the bottom half of the Tree when an item is selected. 

#### Scene Item

Left-clicking on the scene item in the Tree will display properties associated with the look of the world. These properties include ambient color, sky parameters, and background color (if the sky is disabled).

#### Physics Item

Left-clicking on the physics item in the Tree will display properties associated with the physics engine. These properties include the physics engine update rate, the gravity vector, and other parameters specific to each physics engine.

**Tip:** Setting the update rate to be one over the time step will force Gazebo to run no faster than real-time.

#### Models Item

The models item contains a list of all models and their links. Left-clicking on a model or one of its links will display a list of properties associated with the selection.

Right-clicking on a model in the Models section gives you three options: Move to, Delete, Control Joints. The first moves the view to be directly in front of that model. The second option deletes the model, and the third provides information on joint control.

#### Lights Item

The lights item contains a list of all lights in the world. Left-clicking
on a light will display a list of properties associated with the selection.
These properties include the light's color, attenuation, and range.


### Insert Tab
The Insert Tab displays all of the models available for use in Gazebo. The first directory is your directory of local models. The second directory is the Gazebo model database. Once a model has been inserted from here, it will appear in the local directory as well.

To add a model to the world, left-click on the desired model in the Insert Tab, and move the cursor to the World View. The model should be attached to the cursor. Move it to the desired location and left-click again to release. You can then use the Translate and Rotate modes to orient the model more precisely.  


## Toolbar
The Toolbar sits at the top of the World View and provides tools with which to navigate and manipulate the world. 

![](Toolbar.png)

The arrow icons are the **View, Translate and Rotate modes.** These interaction modes allow users to navigate within the world and manipulate models. For more detailed information on using these modes, see Navigating in the World View (above). 

The **Cube, Sphere and Cylinder icons** let users add these simple shapes to the world. 

The **Point Light, Spot Light** and **Directional Light** icons allow users to insert light into the world. 
<br> **Note:** The sun is considered a directional light. Changing the *position* of a directional light will not change the light properties, like shadows. The *orientation* of the light is what affects the light properties. Use the Rotate tool to change the orientation of the directional light. 


## Clock
Users can start, pause and step through the simulation with the clock, located at the bottom of the World View. 

![](Clock.png)

Pressing **Play** starts the physics engine.

Pressing **Pause** pauses the physics engine. 

Pressing **Time Step** updates the physics engine one iteration. 

**Real Time Factor:** Displays how fast or slow the simulation is running in comparison to real time. A real time factor of 1.0 indicates that simulation is running at real-time, a factor less than 1.0 indicates simulation is running slower than real time, and greater then 1.0 indicates faster than real time.

**Sim Time:** Displays how long the simulation has been running, based on the Real Time Factor.

**Real Time:** Displays how long the simulation has been running. This value is computed by multiplying the number of simulation steps that have occurred by the physics step size.


## Menu

The menu options are as follows:

> File --> Save World As: Saves the current world to file<br/>
> File --> Quit: Bet you can't guess!<br/>
> Edit --> Reset Model Poses: Resets all models to their position when they were first inserted<br/>
> Edit --> Reset World: Resets model poses AND time<br/>
> View --> Grid: Checking/unchecking this reveals/hides the grid on the ground plane<br/>
> View --> Reset View: Returns the view to a default view <br/>
> View --> Full Screen: Puts the World View into fullscreen (To exit fullscreen mode, press F11 on your keyboard)<br/>

<!-- View Orbit View Control: Put mouse camera control into the default orbit mode<br/> -->
<!--Mention Snap to Grid -->



<!-- **Coming in a future release…** 

The Text Editor

The Console/Debug Window -->





