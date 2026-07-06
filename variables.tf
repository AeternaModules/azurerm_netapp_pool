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
    cool_access_enabled     = optional(bool) # Default: false
    custom_throughput_mibps = optional(number)
    encryption_type         = optional(string) # Default: "Single"
    qos_type                = optional(string) # Default: "Auto"
    tags                    = optional(map(string))
  }))
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
  # --- Unconfirmed validation candidates, derived from azurerm_netapp_pool's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.PoolName] !regexp.MustCompile(`^[\da-zA-Z][-_\da-zA-Z]{2,63}$`).MatchString(value)
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: account_name
  #   source:    [from validate.AccountName] !regexp.MustCompile(`^[-_\da-zA-Z]{3,64}$`).MatchString(value)
  # path: service_level
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: qos_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: encryption_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

