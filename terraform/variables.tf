variable "db_username" {
    description = "DB username"
    type = string
    sensitive = true
}

variable "db_password" {
    description = "DB pass"
    type = string
    sensitive = true
}

variable "sub_id" {
    description = "subscription ID"
    type = string
    sensitive = true
}
