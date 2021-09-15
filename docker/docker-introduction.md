# Docker Introduction

![image](https://user-images.githubusercontent.com/840427/132942592-6e64f095-efac-42c9-b4c8-d728a090c811.png)


### Container image

A package with all the dependencies and information needed to create a container.

An image includes all the dependencies (such as frameworks) plus deployment and execution
configuration to be used by a container runtime. Usually, an image derives from multiple base images
that are layers stacked on top of each other to form the container’s filesystem. An image is immutable
once it has been created.

### Dockerfile

A text file that contains instructions for building a Docker image. 
You can build images with the following Docker command: `docker build`

### Container

An instance of a Docker image. A container represents the execution of a single
application, process, or service. 

### Volumes

Offer a writable filesystem that the container can use. 

### Tag

A mark or label you can apply to images so that different images or versions of the same image
(depending on the version number or the target environment) can be identified.

### Multi-stage Build

Is a feature, since Docker 17.05 or higher, that helps to reduce the size of the final
images. For example, a large base image, containing the SDK can be used for compiling and
publishing and then a small runtime-only base image can be used to host the application.

### Repository (repo)

A collection of related Docker images, labeled with a tag that indicates the image
version. 

### Multi-arch image

For multi-architecture, it’s a feature that simplifies the selection of the appropriate
image, according to the platform where Docker is running. For example, when a Dockerfile requests a
base image FROM mcr.microsoft.com/dotnet/sdk:5.0 from the registry, it actually gets 5.0-
nanoserver-20H2, 5.0-nanoserver-2004 or 5.0-buster-slim, depending on the operating system
and version where Docker is running.

### Docker Hub

A public registry to upload images and work with them. 

### Azure Container Registry

A public resource for working with Docker images and its components in Azure. 

### Docker Trusted Registry (DTR)

A Docker registry service (from Docker) that can be installed onpremises so it lives within the organization’s datacenter and network. 

### Docker Community Edition (CE)

Development tools for Windows and macOS for building, running, and testing containers locally. 

### Docker Enterprise Edition (EE)

An enterprise-scale version of Docker tools for Linux and Windows development.

### Compose

A command-line tool and YAML file format with metadata for defining and running multicontainer applications. 

### Cluster

A collection of Docker hosts exposed as if it were a single virtual Docker host, so that the
application can scale to multiple instances of the services spread across multiple hosts within the
cluster. Docker clusters can be created with Kubernetes, Azure Service Fabric, Docker Swarm and
Mesosphere DC/OS.


### Orchestrator

A tool that simplifies the management of clusters and Docker hosts. Orchestrators
enable you to manage their images, containers, and hosts through a command-line interface (CLI) or a
graphical UI. You can manage container networking, configurations, load balancing, service discovery,
high availability, Docker host configuration, and more. An orchestrator is responsible for running,
distributing, scaling, and healing workloads across a collection of nodes. Typically, orchestrator
products are the same products that provide cluster infrastructure, like Kubernetes and Azure Service
Fabric, among other offerings in the market.
