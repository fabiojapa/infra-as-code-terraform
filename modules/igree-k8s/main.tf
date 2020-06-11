resource "google_container_cluster" "primary" {
  name               = "${var.k8s-cluster-name}-${var.env}"
  location           = var.zone
  

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  network      = "${var.network_name}-${var.env}"
  subnetwork   = "${var.network_name}-${var.env}"

  master_auth {
    username = "wasys"
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  depends_on = [var.depends_on_network]
  
}

resource "google_container_node_pool" "primary_nodes" {
  name                = "${var.k8s-cluster-name}-node-pool-${var.env}"
  location            = var.zone
  cluster             = google_container_cluster.primary.name
  node_count          = var.k8s-node-count

  node_config {
    tags         = var.node_tags
    preemptible  = false
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
    disk_type    = var.disk_type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
