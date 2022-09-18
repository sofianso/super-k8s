# K8s Cheatsheet

## Create Deployment

The following command will create a deployment based on the image pushed from Dockerhub.

`k create deployment <name_of_project> --image=sofianso/<name_of_project>`

## Exposing The Port

By default, once you download an image such as `nginx`, the port is not accessible to the outside. To expose the port to allow you to access it you have to run the following command.

`k expose deployment <name_of_deployments> --port=8080 --target-port=80`

Services are basically clusters running in K8s, it shows you a list of the IP address that the cluster is running on, IF you are running multiple replicas of the same pod, the cluster will decide where you will be redirected. (It works similar like a load balancer)

- Run `k get services` to list of clusters created. Or `k get svc` for short.

### NodePort Service Type

Run `k expose deployment <name_of_deployments> --type=NodePort --port=4000` to specify the IP address of the service to `NodePort`. Run `minikube ip` to get the IP address and then use the port number generated from minikube to access the webpage. Or, run `minikube service <name_of_project>` which will take you to the server automatically.

### Load Balancer Service Type

Similar to above, to change the type of the service run `k expose deployment <name_of_deployments> --type=LoadBalancer --port=4000` to specify the IP address of the service to `LoadBalancer`.

## Scaling Up/Down

To scale up the pods, you want to get the list of running pods by running `k get pods`. Then, retrieve the deployment cluster by running `k get deploy`.

To scale up the cluster, run the following command:

`k scale deployment <name_of_project> --replicas=4`
The number of replicas is up to you.

## Retrieving the Details

Get the details of all of the pods, run `k get pods -o wide`.

To retrieve the details of cluster, run `k describe deploy <name_of_project>`

### Delete a Service

`k delete svc <name_of_project>`

## Minikube Dashboard

`minikube dashboard`

## Delete All Clusters & Pods

`k delete all -all`

## Apply Deployment & Service in YAML

`k apply -f deployment.yaml -f service.yaml`

## Delete Deployment & Service in YAML

`k delete -f deployment.yaml -f service.yaml`

## Delete Minikube

To delete Minikube, it first must be stopped using `minikube stop` and then `minikube delete`

## Start Minikube

For Mac,`minikube start --driver=virtualbox --container-runtime=cri-o`

For Windows, `minikube start --driver=hyperv --container-runtime=cri-o`

Since the containers are not run using Docker, but rather `cri-o`, to list the containers of `cri-o`, run `sudo crictl ps`
