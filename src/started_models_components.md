Components {#started__models__components}
======================

### Components of Models ###

A model comprises the following components:

* **Link:** A link contains the physical properties of one body of the model. This can be, for example, a wheel or a link in a joint chain. Each link may contain many collision and visual elements. Try to reduce the number of links in your models to improve performance and stability. For example, a table model could consist of 5 links (4 for the legs and 1 for the top) connected via joints. However, this structure is overly complex, especially because the joints will never move. Instead, create the table with 1 link and 5 collision elements.

* **Collision:** A collision element describes the "shape" of a link for collision checking. This geometry can be a simple shape (preferred for better performance) or a triangle mesh (higher fidelity but lower performance). A link may contain 0 or more collision elements.

* **Visual:** A visual element describes the "shape" of a link for the purposes of displaying it to
the user and showing it (most) sensors. A link may contain 0 or more visual elements.

* **Inertial:** The inertial element describes the dynamic properties of the link, such as mass and rotational inertia.

* **Sensor:** A sensor, such as a camera, collects data from the world for use in plugins. A link may contain 0 or more sensors.

* **Joints:** A joint connects two links. A parent / child relationship is established along with other parameters such as axis of rotation and joint limits.

* **Plugins:** A plugin is a shared library that is loaded and can programmatically control a model.
  
