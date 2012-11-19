Plugins {#started__components__plugins}
======================

Plugins provide programmatic control over all aspects of Gazebo. Please refer
to the [API](http://gazebosim.org/api) for documentation on classes,
functions, and parameters within the Gazebo code base.

A plugin is compiled against the Gazebo libraries, and is dynamically loaded at run-time. There are five plugin types:

- World: Plugin receives a pointer to the World instance
- Model: Plugin receives a pointer to a Model instance
- Sensor: Plugin receives a pointer to a Sensor instance
- Visual: Plugin receives a pointer to a Visual instance
- System: Plugin receives the command line arguments

## Usage ##

You can include a plugin in a world with the [plugin](http://gazebosim.org/sdf/1.2.html#plugin) SDF element.

## Example ##

This example creates a World plugin:

    <world name="default">
        <plugin name="my_plugin" filename="libmy_plugin.so"/>
    </world>

This example creates a Model plugin:

    <world name="default">
      <model name="default">
          <plugin name="my_plugin" filename="libmy_plugin.so"/>
      </model>
    </world>

## Plugin Search Path ##

Gazebo will first try to find a plugin in the current working directory, and
then it will search for the plugin based on the GAZEBO_PLUGIN_PATH
environment variable.
