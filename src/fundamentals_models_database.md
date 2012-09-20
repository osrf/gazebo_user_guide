Model Database {#fundamentals__models__database}
==

Models in Gazebo define a physical entity with dynamic, kinematic, and visual properties. In addition a model may have one or more plugins which effect the model's behavior. A model can represent anything from a shape to a complex robot, even the ground is a model. 

Gazebo ships with a few models such a tables, chairs, and a Pioneer2dx robot, however Gazebo cannot include sufficient models to meet all needs. Instead, a model database stores models created by the Gazebo community. Browse this database to find and use models for your projects. When you create new models, please upload them to the database for the benefit of all.

## Model Format ##
Models are packaged as tarballs with the following contents:

        model_name/
          plugins/
            CMakeLists.txt
            All plugin source & header files
          meshes/
            All 3D meshes (collada and STL)
          materials/
            scripts/
              All Ogre3d material scripts
            textures/
              All image files
          models/
              model_name.sdf
          manifest.xml


## Manifest XML ##

The description XML file contains meta information about the model.

<b>\<version\></b> *required*

> Version of this model.

<b>\<author\></b> *optional*

> <b>\<name\></b> *optional*

> > Name of the model author.

> <b>\<email\></b> *optional*

> > Email of the author.

<b>\<description\></b> *optional*

> Description of the model should include:
>  * What the model is (robot, table, cup)
>  * What the plugins do (functionality of the model)

<b>\<depend\></b> *optional*

> <b>\<model\></b> *required*

> > Name of another model.

> <b>\<version\></b> *required*

> >   Version of another model.

<b>\<plugin\></b> *optional*

> <b>\<gazebo_version\></b>

> > Gazebo version required for the plugins.
