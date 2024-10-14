terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.25.0"
    }
  }
}

provider "linode" {
  token = var.linode_token
}

resource "linode_instance" "linodePC" {
  label           = var.instance_label
  image           = var.image
  region          = var.region
  type            = var.instance_type
  authorized_keys = var.authorized_keys
  root_pass       = var.root_pass
}
