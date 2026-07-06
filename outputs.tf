output "netapp_pools" {
  description = "All netapp_pool resources"
  value       = azurerm_netapp_pool.netapp_pools
}
output "netapp_pools_account_name" {
  description = "List of account_name values across all netapp_pools"
  value       = [for k, v in azurerm_netapp_pool.netapp_pools : v.account_name]
}
output "netapp_pools_cool_access_enabled" {
  description = "List of cool_access_enabled values across all netapp_pools"
  value       = [for k, v in azurerm_netapp_pool.netapp_pools : v.cool_access_enabled]
}
output "netapp_pools_custom_throughput_mibps" {
  description = "List of custom_throughput_mibps values across all netapp_pools"
  value       = [for k, v in azurerm_netapp_pool.netapp_pools : v.custom_throughput_mibps]
}
output "netapp_pools_encryption_type" {
  description = "List of encryption_type values across all netapp_pools"
  value       = [for k, v in azurerm_netapp_pool.netapp_pools : v.encryption_type]
}
output "netapp_pools_location" {
  description = "List of location values across all netapp_pools"
  value       = [for k, v in azurerm_netapp_pool.netapp_pools : v.location]
}
output "netapp_pools_name" {
  description = "List of name values across all netapp_pools"
  value       = [for k, v in azurerm_netapp_pool.netapp_pools : v.name]
}
output "netapp_pools_qos_type" {
  description = "List of qos_type values across all netapp_pools"
  value       = [for k, v in azurerm_netapp_pool.netapp_pools : v.qos_type]
}
output "netapp_pools_resource_group_name" {
  description = "List of resource_group_name values across all netapp_pools"
  value       = [for k, v in azurerm_netapp_pool.netapp_pools : v.resource_group_name]
}
output "netapp_pools_service_level" {
  description = "List of service_level values across all netapp_pools"
  value       = [for k, v in azurerm_netapp_pool.netapp_pools : v.service_level]
}
output "netapp_pools_size_in_tb" {
  description = "List of size_in_tb values across all netapp_pools"
  value       = [for k, v in azurerm_netapp_pool.netapp_pools : v.size_in_tb]
}
output "netapp_pools_tags" {
  description = "List of tags values across all netapp_pools"
  value       = [for k, v in azurerm_netapp_pool.netapp_pools : v.tags]
}

