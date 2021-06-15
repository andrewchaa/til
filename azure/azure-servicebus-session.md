# Azure Service Bus Message sessions

Microsoft Azure Service Bus [sessions](https://docs.microsoft.com/en-us/azure/service-bus-messaging/message-sessions) enable joint and ordered handling of unbounded sequences of related messages. 
Sessions can be used in first in, first out (FIFO) and request-response patterns. 

### FIFO (first-in, first out) pattern

Use sessions to realise a FIFO guarantee. Any sender can create a session when submitting messages into a topic or queue by setting the session ID property to some application-defined identifier.

![image](https://user-images.githubusercontent.com/840427/122088978-346edc80-cdfe-11eb-8d3a-2b2be5c6e0ac.png)

A session receiver is created by a client accepting a session. When the session is accepted and held by a client, the client holds an exclusive lock on all messages with that session's session ID in the queue or subscription. It will also hold exclusive locks on all messages with the session ID that will arrive later.

The lock is released when you call the close related methods on the receiver or when the lock expires. There are methods on the receiver to renew the locks as well. Instead, you can use the automatic lock renewal feature where you can specify the time duration for which you want to keep getting the lock renewed. The session lock should be treated like an exclusive lock on a file, meaning that the application should close the session as soon as it no longer needs it and/or doesn't expect any further messages.
When multiple concurrent receivers pull from the queue, the messages belonging to a particular session are dispatched to the specific receiver that currently holds the lock for that session. With that operation, an interleaved message stream in one queue or subscription is cleanly de-multiplexed to different receivers and those receivers can also live on different client machines, since the lock management happens service-side, inside Service Bus.

[Azure Service Bus sessioin example](https://github.com/Azure/azure-sdk-for-net/blob/master/sdk/servicebus/Azure.Messaging.ServiceBus/samples/Sample05_SessionProcessor.md)
