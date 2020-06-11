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

variable "external_ip_name" {
  default = "ipv4-address"
}

variable "machine_type" {
  description = "In the form of custom-CPUS-MEM, number of CPUs and memory for custom machine. https://cloud.google.com/compute/docs/instances/creating-instance-with-custom-machine-type#specifications"
  default     = "custom-2-5632-ext"
}

variable "machine_name" {
  description = "Name prefix for the nodes"
  default     = "igree"
}

variable "num_nodes" {
  description = "Number of nodes to create"
  default     = 1
}

variable "image_name" {
  default = "debian-9-stretch-v20200420"
}

variable "disk_auto_delete" {
  description = "Whether or not the disk should be auto-deleted."
  default     = true
}

variable "disk_type" {
  description = "The GCE disk type. Can be either pd-ssd, local-ssd, or pd-standard."
  default     = "pd-ssd"
}

variable "disk_size_gb" {
  description = "The size of the image in gigabytes."
  default     = 300
}

variable "node_tags" {
  description = "Additional compute instance network tags for the nodes."
  type        = list(string)
  default     = ["igree", "db", "docker"]
}

variable "startup_script" {
  description = "Content of startup-script metadata passed to the instance template."
  default     = ":"
}

data "template_file" "init_instance" {
  template = "${file("${path.module}/scripts/init_instance.sh")}"
}