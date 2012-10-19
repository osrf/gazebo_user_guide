Style Guide {#modifying__style}
==

Gazebo uses C++ as its primary development language. [Google's style guide](http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml) has said it best with, "As every C++ programmer knows, the language has many powerful features, but this power brings with it complexity, which in turn can make code more bug-prone and harder to read and maintain.

The goal of this guide is to manage this complexity by describing in detail the dos and don'ts of writing C++ code. These rules exist to keep the code base manageable while still allowing coders to use C++ language features productively."

For the most part, Gazebo adhers to the [Google C++ style guide](http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml). The rest of this document covers instances where Gazebo differs.

## Naming 

- CamelCased: The first letter of each word is capitalized.
- camelCased: The first left of each word after the first is capitalized.
- under_score: All lower case with words separated by an underscore.
- ALL_CAPITALS: All capital letters with words separated by an underscore.

### Class Names

A class name is CamelCased.

### Member Functions

A member function is CamelCased.

A member function definition is preceded by its classification (public, protected, private).

~~~
public: void MyMemberFunction()
~~~

A member function implementation is preceded by a row of 50 forward slashes and a newline.

~~~
//////////////////////////////////////////////////
void MyClass::MyMemberFunction()
{
}
~~~

### Function parameters

Each parameter must be suffixed with an underscore, and must be camelCased.

~~~
public: void MyClass::MyMemberFunction(int _value)
~~~

Pointer and reference symbols must be placed next ot the parameter name.

~~~
Example: public: void MyMemberFunction(int *_value)
~~~

### Member Attributes

A member attribute must be camelCased.

Use of a member attribute is preceded by `this->`.
~~~{.cc}
void MyClass::MyMemberFunction()
{
  this->myMemberAttribute;
}
~~~

### Files

A header file has the `.hh` suffix.
A source file has the `.cc` suffix.

### \#ifndef Guards

All header files must be protected against multiple inclusion by #ifndef guards of the form: `_CLASSNAME_HH_`.

~~~{.cc}
#ifndef _MYCLASS_HH_
#define _MYCLASS_HH_
...
#endif
~~~

## Comments

Never use inline comments.

### Class Documentation

The class declaration should be proceeded by the follow doxygen comments:

\verbatim
/// \addtogroup gazebo_<groupname>
/// \{

/// \class <class_name> <class_name.hh> <sub_folder>/<class_name.hh>
/// \brief A brief description of the class
///
/// A detailed description of the class
\endverbatim

### Member Function

Each function within a class must have the following doxygen comments.

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
