Command Line Tools {#started__commandlinetools}
======================
Gazebo offers a few command line tools for interacting with the simulation world.

* **World Statistics** - Check general simulator status and performance.

* **Topic Info** - Introspection tools for viewing Gazebo transport system status.

* **SDF Utility** - Tool for manipulating SDF model files.

* **Factory** - Simple tool to spawn or delete models in simulation from the command line.



World Statistics
--

The `gzstats` tool displays general statistics about the currently running world.

**Usage:**

 > gzstats \<world_name\>
 > > \<world_name\> : Name of the world (Default = "default")

**Example:**

        $ gzstats
        
         Factor[478.00] SimTime[831968.73] RealTime[2093.69] Paused[F]
         Factor[399.00] SimTime[832048.58] RealTime[2093.89] Paused[F]
         Factor[398.67] SimTime[832127.75] RealTime[2094.09] Paused[F]

Topic Info
--
The `gztopic` tool displays information about published topics.

**Usage:**

>  gztopic \<command\> \<option\>

> > list         : List all topics

> > info \<topic\> : Get information about a topic

> > echo \<topic\> : Output topic data to screen

> > hz \<topic\>   : Get publish frequency

> > help         : Display help text

**Examples:**

        $ gztopic list
        
         /gazebo/default/gui
         /gazebo/default/scene
         /gazebo/default/response
         /gazebo/default/world_stats
         /gazebo/default/selection
         /gazebo/default/model/info
         /gazebo/default/pose/info
         /gazebo/default/visual
         /gazebo/default/request
         /gazebo/default/joint
         /gazebo/world/modify

        $ gztopic info /gazebo/default/world_stats
        
         Type: gazebo.msgs.WorldStatistics
         
         Publishers:
          127.0.1.1:38186
         
         Subscribers:
          127.0.1.1:48983

        $ gztopic hz /gazebo/default/world_stats
        
         Hz:   4.63
         Hz:   5.56
         Hz:   4.63
         Hz:   5.56

SDF Utility
--
The `gzsdf` tool provides information about SDF files, and converts them from old or deprecated formats.

**Usage:**

> gzsdf <command>

> Commands:

> > describe \<SDF version\>:     Print the SDF format

> > convert \<file\>:             In-place conversion to the latest format

> > doc \<SDF version\>:          Print HTML SDF

> > check \<file\> \<SDF version\>: Check the SDF format for the given file

> > print \<SDF version\>:         Prints SDF, useful for  debugging and as a conversion tool


**Examples:**

        $ gzsdf print ~/.gazebo/models/bowl/model.sdf

        <gazebo version='1.2'>
          <model name='bowl'>
            <link name='link'>
              <inertial>
                <mass>0.100000</mass>
              </inertial>
              <collision name='collision'>
                <geometry>
                  <cylinder>
                    <radius>0.098000</radius>
                    <length>0.035000</length>
                  </cylinder>
                </geometry>
              </collision>
              <visual name='visual'>
                <geometry>
                  <mesh>
                    <uri>model://bowl/meshes/bowl.dae</uri>
                  </mesh>
                </geometry>
              </visual>
              <velocity_decay>
                <linear>0.000000</linear>
                <angular>0.000000</angular>
              </velocity_decay>
            </link>
          </model>
        </gazebo>

Factory
--
This tool is for spawning or deleting models into or from a running Gazebo simulation.


**Usage:**

>   gzfactory <spawn|delete> [options]

> >   spawn   : Spawn new model. Must specify an SDF model file.

> >   delete  : Delete existing model. Must specify model name.

> Allowed options:

> > -h [ --help ]:           Produce this help message

> > -f [ --sdf ] <arg>:        SDF model file

> > -w [ --world-name ] <arg>: Name of Gazebo world

> > -m [ --model-name ] <arg>: Model name

> > -x [ --pose-x ] <arg>:     Set model x position

> > -y [ --pose-y ] <arg>:     Set model y position

> > -z [ --pose-z ] <arg>:     Set model z position

> > -R [ --pose-R ] <arg>:     Set model roll orientation in radians

> > -P [ --pose-P ] <arg>:     Set model pitch orientation in radians

> > -Y [ --pose-Y ] <arg>:     Set model yaw orientation in radians

**Examples:**

        gzfactory spawn -f ~/.gazebo/models/bowl/model.sdf -m bowl -x -10 -y 0 -z 1 -R 0 -P 0 -Y 0
