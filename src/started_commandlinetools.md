Command Line Tools {#started__commandlinetools}
======================
THE COMMAND LINE TOOLS ARE USED TO...

THERE ARE 4 (??) MAIN COMMAND LINE TOOLS:...

**World Statistics**

**Topic Info**

**SDF Utility**

**Factory**



World Statistics
--

The `gzstats` tool displays general statistics about currently running world.

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
