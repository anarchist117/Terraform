resource "helm_release" "longhorn" {
  name             = "ingress-nginx"
  repository       = "https://charts.longhorn.io"
  chart            = "longhorn"
  namespace        = "longhorn-system"
  create_namespace = true
  version          = "1.8.1"
}
