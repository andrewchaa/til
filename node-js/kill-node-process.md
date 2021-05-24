# Kill node process

When I develop a react native app, I often get an error that the port is already in use.

```
error listen EADDRINUSE: address already in use :::8081.
```

You can find the process and kill it

```
ps aux | grep node
killall -9 node
```
