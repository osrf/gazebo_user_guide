Plugin Interfaces {#started__interfaces__plugin}
==

A plugin is a chunk of code that is compiled as a shared library and inserted into the simulation. The plugin has direct access to all the functionality of Gazebo through the standard C++ classes, documented in the public [API](http://gazebosim.org/api).

Plugins are useful because they:
 * let developers control almost any aspect of Gazebo
 * are self-contained routines that are easily shared
 * can be inserted and removed from a running system

Previous versions of Gazebo utilized controllers. These behaved in much the same way as plugins, but were statically compiled into Gazebo. Plugins are more flexible, and allow users to pick and choose what functionality to include in their simulations.

You should use a plugin when:
 * you want to programmatically alter a simulation
  * Ex: move models, respond to events, insert new models given a set of preconditions
 * you want a fast interface to Gazebo, without the overhead of the transport layer
  * Eg: no serialization and deserialization of messages
 * you have some code that could benefit others and want to share it
 
### Plugin Types

There are currently 5 types of plugins: World, Model, Sensor, Visual, and System. Each plugin type is managed by a different component of Gazebo. 
For example, a Model plugin is attached to and controls a specific model in Gazebo. Similarly, a World plugin is attached to a world, and a Sensor plugin to a specific sensor. The System plugin is specified on the command line, and loads first during a Gazebo startup. This plugin gives the user control over the startup process.

A plugin type should be chosen based on the desired functionality. Use a World plugin to control world properties, such as the physics engine, ambient lighting, etc. Use a Model plugin to control joints, and state of a model. Use a Sensor plugin to acquire sensor information and control sensor properties.

### Creating Plugins 

Plugins are designed to be simple. A bare bones World plugin contains a class with a few member functions:

~~~
#include <gazebo/gazebo.hh>
#include <gazebo/common/common.hh>
#include <stdio.h>

namespace gazebo
{
  class HelloWorld : public WorldPlugin
  {
    public: HelloWorld() : WorldPlugin() 
            {
              printf("Hello World!\n");
            }

    public: void Load(physics::WorldPtr _world, sdf::ElementPtr _sdf)
            {
            }

  };
  GZ_REGISTER_WORLD_PLUGIN(HelloWorld)
} 
~~~

The above code is also located in the Gazebo sources: `examples/plugins/hello_world/hello_world.cc`, along with an appropriate CMakeLists.txt file.

Let's go through the code.

~~~
#include <gazebo/gazebo.hh>
#include <gazebo/common/common.hh>
#include <stdio.h>

namespace gazebo
{
~~~

The `gazebo/gazebo.hh` file includes a set of basic Gazebo functions. The `gazebo/common/common.hh` file includes a set of common Gazebo header files. It doesn't include `gazebo/physics/physics.hh`, `gazebo/rendering/rendering.hh`, and `gazebo/sensors/sensors.hh` as those should be included on a case by case basis. Lastly, `<stdio.hh>` is necessary for the use of printf. Also, all plugins must be in the `gazebo` namespace.

~~~
  class HelloWorld : public WorldPlugin
  {
    public: HelloWorld() : WorldPlugin() 
            {
              printf("Hello World!\n");
            }
~~~

Each plugin must inherit from a plugin type, which in this case is the `WorldPlugin` class.

~~~
    public: void Load(physics::WorldPtr _world, sdf::ElementPtr _sdf)
            {
            }
~~~

The only other mandatory function is `Load` which receives an SDF element that contains the elements and attributes specified in the loaded SDF file.

~~~
  GZ_REGISTER_WORLD_PLUGIN(HelloWorld)
~~~

Finally, the plugin must be registered with the simulator using the `GZ_REGISTER_WORLD_PLUGIN` macro. The only parameter to this macro is the name of the plugin class. There are matching register macros for each plugin type: `GZ_REGISTER_MODEL_PLUGIN`, `GZ_REGISTER_SENSOR_PLUGIN`, `GZ_REGISTER_VISUAL_PLUGIN`, and `GZ_REGISTER_SYSTEM_PLUGIN`.

The following section contains instructions on how to compile this plugin.


### Compiling the Plugin

Please make sure that Gazebo has been properly installed. If not, visit the [install page] (http://gazebosim.org/wiki/Install).

Create a new directory in your home directory and cd into it, for example:
~~~
mkdir -p ~/gazebo_plugin_tutorial/build
cd ~/gazebo_plugin_tutorial
~~~

Save the above plugin class as `~/gazebo_plugin_tutorial/hello_world.cc`.

To compile the above plugin, create `~/gazebo_plugin_tutorial/CMakeLists.txt`:
~~~
cmake_minimum_required(VERSION 2.8 FATAL_ERROR)
include (FindPkgConfig)
if (PKG_CONFIG_FOUND)
  pkg_check_modules(GAZEBO gazebo)
endif()
include_directories(${GAZEBO_INCLUDE_DIRS})
link_directories(${GAZEBO_LIBRARY_DIRS})

add_library(hello_world SHARED hello_world.cc)
target_link_libraries(hello_world ${GAZEBO_libraries})
~~~

Change to the build directory.
~~~
cd build
~~~

Compile the code.
~~~
cmake ../
make
~~~

Compiling will result in a shared library, `~/gazebo_plugin_tutorial/build/libhello_world.so`, that can be inserted into a Gazebo simulation.

Lastly, add your library path to the `GAZEBO_PLUGIN_PATH`:
~~~
export GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH}:~/gazebo_plugin_tutorial/build
~~~

### Using a Plugin

Once you have a plugin compiled as a shared library (see above), you can attach it to a world or model in an SDF file (see [the SDF section](@ref started__sdf) for more info). On startup, Gazebo parses the SDF file, locates the plugin, and loads the code. It is important that Gazebo is capable of finding the plugin. Either the full path to the plugin is specified, or the plugin exists in one of the paths in the GAZEBO_PLUGIN_PATHS environment variable.

Here's an example world file, also found in `examples/plugins/hello_world/hello.world`
~~~
<?xml version="1.0"?> 
<gazebo version="1.2">
  <world name="default">

    <!-- Ground Plane -->
    <include>
      <uri>model://ground_plane</uri>
    </include>

    <!-- A global light source -->
    <include>
      <uri>model://sun</uri>
    </include>

    <plugin name="hello_world" filename="libhello_world.so"/>
  </world>
</gazebo>
~~~

Make a copy of that file, calling it,  e.g., `~/gazebo_plugin_tutorial/hello.world`

Run Gazebo as normal, and the plugin will be loaded automatically.  You should see output similar to:
~~~
gzserver ~/gazebo_plugin_tutorial/world_plugin.world 
Gazebo multi-robot simulator, version 1.0.0-RC2
Copyright (C) 2011 Nate Koenig, John Hsu, Andrew Howard, and contributors.
Released under the Apache 2 License.
http://gazebosim.org

Msg Waiting for master
Msg Connected to gazebo master @ http://localhost:11345
Hello World!
~~~
