# Docker basic commands

command | description
-- | --
`docker build .` | build an image from a Dockerfile
`docker images` | list all docker images
`docker image prune` | remove all dangling images
`docker image rm f6e71ff7ed6b` | delete the docker image
`docker image rm acrfonoadev.azurecr.io/emulator/20210823` | untag the image from the given tag name
`docker kill my_container` | send a kill signal to the container
`docker pull ubuntu` | download the latest ubuntu image
`docker ps -a` | list all running containers
`docker rm CONTAINER` | Remove one or more containers
`docker run IMAGE [COMMAND]` | creates a writeable container layer over the specified image, and then starts it using the specified command
