variable "netapp_pools" {
  description = <<EOT
Map of netapp_pools, attributes below
Required:
    - account_name
    - location
    - name
    - resource_group_name
    - service_level
    - size_in_tb
Optional:
    - cool_access_enabled
    - custom_throughput_mibps
    - encryption_type
    - qos_type
    - tags
EOT

  type = map(object({
    account_name            = string
    location                = string
    name                    = string
    resource_group_name     = string
    service_level           = string
    size_in_tb              = number
    cool_access_enabled     = optional(bool)
    custom_throughput_mibps = optional(number)
    encryption_type         = optional(string)
    qos_type                = optional(string)
    tags                    = optional(map(string))
  }))
  validation {
    condition = alltrue([
      for k, v in var.netapp_pools : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_pools : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_pools : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_pools : (
        v.size_in_tb >= 1 && v.size_in_tb <= 2048
      )
    ])
    error_message = "must be between 1 and 2048"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_pools : (
        v.custom_throughput_mibps == null || (v.custom_throughput_mibps >= 128)
      )
    ])
    error_message = "must be at least 128"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_pools : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 10 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

