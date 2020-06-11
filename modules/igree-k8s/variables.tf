variable "env" {
  default = "env"
}

variable "region" {
  default = "us-east1"
}

variable "zone" {
  default = "us-east1-b"
}

variable "network_name" {
  default = "igree-network"
}

variable "depends_on_network" {
  type    = any
  default = null
}

variable "machine_type" {
  description = "In the form of custom-CPUS-MEM, number of CPUs and memory for custom machine. https://cloud.google.com/compute/docs/instances/creating-instance-with-custom-machine-type#specifications"
  default     = "custom-2-5632-ext"
}

variable "node_tags" {
  description = "Additional compute instance network tags for the nodes."
  type        = list(string)
  default     = ["igree", "k8s", "docker"]
}

variable "disk_type" {
  description = "The GCE disk type. Can be either pd-ssd, local-ssd, or pd-standard."
  default     = "pd-ssd"
}

variable "disk_size_gb" {
  description = "The size of the image in gigabytes."
  default     = 150
}

variable "k8s-cluster-name" {
  description = "k8s-cluster-name"
  default     = "igree-k8s"
}

variable "k8s-node-count" {
  description = "k8s-node-count"
  default     = 1
}
