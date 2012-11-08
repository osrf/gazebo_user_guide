Style Guide {#modifying__style}
==

Gazebo uses C++ as its primary development language. [Google's style guide](http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml) says it best:

> As every C++ programmer knows, the language has many powerful features, but this power brings with it complexity, which in turn can make code more bug-prone and harder to read and maintain.
> 
> The goal of this guide is to manage this complexity by describing in detail the dos and don'ts of writing C++ code. These rules exist to keep the code base manageable while still allowing coders to use C++ language features productively.

For the most part, Gazebo adheres to the [Google C++ style guide](http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml). The rest of this document covers instances where Gazebo differs.

## Checking your code

Gazebo includes a shell script that can be used to check your code style.

In the root of the Gazebo source directory, run:

    sh tools/code_check.sh

The output should produce no errors.  This script is also run by the [continuous integration system](http://build.osrfoundation.org) that builds and tests Gazebo.

## Naming 

We first define the kinds of naming schemes that are used:

- CamelCased: The first letter of each word is capitalized.
- camelCased: The first left of each word after the first is capitalized.
- under_score: All lower case with words separated by an underscore.
- ALL_CAPITALS: All capital letters with words separated by an underscore.

### Class Names

A class name is CamelCased.

### Member Functions

A member function is CamelCased.

Every member function definition is preceded by an explicit classification (public, protected, or private). E.g.:

~~~
public: void MyPublicMemberFunction();
public: void MyOtherPublicMemberFunction();
private: void MyPrivateMemberFunction();
private: void MyOtherPrivateMemberFunction();
~~~

A member function implementation is preceded by a row of 50 forward slashes and a newline.

~~~
//////////////////////////////////////////////////
void MyClass::MyMemberFunction()
{
}
~~~

### Function parameters

Each parameter is prefixed with an underscore and is camelCased.

~~~
public: void MyClass::MyMemberFunction(int _value)
~~~

Pointer and reference symbols are placed next to the parameter name.

~~~
Example: public: void MyMemberFunction(int *_value);
Example: public: void MyOtherMemberFunction(const std::string &_str);
~~~

### Member Attributes

Member attribute are camelCased.

Use of a member attribute is explicitly preceded by `this->`.
~~~{.cc}
void MyClass::MyMemberFunction()
{
  this->myMemberAttribute = 0;
}
~~~

### Files

Header files have the `.hh` suffix.
Source files have the `.cc` suffix.

### \#ifndef Guards

All header files are protected against multiple inclusion by #ifndef guards of the form: `_CLASSNAME_HH_`.

~~~{.cc}
#ifndef _MYCLASS_HH_
#define _MYCLASS_HH_
...
#endif
~~~

## Comments

Never use inline comments.

### Class Documentation

Class declarations are preceeded by [Doxygen](http://www.doxygen.org) 
comments of the following form:

\verbatim
/// \addtogroup gazebo_<groupname>
/// \{

/// \class <class_name> <class_name.hh> <sub_folder>/<groupname.hh>
/// \brief A brief description of the class
///
/// A detailed description of the class
\endverbatim

Example:

\verbatim
/// \addtogroup gazebo_physics
/// \{

/// \class World World.hh physics/physics.hh
/// \brief My world class brief description. 
///
/// My world class detailed description. 
\endverbatim

### Member Function

Functions within a class are preceeded by [Doxygen](http://www.doxygen.org) 
comments of the following form:

\verbatim
/// \brief A brief description of the function
///
/// An optional detailed description. Add if the brief description is insufficient.
/// \param[in/out] _param1 Description of _param1
/// \param[in/out]_param2 Description of _param1
/// \return Description of return value if any
\endverbatim

The `[in/out]` declaration for a parameters indicates if the parameter is used for input, output, or both:

- `\param[in]`: The parameter is used for input only.
- `\param[out]`: The parameter is used for output only.
- `\param[in,out]`: The parameter is used for both input and output.
