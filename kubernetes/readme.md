Introduction to Kubernetes

Kubernetes, often referred to as K8s, is an open-source platform designed to automate the deployment, scaling, and management of containerized applications. Initially developed by Google, Kubernetes is now maintained by the Cloud Native Computing Foundation (CNCF). It has become the industry standard for container orchestration.

Why Do We Need an Orchestration Tool?

With the rise of containerized applications, managing containers in production environments has become increasingly complex.

Challenges include:

1.Scalability: Managing hundreds or thousands of containers.


2.Load Balancing: Ensuring even distribution of traffic across containers.

3.High Availability: Preventing downtime by managing container failures automatically.

4.Resource Optimization: Efficiently utilizing system resources like CPU and memory.

5.Service Discovery: Making it easy for containers to communicate with each other.

6.Automation: Reducing manual intervention for repetitive tasks like deployment and scaling.

Container orchestration tools like Kubernetes address these challenges by automating the deployment, scaling, and operation of containers, making them essential in modern DevOps workflows.


Why Kubernetes?

Kubernetes has emerged as the preferred orchestration tool for several reasons:

1.Open Source: Vendor-neutral and community-driven.

2.Scalability: Designed to handle large-scale workloads.

3.Portability: Works across on-premises, cloud, and hybrid environments.

4.Extensibility: Highly customizable through APIs and plugins.

5.Resilience: Automatic healing of failed containers and rescheduling.

6.Comprehensive Ecosystem: Supported by a wide range of tools and platforms.

Architecture of Kubernetes

Kubernetes employs a master-worker architecture:

1. Master Node
Responsible for managing the Kubernetes cluster. Components include:

API Server: Facilitates communication between users and the cluster.
Controller Manager: Maintains the desired state of the cluster (e.g., ensuring the correct number of pods).
Scheduler: Assigns workloads to worker nodes based on resource availability.
etcd: A distributed key-value store for cluster state data.


2. Worker Node
Responsible for running application workloads. Components include:

Kubelet: Communicates with the API server and manages containers.
Kube-proxy: Handles networking and routing of requests to containers.
Container Runtime: Runs the containers (e.g., Docker, containerd).


3. Pods
The smallest deployable unit in Kubernetes.
Encapsulates one or more containers, along with shared storage and network.


4. Additional Components
ConfigMaps and Secrets: For managing configuration and sensitive data.
Ingress: For HTTP and HTTPS routing.
Namespaces: For isolating resources within a cluster.

Lifecycle of the Pods
-------------------------------------------------------------------------------------------------
1.Pending: The pod is accepted but waiting for resource allocation.

2.Running: The pod has been assigned to a node, and containers are running.

3.Succeeded: All containers have terminated successfully.

4.Failed: Containers in the pod have terminated with errors.

5.Unknown: The pod state cannot be determined.


Introduction to Pods and Services
----------------------------------------------------------------------------
Pods
A Pod is the smallest deployable unit in Kubernetes, encapsulating one or more containers with shared resources like storage and network.

Lifecycle:

Pending → Running → Succeeded/Failed → Terminated
Use Cases:

Running a single application container.
Running multiple containers that share resources and are tightly coupled (e.g., sidecar patterns).
Services
Services provide stable networking and expose Pods to other applications or external traffic.

Types of Services:

ClusterIP: Exposes the service within the cluster.

NodePort: Exposes the service on each node’s IP at a static port.

LoadBalancer: Exposes the service to the internet using a cloud provider’s load balancer.


Main Container and Sidecar Containers
--------------------------------------------------------------------------------------
Main Container
The primary container that serves the main purpose of the application. Examples include application servers or web servers.

Sidecar Container
An auxiliary container that provides supporting functionalities, such as logging, monitoring, or proxying.

Examples:

A logging container (e.g., Fluentd) that collects logs from the main container.
A proxy container (e.g., Envoy) that manages network traffic.
Benefits:

1.Decouples concerns and improves maintainability.

2.Allows independent scaling and updates.


Implementation (Sample Pod with a Sidecar):

```bash
apiVersion: v1
kind: Pod
metadata:
  name: example-pod
spec:
  containers:
  - name: main-app
    image: nginx
  - name: sidecar-logging
    image: fluentd
```    

Run First Pod Using kubectl

1.Create a Pod:

```bash
kubectl run nginx-pod --image=nginx --restart=Never
```
--image: Specifies the container image.

--restart=Never: Ensures the creation of a standalone Pod.

2.Verify Pod:
```bash
kubectl get pods
```
3. View Pod Details:
```bash
kubectl describe pod nginx-pod
```

Expose Pod Using kubectl expose

Expose Pod:
```bash
kubectl expose pod nginx-pod --type=NodePort --port=80
```

--type=NodePort: Exposes the Pod on a static port.

--port: Specifies the port the Pod listens on.

Get Service Details:
```bash
kubectl get svc
```

Access the Pod:
```bash
Use the <NodeIP>:<NodePort> to access the exposed Pod.
```

n-Depth: kubectl Usage


Common Commands

View Resources:
```bash
kubectl get pods
kubectl get svc
kubectl get nodes
```

Apply Changes:
```bash
kubectl apply -f <manifest-file>.yaml
```

Delete Resources:
```bash
kubectl delete pod <pod-name>
```
Debugging:
```bash
kubectl logs <pod-name>
kubectl exec -it <pod-name> -- /bin/bash
```

Kubernetes Service Types for Networking
------------------------------------------------------------------------------------------
1. ClusterIP
Default service type.
Exposes the service only within the cluster.

