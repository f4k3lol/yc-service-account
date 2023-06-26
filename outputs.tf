output "id" {
  value = yandex_iam_service_account.sa.id
}

output "name" {
  value = yandex_iam_service_account.sa.name
}

output "authorized-keys" {
  value = { for k,v in yandex_iam_service_account_key.sa-authorized-keys : k => nonsensitive(jsonencode(v)) }
}

output "static-keys" {
  value = { for k,v in yandex_iam_service_account_static_access_key.sa-static-keys : k => nonsensitive(jsonencode(v)) }
}

output "api-keys" {
  value = { for k,v in yandex_iam_service_account_api_key.sa-api-keys : k => nonsensitive(jsonencode(v)) }
}
