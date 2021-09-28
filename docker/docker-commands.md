# Docker basic commands

command | description
-- | --
`docker build .` | build an image from a Dockerfile
`docker exec -it 21 /bin/bash` | connect to the running docker instance and it's bash
`docker exec 21 ls -al` | execute `ls -al` command in the docker instance
`docker exec b7 cat /var/jenkins_home/secrets/initialAdminPassword` | execute cat command
`docker image ls` | list docker images
`docker images` | list all docker images
`docker image prune` | remove all dangling images
`docker image rm f6e71ff7ed6b` | delete the docker image
`docker image rm acrfonoadev.azurecr.io/emulator/20210823` | untag the image from the given tag name
`docker inspect f7` | show the docker instance's details in json file
`docker kill my_container` | send a kill signal to the container
`docker network create --driver=bridge --subnet=182.0.1.1/16 isolatedNetwork` | create a bridge network
`docker network prune` | delete all networks
`docker pull ubuntu` | download the latest ubuntu image
`docker ps -a` | list all running containers
`docker run ubuntu` | run the ubuntu image
`docker run -itd ubuntu` | run the ubnutu image interactively but detached
`docker run -d -p 80:8080 jenkins/jenkins` | run jeninks image in a detached mode with port mapping of 80 to 8080
`docker rm CONTAINER` | Remove one or more containers
`docker rm -f $(docker ps -a -q)` | remove all docker containers
`docker stop $(docker ps -aq)` | remove all docker containers
`docker run IMAGE [COMMAND]` | creates a writeable container layer over the specified image, and then starts it using the specified command
`docker stop $(docker ps -aq) | stop all running containers. -aq gives you the id of the containers
