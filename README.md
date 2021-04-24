# Mounting a local volume into k8s using hostPath

This repo is a based on a run through of [Configure a Pod to Use a PersistentVolume for Storage](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/).

This makes it easier to tinker with the files...

I've run it using the k8s that is installed by Docker Desktop for Mac. In this
scenario the host is a VM running on the Mac, but some host folders are
made available via
[File Sharing](https://docs.docker.com/docker-for-mac/#file-sharing).
So rather than following the instructions to create `/mnt/data`
there is a `mnt/data` folder within this repo and the [definition](./pv-volume.yaml) requires an absolute path. _This will need to be
updated to run the example_.

Once you have modified the path simply deploy using:

```
kubectl apply -f ./pv-volume.yaml
```
