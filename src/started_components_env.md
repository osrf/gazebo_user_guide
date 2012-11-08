Environment Variables {#started__components__env}
======================

Gazebo uses five environment variables to locate files, and setup communications between the server and clients.

> **GAZEBO_MASTER_URI**: The hostname and port of the master, typically `http://localhost:11345`

> **GAZEBO_RESOURCE_PATH**: Path to the resource files, typically `<gazebo_install_path>/shared/gazebo-<version>`

> **GAZEBO_PLUGIN_PATH**: Path to Gazebo plugins, typically `<gazebo_install_path>/lib/gazebo-<version>/plugins`

> **GAZEBO_MODEL_DATABASE_URI**: URI that points to an instance of a Gazebo model database, typically `http://gazebosim.org/models`

> **OGRE_RESOURCE_PATH**: Path to Ogre plugins, typically `<ogre_install_path>/lib/OGRE`

A bash script is installed with Gazebo that will set these environment variables:

        source <gazebo_install_path>/share/gazebo-<version>/setup.bash
