Command Line Interface {#started_commandlineinterface}
======================

## Environment Setup

### Linux

Gazebo in the Linux environment relies on a few environment variables to specify paths to various component and resource files.
For a Debian system, the environment variables are set in a script called `setup.sh`.
To invoke the script and configure the environment variables needed for Gazebo to function properly, type
 (note `1.X` should be replace by the actual Gazebo release version):

    $ source /usr/share/gazebo-1.X/setup.sh

For example, Gazebo 1.2 sets up the following environment variables:

    $ more /usr/share/gazebo-1.2/setup.sh 
    export GAZEBO_MASTER_URI=http://localhost:11345
    export GAZEBO_MODEL_DATABASE_URI=http://gazebosim.org/models
    export GAZEBO_RESOURCE_PATH=/usr/share/gazebo-1.2:/usr/share/gazebo_models
    export GAZEBO_PLUGIN_PATH=/usr/lib/gazebo-1.2/plugins
    export LD_LIBRARY_PATH=/usr/lib/gazebo-1.2/plugins:${LD_LIBRARY_PATH}
    export OGRE_RESOURCE_PATH=/usr/lib/OGRE


## Gazebo Executables

Once you have configured the environment variables,
the command line interface allows you to startup Gazebo's Server or Client individually or at the same time.
Please review the [architecture section](started__arch.html) for details on the Server and Client.
While it is recommended that beginner users use *gazebo* to start both Server and Client instances at the same time,
the available options are:

*  *gzserver* starts a *Server* process.

        $ gzserver --help
        Gazebo multi-robot simulator, version 1.2.5
        Copyright (C) 2012 Nate Koenig, John Hsu, and contributors.
        Released under the Apache 2 License.
        http://gazebosim.org

        Run the Gazebo server.

        Usage: gzserver [options] <world_file>

        Allowed options:
          -h [ --help ]              Produce this help message.
          -u [ --pause ]             Start the server in a paused state.
          -s [ --server-plugin ] arg Load a plugin.

*  *gzclient* starts a *Client* process.

        $ gzclient --help
        Gazebo multi-robot simulator, version 1.2.5
        Copyright (C) 2012 Nate Koenig, John Hsu, and contributors.
        Released under the Apache 2 License.
        http://gazebosim.org

        Usage: gzclient [-h]
          -h            : Print this message.
        Allowed options:
          -h [ --help ]           Produce this help message.
          -g [ --gui-plugin ] arg Load a plugin.

*  *gazebo* starts the *Server*(gzserver) and *Client*(gzclient) in separate processes.

        $ gazebo --help
        Gazebo multi-robot simulator, version 1.2.5
        Copyright (C) 2012 Nate Koenig, John Hsu, and contributors.
        Released under the Apache 2 License.
        http://gazebosim.org

        Usage: gzclient [-h]
          -h            : Print this message.
        Allowed options:
          -h [ --help ]              Produce this help message.
          -u [ --pause ]             Start the server in a paused state.
          -s [ --server-plugin ] arg Load a plugin for the server.
          -g [ --gui-plugin ] arg    Load a plugin for the gui client.


Example
--
For example, to start an empty world paused, type:

        $ gazebo -u worlds/empty.world

Note that this is assuming that there is a file named `empty.world` in the path defined by

        ${GAZEBO_RESOURCE_PATH}/worlds/empty.world


