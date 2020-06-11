variable "env" {
  default = "env"
}

variable "region" {
  default = "us-east1"
}

variable "network_cidr" {
  default = "10.127.0.0/20"
}

variable "network_name" {
  default = "igree-network"
}

variable "firewall_name" {
  default = "igree-firewall"
}

variable "node_tags" {
  description = "Additional compute instance network tags for the nodes."
  type        = list(string)
  default     = ["igree", "db", "k8s", "docker"]
}