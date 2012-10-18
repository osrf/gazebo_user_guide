System Requirements {#installation__requirements}
============

**Ubuntu users**: the system requirements listed here are handled
automatically when you install Gazebo via *apt-get*.  See the [installation
instructions](http://gazebosim.org/wiki/install) for version 1.2 and above.

We develop and run Gazebo primarily on Ubuntu Linux.  You will have the
easiest time and best experience if you start with a reasonably modern
Ubuntu system.  At the time of writing we are developing Gazebo on Ubuntu
12.04 (precise).  We plan to support Gazebo on other platforms and welcome
patches that improve the portability of Gazebo.

Depending on what kind of environment and robots you're simulating, Gazebo
can be computationally intensive.  The exact CPU requirements will depend
on how you use Gazebo, but in general we recommend that you err on the side
of having a more powerful CPU.

Gazebo's rendering engine uses OpenGL via OGRE; as such it requires a
graphics card (GPU) when running the GUI or when visualizing certain kinds
of sensor data (e.g., cameras).  You should ensure that your GPU is
properly configured, with OpenGL support enabled (in Linux check that
*glxinfo* runs without an error).  Using a GPU that is poorly supported by
the operating system is a frequent source of trouble when running Gazebo
(as well as many other 3-D applications).  We have had the best experience
in Linux with NVIDIA GPUs, using the "restricted" kernel modules.

Gazebo depends on the components listed below.  You'll need to install them
before compiling Gazebo source.  Before compiling from source, check the
[downloads page](http://gazebosim.org/downloads.html) for the latest status
on pre-compiled binaries for your platform.

Required
--
**OGRE**

 - Version: >= 1.7.1
 - Web: http://www.ogre3d.org
 - Purpose: Rendering and sensor data generation.
 - Note: For heightmap support in Gazebo, OGRE must be compiled with Cg support.

**Protobuf**

 - Version: >= 2.3.0
 - Web: http://code.google.com/p/protobuf/
 - Purpose: Message passing between server and clients

**TinyXML**

 - Version: >= 2.6.2
 - Web: http://www.grinninglizard.com/tinyxml/
 - Purpose: Parse SDF files.

**libxml-2**

 - Version: >= 2.7.7
 - Web: http://xmlsoft.org/
 - Purpose: Support for deprecated XML file formats.

**TBB**

 - Version: >= 3.0
 - Web: http://threadingbuildingblocks.org/
 - Purpose: Improve performance in complex simulations.

**Boost**

 - Version: >= 1.40.0
 - Web: http://boost.org
 - Components: thread, signals, system, filesystem, program-options, regex, iostreams
 - Purpose: Cross-platform toolset.

**FreeImage**

 - Version: >= 3.0
 - Web: http://freeimage.sourceforge.net/
 - Purpose: Load image files for use within Gazebo.

**OpenGL**

 - Version: N/A
 - Web: N/A
 - Note: OpenGL is provided by the vendor (e.g. nVidia, ATI, Intel), of your graphics card.

**libcurl**

 - Version: >= 4.0
 - Web: http://curl.haxx.se/libcurl/
 - Purpose: Interface to the model database.

**libtar**

 - Version: >= 1.2
 - Web: http://www.feep.net/libtar/
 - Purpose: Unpack models downloaded from the model database.

**pkg-config**

 - Version: >= 0.26
 - Web: http://www.freedesktop.org/wiki/Software/pkg-config
 - Purpose: Find software packages during compile.

**libltdl**

 - Version: >=2.4.2
 - Web: http://www.gnu.org/software/libtool/
 - Purpose: Load plugins.

Optional
--
**CEGUI**

 - Version: 0.7.5
 - Web: http://www.cegui.org.uk/wiki/index.php/Main_Page
 - Purpose: Design custom graphical interfaces for Gazebo.

**Player**

 - Version: >= 3.0
 - Web: http://playerstage.sourceforge.net
 - Purpose: Use Player to control robots within Gazebo.

**urdfdom**

 - Version: >= 0.2.2
 - Web: https://kforge.ros.org/projects/robotmodel/services/urdfdom/
 - Purpose: Load URDF files into Gazebo.

**ffmpeg**
 - Version: >=0.8.3
 - Web: http://ffmpeg.org
 - Purpose: Playback movies on textured surfaces within Gazebo.
