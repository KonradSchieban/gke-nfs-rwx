# In-cluster NFS Server for GKE

This repository contains a sample implementation of an NFS server on GKE.
The NFS server has been set up with mtls encryption using Anthos Service Mesh (ASM) to encrypt NFS traffic
in transit. NFS volumes need to be mounted after the application pods have started rather than using
persistentVolumes from the NFS storage (which will not work with mtls enforced).

## Prerequisites
A GKE cluster with ASM enabled on the cluster

## Setup
Commands that can be run sequentially (rather than at once) can be found in `scripts/deploy.sh`

1. [Inject Istio Sidecars](https://cloud.google.com/service-mesh/docs/anthos-service-mesh-proxy-injection) in the application namespace
`kubectl -n istio-system get controlplanerevision`
`kubectl label namespace default  istio-injection- istio.io/rev=asm-managed --overwrite`

2. Enforce mtls in the default namespace
`kubectl apply -n default -f manifests/peerauth.yaml`

3. Deploy NFS and application pods
`kubectl apply -f manifests/statefulSet-nfs.yaml`
`kubectl apply -f manifests/service-nfs-server.yaml`
`kubectl apply -f manifests/debiandepl.yaml`