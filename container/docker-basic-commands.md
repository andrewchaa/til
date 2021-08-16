# Docker basic commands

command | description
-- | --
`docker build .` | build an image from a Dockerfile
`docker images` | list all docker images
`docker image rm f6e71ff7ed6b` | delete the docker image
`docker ps -a` | list all running containers
`docker rm CONTAINER` | Remove one or more containers
`docker run IMAGE [COMMAND]` | creates a writeable container layer over the specified image, and then starts it using the specified command
