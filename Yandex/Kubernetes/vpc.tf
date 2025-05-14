resource "yandex_vpc_network" "k8s" {
  folder_id = yandex_resourcemanager_folder.k8s.id
  name = "k8s"
}

resource "yandex_vpc_subnet" "k8s_nodes" {
  folder_id = yandex_resourcemanager_folder.k8s.id
  name = "k8s_nodes"
  v4_cidr_blocks = ["10.252.0.0/16"]
  route_table_id = yandex_vpc_route_table.nat-instance-route.id		# Routemap
  network_id     = yandex_vpc_network.k8s.id
}

resource "yandex_vpc_subnet" "nat_instance" {
  folder_id = yandex_resourcemanager_folder.k8s.id
  name = "nat_instance"
  v4_cidr_blocks = ["10.251.0.0/16"]
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
