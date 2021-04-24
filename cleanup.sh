#!/bin/bash
kubectl delete svc task-pv-service
kubectl delete pod task-pv-pod
kubectl delete pvc task-pv-claim
kubectl delete pv task-pv-volume
