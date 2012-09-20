Developer Guide {#modifying__developer}
==

This page details how developers should go about creating, and contributing code to Gazebo. 

### Reduce Code Duplication

Check to make sure someone else is not currently working on the same feature, before embarking on a project to add something to Gazebo. Simply send a quick email to the Gazebo mailing list expressing your interest and idea. Someone will get back to you shortly about your idea.
  
### Writing your Code 


### Write Tests 

All code should have a corresponding unit test. Gazebo uses [http://code.google.com/p/googletest/ | GTest] for unit testing. All regression test should be placed in `<gazebo_sources>/test/regresssion/`. 

Before creating a new regressions test file, check the current test files. If one closely matches the topic of your new code, simply add a new test function to the file. Otherwise, create a new test file, and write your test. 

### Code Check

Code pushed into the Gazebo repository should pass a few simple tests. It is also helpful if patches submitted through bitbucket pass these tests. Passing these tests is defined as generating no error or warning messages for each of the following tests.

#### Regression Tests 

In your Gazebo build directory run `make test`:
        make test

All the tests should pass. If they do not, you can run and debug the tests individually. For example, to run the transport test from your build directory:

        ./test/regression/transport

#### Static Code Check

Static code checking analyzes your code for bugs, such as potential memory leaks, and style. The Gazebo static code checker uses cppcheck, and a modified cpplint. You'll need to install cppcheck on your system. Ubuntu users can install via:

        sudo apt-get install cppcheck

To check your code, run the following script from the root of the Gazebo sources:

        sh tools/code_check.sh

It takes a few minutes to run. Fix all errors and warnings until the output looks like:

        Total errors found: 0

#### CMAKE_BUILD_TYPE=Check compiles with no warnings

This test compiles Gazebo with numerous warning flags enabled. The source code for Gazebo should compile cleanly. This does not include code in the {{{deps}}} directory. As a rule of thumb, start looking for compilation warnings after the proto messages are built which appear as a series of blue text:

        Linking CXX executable gazebomsgs_out
        Running C++ protocol buffer compiler on axis.proto
        Running C++ protocol buffer compiler on boxgeom.proto
        Running C++ protocol buffer compiler on camerasensor.proto
        Running C++ protocol buffer compiler on collision.proto
        Running C++ protocol buffer compiler on color.proto
        Running C++ protocol buffer compiler on contact.proto
        Running C++ protocol buffer compiler on contacts.proto
        ...
