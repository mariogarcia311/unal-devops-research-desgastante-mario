terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.1"
    }
  }

  required_version = ">= 0.12"
}

resource "null_resource" "fibonacci" {
    triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    command = "bash fibonacci.sh"
  }
}
