Interfaces {#started__interfaces}
======================

- \subpage started__interfaces__plugin
- \subpage started__interfaces__comms
- \subpage started__interfaces__ros
- \subpage started__interfaces__player

This page describes how an external program can communicate with Gazebo. For most situations, a user of Gazebo will rely on an external library for robot control. These external libraries should supply functions that are used on real hardware platforms, such as path planning, joint control, and sensor processing. 

The following robot control libraries are supported by Gazebo:

* [http://www.ros.org/wiki/simulator_gazebo ROS]: It's highly recommended to use ROS with Gazebo. This is most well developed and tested robot control software available.
* [http://playerstage.sourceforge.net Player]: Limited support of Player is available. 

Additional interfaces are more than welcome. Please refer to the [[contributing]] page for information on adding new functionality to Gazebo.

Gazebo also supports a couple generic interfaces through [[tutorials/plugins | plugins]] and TCP/IP communication. 

# TCP Communication  #

This section lists all the topics that a running instance of Gazebo creates when started. 

You can also get the list of a running system by using this command

        gztopic list 

# Topic List #


**gazebo/<world_name>/world_stats**

> Type: [http://gazebo.willowgarage.com/api/interfaceWorldStatistics.html WorldStatistics]

> Desc: Broadcasts the simulation state.

**gazebo/<world_name>/world_control**
> Type: [http://gazebo.willowgarage.com/api/interfaceWorldControl.html WorldControl]

> Desc: Control the simulation (pause, step).

**gazebo/<world_name>/factory/request**
>  [http://gazebo.willowgarage.com/api/interfaceFactory.html Factory]

>  Create a new model.

**gazebo/<world_name>/factory/response**
>  [http://gazebo.willowgarage.com/api/interfaceFactory.html Factory]

>  Create a new model.

**gazebo/<world_name>/request**
>  [http://gazebo.willowgarage.com/api/interfaceRequest.html Request]

>  Send a request to the system. A response will be generated.

**gazebo/<world_name>/response**
>  [http://gazebo.willowgarage.com/api/interfaceResponse.html Response]

>  A response from a request is published on this topic.

**gazebo/<world_name>/model/info**
>  [http://gazebo.willowgarage.com/api/interfaceModel.html Model]

>  Get model info.

**gazebo/<world_name>/model/modify**
>  [[http://gazebo.willowgarage.com/api/interfaceModel.html Model]

>  Set model info.

**gazebo/<world_name>/scene**
>  [http://gazebo.willowgarage.com/api/interfaceScene.html Scene]

>   Get/Set scene info.

**gazebo/<world_name>/physics**
>  [http://gazebo.willowgarage.com/api/interfacePhysics.html Physics]

>  Get/Set physics engine properties.

**gazebo/<world_name>/selection**
>  [http://gazebo.willowgarage.com/api/interfaceSelection.html Selection]

>  Set/Get entity user selection.

**gazebo/<world_name>/pose/info**
>  [http://gazebo.willowgarage.com/api/interfacePose.html Pose]

>  Get entity pose. Publications on this topic should only come from the core system.

**gazebo/<world_name>/pose/modify**
>  [http://gazebo.willowgarage.com/api/interfacePose.html Pose]

>  Set entity pose.

**gazebo/<world_name>/light**
>  [http://gazebo.willowgarage.com/api/interfaceLight.html Light]

>  Set/Get light properties.

**gazebo/<world_name>/visual**
>  [http://gazebo.willowgarage.com/api/interfaceVisual.html Visual]

>  Set/Get visual properties.

**gazebo/<world_name>/joint**
>  [http://gazebo.willowgarage.com/api/interfaceJoint.html Joint]

>  Set/Get joint properties.
