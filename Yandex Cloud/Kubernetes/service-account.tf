resource "yandex_iam_service_account" "k8s_resource_sa" {
  folder_id = yandex_resourcemanager_folder.k8s.id
  name        = "k8s-resource-sa"
  description = "Service account for Kubernetes resources"
}

resource "yandex_iam_service_account" "k8s_node_sa" {
  folder_id = yandex_resourcemanager_folder.k8s.id
  name        = "k8s-node-sa"
  description = "Service account for Kubernetes nodes"
}

resource "yandex_resourcemanager_folder_iam_member" "k8s_resource_sa" {
  folder_id = yandex_resourcemanager_folder.k8s.id
  role   = "editor"
  member = "serviceAccount:${yandex_iam_service_account.k8s_resource_sa.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "k8s_node_sa" {
  folder_id = yandex_resourcemanager_folder.k8s.id
  role   = "container-registry.images.puller"
  member = "serviceAccount:${yandex_iam_service_account.k8s_node_sa.id}"
}
