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
    command = <<EOT
    fib() {
      if [ $1 -le 1 ]; then
        echo $1
      else
        prev1=$(fib $(( $1 - 1 )))
        prev2=$(fib $(( $1 - 2 )))
        echo $(( prev1 + prev2 ))
      fi
    }

    for ((i=0; i<=8; i++)); do
      fib $i
    done
    EOT
  }
}
