resource "null_resource" "local" {
  provisioner "local-exec" {
    environment = {
      SHELL_SCRIPT_CONTENT = var.shell_script_content
    }

    command = <<-EOT
      echo "$SHELL_SCRIPT_CONTENT" > script.sh
      bash script.sh
    EOT
  }

  triggers = {
    always_run = var.executed_repeatedly == true ? "${timestamp()}" : null
  }
}
