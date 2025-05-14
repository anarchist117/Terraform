resource "yandex_compute_image" "nat-instance-ubuntu" {
  folder_id = yandex_resourcemanager_folder.k8s.id    
  source_family = "nat-instance-ubuntu"
}

# Boot Disk
resource "yandex_compute_disk" "boot-disk-nat" {
  folder_id = yandex_resourcemanager_folder.k8s.id    
  name     = "boot-disk-nat"
  type     = "network-hdd"
  zone     = "ru-central1-a"
  size     = "20"
  image_id = yandex_compute_image.nat-instance-ubuntu.id
}

# VM NAT
resource "yandex_compute_instance" "nat-instance" {
    folder_id = yandex_resourcemanager_folder.k8s.id    
    name                      = "nat"
    platform_id               = "standard-v3"
    zone                      = "ru-central1-a"

    resources {
        core_fraction = 100
        cores         = 2
        gpus          = 0
        memory        = 2
    }

    boot_disk {
        disk_id     = yandex_compute_disk.boot-disk-nat.id    
    }

    network_interface {
        subnet_id          = yandex_vpc_subnet.nat_instance.id
        security_group_ids = []
        nat                = true
    }

    metadata                  = {
        "ssh-keys"  = "ssh-ed25519 12345abcdef username"
    }
}
