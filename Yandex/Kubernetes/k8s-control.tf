resource "yandex_kubernetes_cluster" "zonal_cluster" {
  depends_on = [
    yandex_resourcemanager_folder_iam_member.k8s_resource_sa,
    yandex_resourcemanager_folder_iam_member.k8s_node_sa
  ]

  # Name
    name                     = "k8s"
  
  # Description
    description              = null

  # Service account for resources
   service_account_id      = yandex_iam_service_account.k8s_resource_sa.id

  # Service account for nodes
   node_service_account_id = yandex_iam_service_account.k8s_node_sa.id

  # Encryption key 
    kms_provider {
       key_id = yandex_kms_symmetric_key.k8s.id
    }

  # Release channel 
    release_channel          = "STABLE"

  # Labels
    labels                   = {}

# Master configuration
    master {
      # Kubernetes version
        version = "1.30"

      # Public address
        public_ip = true

      # Type of master 
        zonal {
          # Availability zone
          zone      = "ru-central1-a"
        
          # Subnet
          subnet_id = yandex_vpc_subnet.k8s_public.id
        }

      # Security groups
        security_group_ids = []

      # Maintenance window settings
        maintenance_policy {
          # Maintenance frequency / Disable
            auto_upgrade = true
        }

      # Logging
        master_logging {
            audit_enabled              = false
            cluster_autoscaler_enabled = false
            enabled                    = false
            events_enabled             = false
            folder_id                  = null
            kube_apiserver_enabled     = false
            log_group_id               = null
            }

    }

  # Cloud network
   network_id = yandex_vpc_network.k8s.id

# Cluster network settings
  # Enable network policy
    network_policy_provider  = "CALICO"

  # CIDR cluster 
    cluster_ipv4_range       = "10.254.0.0/16"
    cluster_ipv6_range       = null

  # CIDR services
    service_ipv4_range       = "10.253.0.0/16"
    service_ipv6_range       = null

  # Node subnet mask
    node_ipv4_cidr_mask_size = 24

  # Organization Folder
    folder_id                = yandex_resourcemanager_folder.k8s.id
}
