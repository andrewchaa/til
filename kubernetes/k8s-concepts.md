# Kubernetes concepts

### Pod

![image](https://user-images.githubusercontent.com/840427/135745584-f0814083-5289-4074-8fd8-71a5b93b1c0f.png)


* Group of 1 or more containers
* Shared storage
* Shared network: Same IP addresses and port-range

### ReplicaSet

* To maintain a stable set of replica Pods running at any given time
* Provides declarative management for Pods and ReplicaSets

### Rolling Updates

Zero Downtime Deployments

* New replica set is created
* New Pods are created
* Traffic is re-routed
* Old pods are deleted
* Old Replica set is deleted

### Resource Management

* Requests: minimum required resources
* Limits: capped resource usage
