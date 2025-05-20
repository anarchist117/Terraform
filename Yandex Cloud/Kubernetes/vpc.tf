resource "yandex_vpc_network" "k8s" {
  folder_id = yandex_resourcemanager_folder.k8s.id
  name = "k8s"
}

resource "yandex_vpc_subnet" "k8s_public" {
  folder_id = yandex_resourcemanager_folder.k8s.id
  name = "k8s_public"
  v4_cidr_blocks = ["10.250.1.0/24"]
  network_id     = yandex_vpc_network.k8s.id
}

resource "yandex_vpc_subnet" "k8s_local" {
  folder_id = yandex_resourcemanager_folder.k8s.id
  name = "k8s_local"
  v4_cidr_blocks = ["10.250.2.0/24"]
  route_table_id = yandex_vpc_route_table.nat-instance-route.id
  network_id     = yandex_vpc_network.k8s.id
}

resource "yandex_vpc_route_table" "nat-instance-route" {
  folder_id = yandex_resourcemanager_folder.k8s.id    
  name       = "nat-instance-route"
  network_id = yandex_vpc_network.k8s.id
  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = yandex_compute_instance.nat-instance.network_interface.0.ip_address
  }
}
