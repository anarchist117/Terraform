variable "domain_name" {}

resource "kubernetes_ingress_v1" "nginx-ingress" {
  metadata {
    name = "nginx-ingress"
    annotations = {
      "cert-manager.io/cluster-issuer" = "letsencrypt"
    }
  }
  spec {
    tls {
      hosts       = [var.domain_name]
      secret_name = "nginx-tls"
    }
    rule {
      host = var.domain_name
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "nginx-service"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
