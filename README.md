# Mounting a local volume into k8s using hostPath

This repo is a based on a run through of [Configure a Pod to Use a PersistentVolume for Storage](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/).

It uses a local yaml files, rather than pulling from the Kubernetes website. This makes it easier to tinker with the files...

I've run it using the k8s that is installed by Docker Desktop for Mac. In this
scenario the host is a VM running on the Mac, but some host folders are
made available via
[File Sharing](https://docs.docker.com/docker-for-mac/#file-sharing).
So rather than following the instructions to create `/mnt/data`
there is a `data` folder within this repo and the [definition](./pv-volume.yaml) requires an absolute path. _This will need to be
updated to run the example_.

Once you have modified the path simply deploy using:

```
kubectl apply -f ./pv-volume.yaml
```

Once everything has started you should then be able to access nginx with the following command:

```
curl http://localhost:30080
```

The response should be `Hello from k8s storage` - this is the contents of `./data/index.html`.
If you run the following commands the response should change, demonstrating your container is
serving local files.

```
echo "And another thing..." >> ./data/index.html
curl http://localhost:30080
```

## Cleanup

Run the following commands to clean up the items deployed by this script:

```
kubectl delete svc task-pv-service
kubectl delete pod task-pv-pod
kubectl delete pvc task-pv-claim
kubectl delete pv task-pv-volume
```

Alternatively you can run the `cleanup.sh` script.
