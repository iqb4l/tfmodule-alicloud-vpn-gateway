output "vpn_gateway_id" {
  description = "The ID of VPN gateway instance."
  value       = local.vpn_gateway_id
}

output "vpn_customer_gateway_id" {
  description = "The ID of customer gateway instance."
  value       = alicloud_vpn_customer_gateway.vpncgw[*].id
}

output "vpn_connection_id" {
  description = "The ID of VPN connection."
  value       = alicloud_vpn_connection.connection[*].id
}

output "internet_ip" {
  description = "The public IP address of the primary VPN gateway."
  value       = alicloud_vpn_gateway.vpngw[*].internet_ip
}

output "disaster_recovery_internet_ip" {
  description = "The public IP address of the disaster recovery VPN gateway."
  value       = alicloud_vpn_gateway.vpngw[*].disaster_recovery_internet_ip
}