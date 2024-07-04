variable "ami" {
  type        = string
  description = "this will store ami for my instance"
}

variable "instance_count" {
  type        = number
  description = "this is the number of instances you need"
}
variable "instance_type" {
  type        = string
  description = "instance type"

}

variable "my_env" {
  type        = string
  description = "this will store the env for my infra"
}
