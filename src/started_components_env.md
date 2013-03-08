Environment Variables {#started__components__env}
======================

Gazebo uses a number of environment variables to locate files and set up communications between the server and clients.

> **GAZEBO_MASTER_URI**: The hostname and port of the master, typically `http://localhost:11345`

> **GAZEBO_RESOURCE_PATH**: Colon-separated path to the resource files, typically `<gazebo_install_path>/share/gazebo-<version>`

> **GAZEBO_PLUGIN_PATH**: Colon-separated path to Gazebo plugins, typically `<gazebo_install_path>/lib/gazebo-<version>/plugins`

> **GAZEBO_MODEL_PATH**: Colon-separated path to locally available Gazebo models, typically
> `$HOME/.gazebo/models` (this is where models downloaded from the database are
> stored).

> **GAZEBO_MODEL_DATABASE_URI**: URI that points to an instance of a Gazebo model database, typically `http://gazebosim.org/models`

> **OGRE_RESOURCE_PATH**: Colon-separated path to Ogre plugins, typically `<ogre_install_path>/lib/OGRE`

> **GAZEBO_IP**: An optional environment variable that Gazebo will use when
> advertising your machine's IP address. This will override the default IP lookup.

> **GAZEBO_HOSTNAME**: An optional environment variable that Gazebo will use
> when advertising your machine's hostname. This will override both GAZEBO_IP and the default IP lookup.

A bash script is installed with Gazebo that will set these environment variables:

        source <gazebo_install_path>/share/gazebo-<version>/setup.sh

There's also a bash script in an unversioned directory that will attempt to
source the bash script from the latest installed version of Gazebo on your
system:

        source <gazebo_install_path>/share/gazebo/setup.sh
