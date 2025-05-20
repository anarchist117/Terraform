```
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo add jetstack https://charts.jetstack.io --force-update
helm repo add longhorn https://charts.longhorn.io
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/

helm search repo ingress-nginx/ingress-nginx --versions
helm search repo cert-manager --versions
helm search repo longhorn --versions
```

# Documentation
[ingress-nginx](https://github.com/kubernetes/ingress-nginx)

[cert-manager](https://github.com/cert-manager/cert-manager)

[longhorn](https://github.com/longhorn/longhorn)

[dashboard](https://github.com/kubernetes/dashboard)
