# k8s-demo

Welcome to a brief demo on Kubernetes!

We will be using the "Kubernetes: A Detailed Example of Deployment of a Stateful Application" by Srikanth Koraveni, as published in the blog __Better Programming__.  Rather than using a traditional Kubernetes deployment for training purposes, we leverage a system-level interface called "Kubernetes in Docker", otherwise known as kind.  

Kind was originally created as a way to test Kubernetes deployments and configurations locally, without having to spin up new infrastructure.  As such, it is only really usable for development purposes, and should not be leveraged for large-scale testing and definitely not for production.

## The Steps

This lab will be broken down into steps.  At each stage, there will be a brief primer of what that step does and why we are doing it.  In short, the steps are as follows:

1. Setting up your Local Machine
   1. Explanation of Binaries
2. Containerizing the Application
   1. How do you containerize an application?
   2. Introduction to Docker files
      1. Fill in the blank
      2. Word bank in README
         1. Definitions of each Docker directive also in README
3. Containerizing the Database
   1. Breakdown of the YAML file
   2. ConfigMaps, Secrets
   3. Persistent Volume Claim, Service, Deployment
4. Deploying the Application
   1. Configuring the Service and Deployment for the back end
   2. Highlight the different types of Services
5. Introducing Istio
   1. Walkthrough of what Istio is and what it does
   2. Introduce Istio CRDs and a brief primer on what they are
   3. Setting up Istio in the mesh
6. Securing with Istio
   1. Use Istio CRDs to get rid of the NodePort Service need
      1. Edit the original Service YAML files to now use ClusterIP for the ClusterIP field instead of NodePort