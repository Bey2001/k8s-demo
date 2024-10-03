# Step 3

This step investigates deploying a standard database into a Kubernetes cluster, leveraging Kubernetes resources to configure a premade container image.

## How do We Configure a Premade Container Image?

The wonderful thing about Kubernetes is the ability to easily plug in environment variables and configuration files to containers in real-time.

For the most part, Kubernetes allows different resources to be defined in YAML files to accomplish various goals.  One such goal is effectively uploading data to a prepopulated container image to provide configuration information.

Several Kubernetes-native resources are available to dynamically configure Pods and Deployments in clusters, though we focus on two particular resources: ConfigMaps and Secrets.  The major difference between the two is the sensitivity of information provided.

Under the hood, ConfigMaps and Secrets are both key-value stores.  A ConfigMap stores configuration data such as environment variables or configuration files in plaintext.  On the other hand, a Secret stores sensitive information, such as passwords, API keys, or TLS certificates, with typical in-transit encoding being simple base64, with encryption at rest in the cluster.

## How will We Use ConfigMaps and Secrets?

To demonstrate the power and configurability inherent to ConfigMaps and Secrets to provide dynamic information to containers, we will leverage both in configuring a MySQL instance.

The configuration file used by the backend Spring Boot application requires some environment variables to be supplied to the container at runtime, particularly database hostname and user credentials.

