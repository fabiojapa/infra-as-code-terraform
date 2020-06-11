resource "google_compute_network" "default" {
  name                    = "${var.network_name}-${var.env}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "default" {
  name                     = "${var.network_name}-${var.env}"
  ip_cidr_range            = var.network_cidr
  network                  = google_compute_network.default.self_link
  region                   = var.region
  private_ip_google_access = true
}

resource "google_compute_firewall" "default" {
  name    = "${var.firewall_name}-${var.env}"
  network = google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["5432"]
  }

  allow {
    protocol = "tcp"
    ports    = ["9090"]
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = var.node_tags
}


resource "google_compute_firewall" "default-internal" {
  name    = "${var.firewall_name}-${var.env}-internal"
  network = google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "icmp"
  }

  priority = 65534

  source_ranges = ["${var.network_cidr}"]

}
