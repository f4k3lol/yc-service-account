resource "yandex_iam_service_account" "sa" {
  name        = var.name
  description = var.description
}

locals {
  roles           = toset(try(jsondecode(var.roles), var.roles))
  authorized_keys = try(jsondecode(var.authorized_keys), var.authorized_keys)
  static_keys     = try(jsondecode(var.static_keys), var.static_keys)
  api_keys        = try(jsondecode(var.api_keys), var.api_keys)
}

resource "yandex_resourcemanager_folder_iam_member" "sa-role" {
  for_each    = local.roles
  role        = each.key
  folder_id   = var.folder_id
  member      = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

resource "yandex_iam_service_account_key" "sa-authorized-keys" {
  for_each           = local.authorized_keys
  service_account_id = yandex_iam_service_account.sa.id
  description        = each.value
}

resource "yandex_iam_service_account_static_access_key" "sa-static-keys" {
  for_each           = local.static_keys
  service_account_id = yandex_iam_service_account.sa.id
  description        = each.value
}

resource "yandex_iam_service_account_api_key" "sa-api-keys" {
  for_each           = local.api_keys
  service_account_id = yandex_iam_service_account.sa.id
  description        = each.value
}
