resource "yandex_kms_symmetric_key" "k8s" {
  folder_id = yandex_resourcemanager_folder.k8s.id
  name              = "k8s"
  description       = ""
  default_algorithm = "AES_256"
}
