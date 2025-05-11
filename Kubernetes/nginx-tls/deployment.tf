resource "kubernetes_deployment" "nginx-app" {
  depends_on = [kubernetes_config_map.nginx-configmap]
  metadata {
    name = "nginx-app"
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "nginx-pod"
      }
    }
    strategy {
      type = "RollingUpdate"
      rolling_update {
        max_surge       = 1
        max_unavailable = 1
      }
    }
    template {
      metadata {
        labels = {
          app = "nginx-pod"
        }
      }
      spec {
        container {
          name  = "nginx"
          image = "nginx"
          port {
            container_port = 80
          }
          readiness_probe {
            http_get {
              path = "/"
              port = 80
            }
            failure_threshold     = 3
            period_seconds        = 10
            success_threshold     = 1
            timeout_seconds       = 1
          }
          liveness_probe {
            http_get {
              path = "/"
              port = 80
            }
            initial_delay_seconds = 10
            failure_threshold     = 3
            period_seconds        = 10
            success_threshold     = 1
            timeout_seconds       = 1
          }
          resources {
            limits = {
              cpu    = "10m"
              memory = "100Mi"
            }
            requests = {
              cpu    = "10m"
              memory = "100Mi"
            }
          }
          volume_mount {
            name       = "nginx-volume"
            mount_path = "/etc/nginx/conf.d/"
          }
        }
        volume {
          name = "nginx-volume"
          config_map {
            name = "nginx-configmap"
          }
        }
      }
    }
  }
}
          
