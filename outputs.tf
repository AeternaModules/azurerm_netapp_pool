output "netapp_pools_id" {
  description = "Map of id values across all netapp_pools, keyed the same as var.netapp_pools"
  value       = { for k, v in azurerm_netapp_pool.netapp_pools : k => v.id }
}
output "netapp_pools_account_name" {
  description = "Map of account_name values across all netapp_pools, keyed the same as var.netapp_pools"
  value       = { for k, v in azurerm_netapp_pool.netapp_pools : k => v.account_name }
}
output "netapp_pools_cool_access_enabled" {
  description = "Map of cool_access_enabled values across all netapp_pools, keyed the same as var.netapp_pools"
  value       = { for k, v in azurerm_netapp_pool.netapp_pools : k => v.cool_access_enabled }
}
output "netapp_pools_custom_throughput_mibps" {
  description = "Map of custom_throughput_mibps values across all netapp_pools, keyed the same as var.netapp_pools"
  value       = { for k, v in azurerm_netapp_pool.netapp_pools : k => v.custom_throughput_mibps }
}
output "netapp_pools_encryption_type" {
  description = "Map of encryption_type values across all netapp_pools, keyed the same as var.netapp_pools"
  value       = { for k, v in azurerm_netapp_pool.netapp_pools : k => v.encryption_type }
}
output "netapp_pools_location" {
  description = "Map of location values across all netapp_pools, keyed the same as var.netapp_pools"
  value       = { for k, v in azurerm_netapp_pool.netapp_pools : k => v.location }
}
output "netapp_pools_name" {
  description = "Map of name values across all netapp_pools, keyed the same as var.netapp_pools"
  value       = { for k, v in azurerm_netapp_pool.netapp_pools : k => v.name }
}
output "netapp_pools_qos_type" {
  description = "Map of qos_type values across all netapp_pools, keyed the same as var.netapp_pools"
  value       = { for k, v in azurerm_netapp_pool.netapp_pools : k => v.qos_type }
}
output "netapp_pools_resource_group_name" {
  description = "Map of resource_group_name values across all netapp_pools, keyed the same as var.netapp_pools"
  value       = { for k, v in azurerm_netapp_pool.netapp_pools : k => v.resource_group_name }
}
output "netapp_pools_service_level" {
  description = "Map of service_level values across all netapp_pools, keyed the same as var.netapp_pools"
  value       = { for k, v in azurerm_netapp_pool.netapp_pools : k => v.service_level }
}
output "netapp_pools_size_in_tb" {
  description = "Map of size_in_tb values across all netapp_pools, keyed the same as var.netapp_pools"
  value       = { for k, v in azurerm_netapp_pool.netapp_pools : k => v.size_in_tb }
}
output "netapp_pools_tags" {
  description = "Map of tags values across all netapp_pools, keyed the same as var.netapp_pools"
  value       = { for k, v in azurerm_netapp_pool.netapp_pools : k => v.tags }
}

