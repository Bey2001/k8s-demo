# Step 1

To get started with any type of work, we need to set up the environment to support both Docker and Kubernetes locally.

## What are we installing?

To complete the lab exercise, we need to install the following executables:

- docker
- kubectl
- kind

## Why are we installing?

Kind requires the Docker daemon to run the containers (or Podman with some configuration) that behave as nodes in the Kubernetes cluster.  Luckily, we don't have to worry about managing these nodes, although we need to ensure that the container image necessary is present on our machine.

Kind is a fully-fledged Kubernetes distribution, meaning that clusters spun up by it can interface with kubectl.  That means that to make our lives easier, and to better replicate interacting with Kubernetes cluster spun up by other distributions, we can use the kubectl binary to handle our Kubernetes operations and resource management.

## What is with the docker pull command?

For kind to work, we need to pull and use the container images that can replicate the function of a normal Kubernetes node.  This involves several key systems like the kube API server in the control plan, to the kubelet and kube-proxy systems on each worker node in the cluster --- all of these are included in the kindest/node container image.

We will be using several container images to accomplish different functions throughout this lab exercise.  Note that while this one container image is simply pulled, every container image that we use __within__ the kind cluster will also have to be loaded.  We will see how to do this loading operation in future stages of the project.

# Completion

To complete Step 1, simply run the setup script that corresponds to your operating system.
