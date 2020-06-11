provider "google" {
#   credentials = "${file("${path.module}/../etc/credentials/credentials.json")}"
  project     = var.project
  region      = var.region
}

module "igree-network" {
  source          = "../modules/igree-network" 

  env             = var.env
  node_tags       = ["igree", "hml", "k8s", "db", "docker"]
  network_name    = var.network_name
}

module "igree-vm" {
  source          = "../modules/igree-vm" 

  machine_type    = "custom-2-5632-ext"
  env             = var.env
  num_nodes       = 1
  disk_size_gb    = 50
  node_tags       = ["igree", "hml", "db", "docker"]

  network_name    = var.network_name

  # Wait for resources and associations to be created
  depends_on_network = [module.igree-network]

}

module "igree-k8s" {
  source          = "../modules/igree-k8s" 

  machine_type    = "custom-2-5632-ext"
  disk_size_gb    = 100

  env             = var.env
  node_tags       = ["igree", "hml", "k8s", "docker"]

  k8s-node-count  = 1

  network_name    = var.network_name

  # Wait for resources and associations to be created
  depends_on_network = [module.igree-network]

}