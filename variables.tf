variable "name" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "description" {
  type = string
  default = ""
}

variable "roles" {
  default = []
  description = "List of roles to be assigned to service account"
}

variable "authorized_keys" {
  description = "Dict of SA authorized keys name -> descriptions. For each pair module will create key"
  default = {}
  # {
  #   "customer1": "key for x",
  #   "customer2": "key for y"
  # }
}

variable "static_keys" {
  description = "Dict of SA static keys name -> descriptions. For each pair module will create key"
  default = {}
  # {
  #   "customer1": "key for x",
  #   "customer2": "key for y"
  # }
}

variable "api_keys" {
  description = "Dict of SA api keys name -> descriptions. For each pair module will create key"
  default = {}
  # {
  #   "customer1": "key for x",
  #   "customer2": "key for y"
  # }
}