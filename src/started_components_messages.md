Messages {#started__components__messages}
======================

Gazebo uses a socket-based message passing system based on Google Protobuf
to handle inter-process communication.

## Built in Messages ##

Gazebo provides many message types, which are document at [http://gazebosim.org/msgs](http://gazebosim.org/msgs)

## Custom Messages ##

You can create your own message types by using the Protobuf syntax. An
example of this can be found in the Gazebo sources in the
`examples/plugins/custom_messages` directory.
