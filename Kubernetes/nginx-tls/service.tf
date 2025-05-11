resource "kubernetes_service" "nginx_service" {
  metadata {
    name = "nginx-service"
  }
  spec {
    selector = {
      app = "nginx-pod"
    }
    port {
      name     = "http"
      protocol = "TCP"
      port     = 80
    }
  }
}
