Plugin Interfaces {#started__interfaces__plugin}
==

A plugin is a chunk of code that is compiled as a shared library and inserted into the simulation. The plugin has direct access to all the functionality of Gazebo through the standard C++ classes.

Plugins are useful because they:
 * let developers control almost any aspect of Gazebo
 * are self-contained routines that are easily shared
 * can be inserted and removed from a running system

Previous versions of Gazebo utilized controllers. These behaved in much the same way as plugins, but were statically compiled into Gazebo. Plugins are more flexible, and allow users to pick and choose what functionality to include in their simulations.

You should use a plugin when:
 * you want to programmaticaly alter a simulation
  * Ex: move models, respond to events, insert new models given a set of preconditions
 * you want a fast interface to gazebo, without the overhead of the transport layer
  * Eg: No serialization and deserialization of messages.
 * you have some code that could benefit others and want to share it
 
### Plugin Types

There are currently 4 types of plugins: World, Model, Sensor, and System. Each plugin type is managed by a different component of Gazebo. 
For example, a Model plugin is attached to and controls a specific model in Gazebo. Similarly, a World plugin is attached to a world, and a Sensor plugin to a specific sensor. The System plugin is specified on the command line, and loads first during a Gazebo startup. This plugin gives the user control over the startup process.

A plugin type should be chosen based on the desired functionality. Use a World plugin to control world properties, such as the physics engine, ambient lighting, etc. Use a Model plugin to control joints, and state of a model. Use a Sensor plugin to acquire sensor information and control sensor properties.

### Creating Plugins 

Plugins are designed to be simple. A bare bones world plugin contains a class with with a few member functions:

~~~
#include "gazebo.hh"
#include "common/common.h"
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
#include "gazebo.hh"
#include "common/common.h"
#include <stdio.h>

namespace gazebo
{
~~~

The `gazebo.hh` file includes a set basic gazebo functions. The `/common/common.h` file includes a set common gazebo header files. It doesn't include `physics/physics.h`, `rendering/rendering.h`, and `sensors/sensors.h` as those should be included on a case by case basis. Lastly, `<stdio.hh>` is necessary for the use of printf. Also, all plugins must be in the `gazebo` namespace.

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

The only other mandatory function is `Load` which receives an SDF element that contains the elements and attributes specified in loaded SDF file.

~~~
  GZ_REGISTER_WORLD_PLUGIN(HelloWorld)
~~~

Finally, the plugin must be registered with the simulator using the `GZ_REGISTER_WORLD_PLUGIN` macro. The only parameter to this macro is the name of the plugin class. There are matching register macros for each plugin type: `GZ_REGISTER_MODEL_PLUGIN`, `GZ_REGISTER_SENSOR_PLUGIN`, and `GZ_REGISTER_SYSTEM_PLUGIN`.

The following section contains instructions on how to compile this plugin.


### Compiling the Plugin

Please make sure that gazebo has been properly installed, if not, visit the [[install|install page]].

Create a new directory in your home directory and cd into it, for example
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

Compiling will result in a shared library, `~/gazebo_plugin_tutorial/build/libhello_world.so`, that can be inserted in a Gazebo simulation.

Lastly, add your library path to the `GAZEBO_PLUGIN_PATH`:
~~~
export GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH}:~/gazebo_plugin_tutorial/build
~~~

### Using a Plugin

Once you have a plugin compiled as a shared library (see above), you can attach it to a world or model in an SDF file (see [[sdf_format || SDF]] for more info). On startup, Gazebo parses the SDF file, locates the plugin, and loads the code. It is important that Gazebo is capable of finding the plugin. Either the full path to the plugin is specified, or the plugin exists in one of the paths in the GAZEBO_PLUGIN_PATHS environment variable.

Example world file also found in `examples/plugins/hello_world/hello.world`
~~~
<?xml version="1.0"?> 
<gazebo version="1.0">
  <world name="default">
    <scene>
      <ambient rgba="0.1 0.1 0.1 1"/>
      <background rgba="0 0 0 1"/>
      <shadows enabled="true"/>
    </scene>

    <physics type="ode">
      <gravity xyz="0 0 -9.8"/>
      <ode>
        <solver type="quick" dt="0.001" iters="100" sor="1.3"/>
        <constraints cfm="0.0" erp="0.2" contact_max_correcting_vel="100.0" contact_surface_layer="0.001"/>
      </ode>
    </physics>

    <!-- Ground Plane -->
    <model name="plane1_model" static="true">
      <link name="body">
        <collision name="geom_1">
          <geometry>
            <plane normal="0 0 1"/>
          </geometry>
        </collision>

        <visual name="visual_1" cast_shadows="false">
          <geometry>
            <plane normal="0 0 1"/>
          </geometry>
          <material script="Gazebo/Grey"/>
        </visual>
      </link>
    </model>

    <light type="directional" name="sun" cast_shadows="true">
      <origin pose="0 0 10 0 0 0"/>
      <diffuse rgba="0.8 0.8 0.8 1"/>
      <specular rgba="0 0 0 1"/>
      <attenuation range="20" constant="0.8" linear="0.01" quadratic="0.0"/>
      <direction xyz="1.0 1.0 -1.0"/>
    </light>
    <plugin name="hello_world" filename="libhello_world.so"/>
</gazebo>
~~~

Make a copy of the file in `~/gazebo_plugin_tutorial/hello.world`

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
