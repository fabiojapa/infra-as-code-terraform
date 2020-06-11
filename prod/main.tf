provider "google" {
  project     = var.project
  region      = var.region
}

module "igree-network" {
  source          = "../modules/igree-network" 

  env             = var.env
  node_tags       = ["igree", "prod", "k8s", "db", "docker"]
  network_name    = var.network_name
}

module "igree-vm" {
  source          = "../modules/igree-vm" 

  machine_type    = "custom-2-5632-ext"
  env             = var.env
  num_nodes       = 2
  disk_size_gb    = 300
  node_tags       = ["igree", "prod", "db", "docker"]

  network_name    = var.network_name

  # Wait for resources and associations to be created
  depends_on_network = [module.igree-network]

}

module "igree-k8s" {
  source          = "../modules/igree-k8s" 

  machine_type    = "custom-2-5632-ext"
  disk_size_gb    = 150

  env             = var.env
  node_tags       = ["igree", "prod", "k8s", "docker"]

  k8s-node-count  = 1

  network_name    = var.network_name

  # Wait for resources and associations to be created
  depends_on_network = [module.igree-network]

}