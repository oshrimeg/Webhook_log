variable "linode_token" {
  description = "API token for Linode"
  type        = string
}

variable "instance_label" {
  description = "Label for the Linode instance"
  type        = string
  default     = "simple_instance"
}

variable "image" {
  description = "Image to use for the Linode instance"
  type        = string
  default     = "linode/ubuntu24.04"
}

variable "region" {
  description = "Region for the Linode instance"
  type        = string
  default     = "it-mil"
}

variable "instance_type" {
  description = "Type of the Linode instance"
  type        = string
  default     = "g6-nanode-1"
}

variable "authorized_keys" {
  description = "SSH authorized keys for the Linode instance"
  type        = list(string)
  default     = ["ADD HERE YOUR SSH KEY default"]
}

variable "root_pass" {
  description = "Root password for the Linode instance"
  type        = string
  sensitive   = true
}
