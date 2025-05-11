resource "yandex_vpc_network" "k8s" {
  folder_id = yandex_resourcemanager_folder.k8s.id
  name = "k8s"
}

resource "yandex_vpc_subnet" "k8s_nodes" {
  folder_id = yandex_resourcemanager_folder.k8s.id
  name = "k8s_nodes"
  v4_cidr_blocks = ["10.252.0.0/16"]
  network_id     = yandex_vpc_network.k8s.id
}