Example:

```bash
apiVersion: v1
kind: Service
metadata:
  name: clusterip-service
spec:
  selector:
    app: my-svc
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
```

2.NodePort

Exposes the service on a static port on each node.

Example:
```bash
apiVersion: v1
kind: Service
metadata:
  name: nodeport-service
spec:
  type: NodePort
  selector:
    app: my-svc
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
    nodePort: 30007
```
3.LoadBalancer

Exposes the service externally using a cloud provider’s load balancer.

Example:    
```bash
apiVersion: v1
kind: Service
metadata:
  name: loadbalancer-service
spec:
  type: LoadBalancer
  selector:
    app: my-svc
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
```

Key Networking Components
----------------------------------------------------------------------------------------------

1. Pod IP
   
Each pod gets a unique IP address within the cluster.

Enables direct communication between pods without port conflicts.


2. Container Port

The port exposed by the container inside the pod.

Used for intra-pod communication.

3. Node IP
   
IP address of the Kubernetes node.

Used when accessing services exposed via NodePort or LoadBalancer.

4. Node Port

A static port on the node that forwards traffic to the service.

Example: Node IP + Node Port allows access to services from outside the cluster.

5. LoadBalancer
Integrates with cloud provider load balancers to expose services externally.

Automatically assigns external IPs for access.

Namespace
-----------------------------------------------------------------------------------------
Namespaces provide a way to divide cluster resources between multiple users or teams.

Default Namespaces

default: The default namespace for resources without a namespace.

kube-system: For Kubernetes system resources.

kube-public: For publicly accessible resources.

Creating a Namespace

```bash
kubectl create ns dev
kubectl apply -f pod.yml -n dev
kubectl get pods -n dev
```

create ns by declarative:-
vim ns.yml

```bash
apiVersion: v1
kind: Namespace
metadata:
  name: space-x
```

ReplicationController and ReplicaSet
----------------------------------------------------------------------------------------------
ReplicationControllers and ReplicaSets ensure that the specified number of Pod replicas are running at all times.

ReplicationController

```bash
apiVersion: v1
kind: ReplicationController
metadata:
  name: my-rc
spec:
  replicas: 3
  selector:
    app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
        - name: my-container
          image: nginx:latest
          ports:
            - containerPort: 80
``` 
<!-- apiVersion: v1
kind: ReplicationController
metadata:
  name: my-rc
  labels:
    app: myapp
spec:
  replicas: 3
  selector:
    app: myapp

  template:    #pod template
    metadata:
      labels:
        app: myapp

    spec:
      containers:
        - name: my-rc-cont
          image: nginx:latest
          ports:
           - containerPort: 80 -->
---

Explanation:


replicas: Specifies the desired number of Pods.

selector: Matches labels to identify Pods.

template: Describes the Pods to be created.


```bash
 kubectl scale rc --replicas 2 my-rc
 kubectl edit rc my-rc
```

ReplicaSet: equality based selector

```bash
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: my-rs
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app-rs
  template:
    metadata:
      labels:
        app: my-app-rs
    spec:
      containers:
        - name: my-container
          image: nginx:latest
```

repicaset: with set-based selector

```bash
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: my-rs
spec:
  replicas: 3
  selector:
     matchExpressions:
      #  - key: app
      #    operator: In
      #    values:
      #     -  my-app-rs
        - {key: app, operator: In, values: [my-app-rs]}  
  template:
    metadata:
      labels:
        app: my-app-rs
    spec:
      containers:
        - name: my-container
          image: nginx:latest
```

Deployments vs StatefulSets, Writing Manifests, and Understanding DaemonSets
----------------------------------------------------------------------------------------------
Introduction

In Kubernetes, different controllers manage specific workloads depending on the requirements of applications. Among the most commonly used are Deployments, StatefulSets, and DaemonSets. Each serves unique purposes in orchestrating containerized applications.

Deployments vs StatefulSets

Deployments

A Deployment ensures a specified number of pod replicas are running at any given time. Deployments are best suited for stateless applications.

Features of Deployments

1.Stateless nature, meaning all pods are interchangeable.

2.Easy scaling and updates with zero downtime.

3.Fast rollback capability.

4.Pods are recreated with new identities upon termination.


Use Cases

Web servers.
APIs.
Microservices with no data dependency.


StatefulSets

A StatefulSet is used for applications requiring unique identities and persistent storage for each pod. These are suited for stateful applications.

Features of StatefulSets

1.Maintains a stable identity for each pod.

2.Supports persistent storage using PVCs (PersistentVolumeClaims).

3.Ensures ordered deployment, scaling, and deletion of pods.

4.Pod names are deterministic (e.g., pod-0, pod-1).


Use Cases

Databases (e.g., MySQL, MongoDB).

Distributed systems (e.g., Kafka, ZooKeeper).

Applications requiring strict ordering.


Stateless vs Stateful Applications
--------------------------------------------------------------------------------------------------
1.Stateless Applications.

2.Do not retain data between sessions.

3.Pods are interchangeable and can be terminated or replaced without affecting the application.

4.Example: A web server serving static pages.

5.Stateful Applications

6.Require data persistence and unique identities.

7.Replacement pods need to access the same persistent storage and retain their identities.

Example: A database like PostgreSQL where data must be retained even if the pod restarts.
 

  - remove all resources in this namespace

```bash
kubectl delete all  --all -n ingress-nginx
kubectl delete ingress ingress-nginx
```
