
#alicloud_vpn_gateway
variable "create_vpn_gateway" {
  description = "Whether to create vpn gateway."
  type        = string
  default     = true
}

variable "existing_vpn_gateway_id" {
  description = "The existing vpn gateway id."
  type        = string
  default     = null
}

variable "vpn_name" {
  description = "Name of the VPN gateway."
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "The VPN belongs the vpc_id, the field can't be changed."
  type        = string
  default     = ""
}

variable "vswitch_id" {
  description = "The ID of the VSwitch to which the VPN gateway is attached."
  type        = string
  default     = null
}

variable "disaster_recovery_vswitch_id" {
  description = "The ID of the backup VSwitch to which the VPN gateway is attached."
  type        = string
  default     = null
}

variable "vpn_bandwidth" {
  description = "The value should be 10, 100, 200, 500, 1000 if the user is postpaid, otherwise it can be 5, 10, 20, 50, 100, 200, 500, 1000."
  type        = number
  #default     = 10
}

variable "vpn_enable_ipsec" {
  description = "Enable or Disable IPSec VPN. At least one type of VPN should be enabled."
  type        = bool
  #default     = true
}

variable "vpn_charge_type" {
  description = "The charge type for instance. Valid value: PostPaid, PrePaid. Default to PostPaid."
  type        = string
  default     = "PostPaid"
}

#alicloud_vpn_customer_gateway
variable "create_vpn_customer_gateway" {
  description = "Whether to create vpn customer gateway."
  type        = string
  default     = true
}

variable "cgw_id" {
  description = "The customer gateway id used to connect with vpn gateway."
  type        = string
  default     = null
}

variable "cgw_name" {
  description = "The name of the VPN customer gateway. Defaults to null."
  type        = string
  default     = ""
}

variable "cgw_ip_address" {
  description = "The IP address of the customer gateway."
  type        = string
  default     = ""
}

#alicloud_ssl_vpn_client_cert
variable "ssl_client_cert_names" {
  description = "The names of the client certificates."
  type        = list(string)
  default     = []
}

#alicloud_vpn_connection
variable "ipsec_connection_name" {
  description = "The name of the IPsec connection."
  type        = string
  default     = ""
}

variable "ipsec_local_subnet" {
  description = "The CIDR block of the VPC to be connected with the local data center. This parameter is used for phase-two negotiation."
  type        = list(string)
  default     = []
}

variable "ipsec_remote_subnet" {
  description = "The CIDR block of the local data center. This parameter is used for phase-two negotiation."
  type        = list(string)
  default     = []
}

variable "ipsec_effect_immediately" {
  description = "Whether to delete a successfully negotiated IPsec tunnel and initiate a negotiation again. Valid value:true,false."
  type        = bool
  default     = false
}

variable "enable_tunnels_bgp" {
  description = "Whether to enable BGP for the tunnels."
  type        = bool
  default     = null
}

variable "tunnel_options_specification" {
  type = list(object({
    role                 = optional(string, null)
    status               = optional(string, null)
    customer_gateway_id  = optional(string, null)
    enable_nat_traversal = optional(bool, null)
    enable_dpd           = optional(bool, null)
    tunnel_ike_config = optional(list(object({
      ike_auth_alg = optional(string, null)
      local_id     = optional(string, null)
      ike_enc_alg  = optional(string, null)
      ike_version  = optional(string, null)
      ike_mode     = optional(string, null)
      ike_lifetime = optional(string, null)
      psk          = optional(string, null)
      remote_id    = optional(string, null)
      ike_pfs      = optional(string, null)
    })), [])
    tunnel_bgp_config = optional(list(object({
      local_asn    = optional(string, null)
      tunnel_cidr  = optional(string, null)
      local_bgp_ip = optional(string, null)
    })), [])
    tunnel_ipsec_config = optional(list(object({
      ipsec_pfs      = optional(string, null)
      ipsec_enc_alg  = optional(string, null)
      ipsec_auth_alg = optional(string, null)
      ipsec_lifetime = optional(number, null)
    })), [])
  }))
  description = "The tunnel options specification config."
  default     = []
}