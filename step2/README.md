# Step 2

This step looks at what containerizing an application, and what steps may be taken to accomplish this goal.

## Overview of containerization

The transition from a normal application to a containerized one can either be very simple, or very difficult.  Difficulty depends on the language the application is written in, the level of complexity of the total application (how many tiers, how many replicas, APIs, etc.), and the target Kubernetes engine the application would be deployed to.

Containerization of an application means taking an application that can run on its own and enabling it to interface with the same systems and components as before, but now from within a containerized environment.

The end result of a containerization operation is typically an artifact called a container image, which can be infinitely deployed in different containers using a desired container runtime environment.  This container image is basically a snapshot of the application and the environment it is built to run in, including libraries and environment variables.  Images are typically named something logical, such as "java-backend", and is tagged with the version of the container image for easy retrieval and version control within the registry that holds container images.  Such registries include Amazon Elastic Container Registry, the Google Container Registry, and Docker Hub, among many others.  

## Why containerize an application?

Containers are a compact way of deploying applications atop a host operating system.  They should contain the libraries and environment variables necessary to run an application, along with the executable itself.

Typically, things like configuration files and secrets are mounted to the container in a dynamic fashion using an entity called a volume.  Volumes are basically file mounts for containers --- and Kubernetes is FANTASTIC when it comes to using them.

Due to the easily-customizable nature of volumes, containerized applications are wonderful for spinning up replicas of the same application with different configurations in a portable and secure way.

## Dockerfiles

To create a Docker container image, we will be using a file called a Dockerfile.  A Dockerfile is a list of instructions executed in order.  Note that the instruction must be CAPITALIZED, with the following options used in our Dockerfiles:

- `ADD <src> <dest>`
  - Copy over src from the workspace local directory to dest within the container; untars and decompresses any src that is a recognized compressed file; allows src to be a remote URL, but does not decompress files copied remotely
- `CMD \[<command>, [<arg1>, [<arg2>, ...]]\]`
  - Run command with the list of args supplied after it upon start of the container
- `COPY <src> <dest>`
  - Copy over src from the workspace local directory to dest within the container
- `FROM <previous_container>`
  - Import the specified container image as the starting point for this container image
- `RUN <command>`
  - Runs command as if in a shell; certain versions allow for bash-isms, but safer to assume that the shell being ran is standard sh
- `WORKDIR </path/to/dir>`
  - Change the working directory to '/path/to/dir' for any RUN, CMD, ENTRYPOINT, COPY, and ADD instructions that follow; will create /path/to/dir should it not already exist

Other instructions do exist, although we will not be using them in this lab exercise.

## The script

The other file within this directory is a shell script that builds the container images and tags them appropriately.  You may have noticed that the script must copy the Dockerfiles into their appropriate directories before the application components can be properly containerized; this is important, as the Dockerfile assumes the location of the Dockerfile on the local machine in its execution of the `docker build` command.  Likewise, all files used in the `docker build` command (as listed in the Dockerfile) need to be readily-accessible from the working directory where the command is called.

The `-t` flag used in `docker build -t <tag_name> <directory>` names the resulting container image artifact with the specified tag_name.  This means that the Docker daemon cataloged the resulting image, and is ready to push the container image to a registry or use it in a container.

## Completion

To complete Step 2, you need to populate the Dockerfiles in the two subdirectories within this directory with the appropiate instructions for each task.  Note that there are underscores serving as blanks for the instructions.  Some instructions do repeat, and some may not appear in either Dockerfile.

Note, you can use ADD and COPY interchangeably for most cases, but in the future, you may find issues!  Keep in the mind the differences listed above!

Upon filling in ALL the blanks, run the containerize.sh script in this directory.  Be sure to take a look at the script to see what's happening under the hood!
