Components {#started__models__components}
======================

### Components of Models ###

* **Link:** A link contains the physical properties of one body of the model. This can be a wheel, or a link in a joint chain. Each link may contain many collision and visual elements. Try to reduce the number of links in your models in order to improve performance and stability. For example, a table model could consist of 5 links (4 for the legs and 1 for the top) connected via joints. However, this is overly complex, especially since the joints will never move. Instead, create the table with 1 link and 5 collision elements.

* **Collision:** A collision element encapsulates a geometry that is used to collision checking. This can be a simple shape (which is preferred), or a triangle mesh (which consumes greater resources). A link may contain many collision elements.

* **Visual:** A visual element is used to visualize parts of a link. A link may contain 0 or more visual elements.

* **Inertial:** The inertial element describes the dynamic properties of the link, such as mass and rotational inertia matrix.

* **Sensor:** A sensor collects data from the world for use in plugins. A link may contain 0 or more sensors.

* **Joints:** A joint connects two links. A parent and child relationship is established along with other parameters such as axis of rotation, and joint limits.

* **Plugins:** A plugin is a shared library created by a third party to control a model.
  
