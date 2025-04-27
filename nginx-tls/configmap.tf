resource "kubernetes_config_map" "nginx-configmap" {
  metadata {
    name = "nginx-configmap"
  }
  data = {
    "default.conf" = <<-EOT
      server {
          listen       80 default_server;
          server_name  _;
          default_type text/plain;
          location / {
              return 200 '$hostname\n';
          }
      }
    EOT
  }
}
