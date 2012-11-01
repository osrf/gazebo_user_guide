Developer Guide {#modifying__developer}
==

This page details how developers should go about creating, and contributing code to Gazebo. 

## Reduce Code Duplication

Before embarking on a project to add a new feature to Gazebo, make sure no
one else is doing the same thing. Send a quick email to the Gazebo mailing
list (gazebo-list@kforge.ros.org) expressing your interest and idea, and someone will get back to you shortly.
  
## Writing your Code 

When writing your code, make sure you abide by our [Style Guide](modifying__style.html).

### Compile Time Tests

Gazebo uses a strict set of warning flags during compile. All code must 
produce no warnings nor errors during compile.

### Static Tests

Static code checking analyzes your code for bugs, such as potential memory leaks, and style. The Gazebo static code checker uses cppcheck and a modified cpplint. You'll need to install cppcheck on your system. Ubuntu users can install via:

        sudo apt-get install cppcheck

To check your code, run the following script from the root of the Gazebo sources:

        sh tools/code_check.sh

It takes a few minutes to run. Fix all errors and warnings until the output looks like:

        Total errors found: 0

### Dynamics Tests 

All code should have a corresponding unit or regression test. Gazebo uses
[GTest](http://code.google.com/p/googletest) for testing. A unit test checks
basic functionality of code, and regression tests check behavior. For
example, a unit test may test the math library for correctness, and
a regression test could check that a robot travels the correct distance
given a fixed velocity and time. Unit tests should be placed in the
`<gazebo_sources>/test/unit/` directory and regression tests in
`<gazebo_sources>/test/regression/`. 

#### Running Tests
In your Gazebo build directory run: 
        
	make test

All the tests should pass. If they do not, you can run and debug the tests individually. For example, to run the transport test from your build directory:

        ./test/regression/transport

