# Commands below assume that nfs server and application is deployed in default namespace

# Inject Istio Sidecars
kubectl -n istio-system get controlplanerevision
kubectl label namespace default  istio-injection- istio.io/rev=asm-managed --overwrite

# Enforce mtls in the default namespace
kubectl apply -n default -f manifests/peerauth.yaml

# Deploy NFS and application
kubectl apply -f manifests/statefulSet-nfs.yaml
kubectl apply -f manifests/service-nfs-server.yaml
kubectl apply -f manifests/debiandepl.yaml

