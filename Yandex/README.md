```
export YC_TOKEN=$(yc iam create-token)
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)
```
```
terraform import yandex_kubernetes_node_group.k8s_worker abcdefg12345
```
```
terraform state list
```
```
terraform state show ...
```
```
terraform destroy -target=yandex_iam_service_account.k8s_node_sa -target=yandex_iam_service_account.k8s_resource_sa -target=yandex_kms_symmetric_key.k8s -target=yandex_kubernetes_cluster.zonal_cluster -target=yandex_resourcemanager_folder_iam_member.k8s_node_sa -target=yandex_resourcemanager_folder_iam_member.k8s_resource_sa -target=yandex_vpc_network.k8s -target=yandex_vpc_subnet.k8s_nodes
```

# Documentation
[Getting started with Terraform](https://yandex.cloud/en-ru/docs/tutorials/infrastructure-management/terraform-quickstart)
