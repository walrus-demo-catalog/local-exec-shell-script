variable "shell_script_content" {
  type        = string
  description = "Shell script to run in Terraform local execution environment."
  default     = <<-EOT
                #!/bin/bash

                # Set variables
                WALRUS_URL="https://localhost"
                WALRUS_TOKEN="du7cbzafkvnw-EHUPB7u82ChS4DBpid81LizQChB5cTrv5ihKUuwaDdw7uIoiaTaWbdzAkmYFAi6iFo6B3ZY9PqSbHq53ok81x8l2VgHOhnpd9iFfd1XxgDFRsZ0xz9fTmg"

                # Define data based on user_type
                if [ "$3" == "manager" ]; then
                    data='{
                        "kind": "user",
                        "domain": "builtin",
                        "name": "'"$1"'",
                        "password": "'"$2"'",
                        "roleId": "system/manager",
                        "roles": [
                            {
                                "role": {
                                    "id": "system/manager"
                                }
                            }
                        ]
                    }'
                else
                    data='{
                        "kind": "user",
                        "domain": "builtin",
                        "name": "'"$1"'",
                        "password": "'"$2"'",
                        "roleId": "0",
                        "roles": []
                    }'
                fi

                # Send POST request
                curl -s --insecure -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $WALRUS_TOKEN" -d "$data" "$WALRUS_URL/v1/subjects"
                EOT
}

variable "executed_repeatedly" {
  type        = bool
  description = "Allow command to be executed repeatedly."
  default     = true
}
