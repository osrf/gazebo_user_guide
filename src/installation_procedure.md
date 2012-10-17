Installation Procedure {#installation__procedure}
============
EVERYONE READ:
==
1. Do not install Ogre from a PPA. That source is broken.
2. ROS Users: Do not install gazebo from here. Use these [instructions] (http://www.ros.org/wiki/ROS/Installation).
3. If you are new to Gazebo or just want to use Gazebo as a stand-alone application, then choose the Ubuntu or Tarball  instructions below.
4. If you're still reading, select a download method below. 

Ubuntu {#installation__procedure__ubuntu}
==

1.  Download the Debian binary from the [Downloads] (http://gazebosim.org/downloads.html) page.
2.  Select the Gazebo Debian package from your browser's download history, and click install.
3.  Alternatively, open a terminal and navigate to the location of the Gazebo Debian package. Then manually install

        sudo dpkg -i gazebo-1.0.0.deb
4.  If the above command lists a set of failed dependencies, run the following command and try {{{dpkg}}} again.

        sudo apt-get -f install
5. Setup environment variables

        echo "source INSTALL_PATH/share/gazebo-1.0.0/setup.sh" >> ~/.bashrc
        source ~/.bashrc

  If Gazebo was installed to /usr (which is the default) then:

        echo "source /usr/share/gazebo-1.0.0/setup.bash" >> ~/.bashrc
        source ~/.bashrc


**NOTE, for Ubuntu 12.04 only:**

The debian install of Ogre is broken in 12.04. You will need to create a custom `setup.bash` file.
  
1. Create a configuration directory

            mkdir ~/.gazebo
2. Select the option that matches your machine.

     a. 32bit machine:

             echo "export OGRE_RESOURCE_PATH=/usr/lib/i386-linux-gnu/OGRE-1.7.4" > ~/.gazebo/setup.bash
     b. 64bit machine:

             echo "export OGRE_RESOURCE_PATH=/usr/lib/amd64-linux-gnu/OGRE-1.7.4" > ~/.gazebo/setup.bash
     c. 64bit intel machine

             echo "export OGRE_RESOURCE_PATH=/usr/lib/x86_64-linux-gnu/OGRE-1.7.4" > ~/.gazebo/setup.bash
3. Add the new setup.bash to your `~/.bashrc`

            echo "source ~/.gazebo/setup.bash" >> ~/.bashrc

            source ~/.bashrc

Gentoo
==

**Note: This is a work in progress**

    sudo emerge --noreplace layman git
    sudo layman -a ezod
    sudo emerge gazebo

**Issues:**

1. The official Portage tree doesn't have an ebuild for OGRE 1.7.1 or later yet, so you will also need to add the "gamerlay" overlay (which contains an ebuild for OGRE 1.7.3).
2. Similarly, there is no ebuild for Player in the official tree, but one is available in the "science" overlay. Compiling with Player support is optional and controlled via the "player" USE flag.
 
Tarball
==

1. Install prerequisites.  A clean Ubuntu system will need:

        sudo apt-get install build-essential libtinyxml-dev libtbb-dev libxml2-dev libqt4-dev pkg-config  libprotoc-dev libfreeimage-dev libprotobuf-dev protobuf-compiler libboost-all-dev freeglut3-dev cmake libogre-dev

 Optionally, you may also want:

        sudo apt-get install -y build-essential libtinyxml-dev libtbb-dev libxml2-dev libqt4-dev pkg-config  libprotoc-dev libfreeimage-dev libprotobuf-dev protobuf-compiler libboost-all-dev freeglut3-dev cmake libogre-dev
2. Download the .bz2 or .zip from the [Downloads] (http://gazebosim.org/downloads.html) page.
3. Open a terminal and change directory to the location of the downloaded tarball.
4. Unpack the tarball

        tar jxvf gazebo-<version_number>.tar.bz2

  or 

        unzip gazebo-<version_number>.zip
5. Change directory into the Gazebo sources

        cd gazebo-<version_number>
6. Create a build directory

        mkdir build
7. Change directory in the new build directory

        cd build
8. Configure Gazebo

        cmake ../
9. The output from `cmake ../` may generate a number of errors about missing packages. You must install these missing packages and re-run `cmake ../`. Make sure all the build errors are resolved before continuing (they should be there from the earlier step in which you installed prerequisites).
10. Build Gazebo

        make
11. Install Gazebo

        make install
12. Setup environment variables

        echo "source <install_path>/share/gazebo-1.0.0/setup.bash" >> ~/.bashrc
        source ~/.bashrc

  If Gazebo was installed to `/usr` (which is the default) then:

        echo "source /usr/share/gazebo-1.0.0/setup.bash" >> ~/.bashrc
        source ~/.bashrc

Mercurial
==

1. Clone the repository

        hg clone https://bitbucket.org/osrf/gazebo gazebo
2. Change directory in the repository

        cd gazebo
3. Create a build directory

        mkdir build
4. Change directory in the new build directory

        cd build
5. Configure Gazebo

        cmake ../
6. The output from `cmake ../` may generate a number of errors about missing packages. You must install these missing packages and re-run `cmake ../`. Make sure all the build errors are resolved before continuing.

  A clean Ubuntu system will need to run

        sudo apt-get install build-essential libtinyxml-dev libtbb-dev libxml2-dev libqt4-dev pkg-config  libprotoc-dev libfreeimage-dev libprotobuf-dev protobuf-compiler libboost-all-dev freeglut3-dev
7. Build Gazebo

        make
8. Install Gazebo

        make install
9. Setup environment variables

        echo "source <install_path>/share/gazebo-1.0.0/setup.bash" >> ~/.bashrc
        source ~/.bashrc

  If Gazebo was installed to /usr (which is the default) then:

        echo "source /usr/share/gazebo-1.0.0/setup.bash" >> ~/.bashrc
        source ~/.bashrc

