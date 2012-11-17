TCP Communication {#started__interfaces__comms}
===============

Gazebo implements a simple publish/subscribe communication system that
provides access to and control over much of the simulation state.  This
communication system uses `boost::asio` for transport and `protobuf` for
serialization.   The Gazebo GUI uses this communication system to talk to
the Gazebo server, which is where the actual simulation is executed.

Data is organized into `topics`, which are labels that allows producers and
consumers of different kinds of data to find each other.  The `gztopic`
tool is useful for inspecting a running Gazebo system.  E.g., to 
get the list of currently published topics:

        gztopic list 

## Write your own Client ##

You can easily write your own program to interact with Gazebo. This example will create a stand-alone application that listens to a Gazebo topic.

~~~
/////////////////////////////////////////////////
// Function is called every time a message is received.
void cb(ConstWorldStatisticsPtr &_msg)
{
  // Dump the message contents to stdout.
  std::cout << _msg->DebugString();
}

/////////////////////////////////////////////////
int main()
{
  // Initialize transport
  gazebo::transport::init();

  // Create our node for communication
  gazebo::transport::NodePtr node(new gazebo::transport::Node());
  node->Init();

  // Listen to Gazebo world_stats topic
  gazebo::transport::SubscriberPtr sub = node->Subscribe("~/world_stats", cb);

  // Start transport
  gazebo::transport::run();

  // Busy wait loop...replace with your own code as needed.
  while (true)
    gazebo::common::Time::MSleep(10);

  // Make sure to shut everything down.
  gazebo::transport::fini();
}
~~~

Let's break the code down, starting with the `cb` function.

~~~
void cb(ConstWorldStatisticsPtr &_msg)
{
  // Dump the message contents to stdout.
  std::cout << _msg->DebugString();
}
~~~

This function is called every time a message is received on a topic. The subscription mechanism is established in the following code blocks.

~~~
  // Initialize transport
  gazebo::transport::init();
~~~

This line setups up Gazebo's transport system. It must be run before trying to create any Nodes.

~~~
  // Create our node for communication
  gazebo::transport::NodePtr node(new gazebo::transport::Node());
  node->Init();

  // Listen to Gazebo world_stats topic
  gazebo::transport::SubscriberPtr sub = node->Subscribe("~/world_stats", cb);
~~~

This block creates a Node, which in turns allows us to create Subscribers (which receive messages from a topic) and Publishers (which write messages to a topic). In this case we create a Subscriber that listens to messages on the `world_stats` topic. When creating a Subscriber we must specify a callback to receive the messages. Our callback is names `cb`, and receives messages of type `ConstWorldStatisticsPtr`.

Now we can start processing messages.

~~~
  // Start transport
  gazebo::transport::run();

  // Busy wait loop...replace with your own code as needed.
  while (true)
    gazebo::common::Time::MSleep(10);
~~~

The above block of code runs Gazebo's transport system, and then enters a busy wait loop. The wait loop can be replaced by your application code.

Finally, make sure to properly cleanup the transport system:

~~~
  // Make sure to shut everything down.
  gazebo::transport::fini();
~~~

This example is a simplified version of the `gzstats` command-line tool.
