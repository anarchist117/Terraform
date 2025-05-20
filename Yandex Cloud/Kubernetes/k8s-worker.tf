resource "yandex_kubernetes_node_group" "k8s_worker" {
    cluster_id             = yandex_kubernetes_cluster.k8s_control.id
    
    # Name
    name                   = "k8s"

    # Description
    description            = null

    # Kubernetes version
    version                = "1.30"

    # Labels
    labels                 = {}

    # Changes during creation and updates
    deploy_policy {
        max_expansion   = 3     # Max group size expansion 
        max_unavailable = 0     # Max group size reduction 
    }



    instance_template {
        platform_id               = "standard-v3"
        metadata                  = {
            # Access
            "ssh-keys" = "loginuser:ssh-ed25519 abcdef12345 username"
        }

        # Computing resources
        resources {
            core_fraction = 100
            cores         = 2
            gpus          = 0
            memory        = 4
        }

        # Storage
        boot_disk {
            size = 64                 # Size
            type = "network-hdd"      # Disk type 
        }

        # Network settings
        network_interface {
            ipv4               = true
            ipv6               = false
            nat                = false      # Public address
            security_group_ids = []         # Security groups
            subnet_ids         = [ yandex_vpc_subnet.k8s_local.id ]
        }

        # Container runtime
        container_runtime {
            type = "containerd"
        }
    }

    # Scaling
    scale_policy {
        # Type
        fixed_scale {
            size = 2      # Number of nodes
        }
    }

    # Location
    allocation_policy {
        location {
            zone      = "ru-central1-a"
        }
    }

    # Maintenance window settings
    maintenance_policy {
        auto_repair  = true
        auto_upgrade = true
    }

    # Additional
    node_labels            = {}
    node_taints            = [] 
}
