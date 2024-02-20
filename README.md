## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [null_resource.local](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_executed_repeatedly"></a> [executed\_repeatedly](#input\_executed\_repeatedly) | Allow command to be executed repeatedly. | `bool` | `true` | no |
| <a name="input_shell_script_content"></a> [shell\_script\_content](#input\_shell\_script\_content) | Shell script to run in Terraform local execution environment. | `string` | `"#!/bin/bash\n\n# Set variables\nWALRUS_URL=\"https://localhost\"\nWALRUS_TOKEN=\"du7cbzafkvnw-EHUPB7u82ChS4DBpid81LizQChB5cTrv5ihKUuwaDdw7uIoiaTaWbdzAkmYFAi6iFo6B3ZY9PqSbHq53ok81x8l2VgHOhnpd9iFfd1XxgDFRsZ0xz9fTmg\"\n\n# Define data based on user_type\nif [ \"$3\" == \"manager\" ]; then\n    data='{\n        \"kind\": \"user\",\n        \"domain\": \"builtin\",\n        \"name\": \"'\"$1\"'\",\n        \"password\": \"'\"$2\"'\",\n        \"roleId\": \"system/manager\",\n        \"roles\": [\n            {\n                \"role\": {\n                    \"id\": \"system/manager\"\n                }\n            }\n        ]\n    }'\nelse\n    data='{\n        \"kind\": \"user\",\n        \"domain\": \"builtin\",\n        \"name\": \"'\"$1\"'\",\n        \"password\": \"'\"$2\"'\",\n        \"roleId\": \"0\",\n        \"roles\": []\n    }'\nfi\n\n# Send POST request\ncurl -s --insecure -X POST -H \"Content-Type: application/json\" -H \"Authorization: Bearer $WALRUS_TOKEN\" -d \"$data\" \"$WALRUS_URL/v1/subjects\"\n"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_shell_script_content"></a> [shell\_script\_content](#output\_shell\_script\_content) | n/a |
