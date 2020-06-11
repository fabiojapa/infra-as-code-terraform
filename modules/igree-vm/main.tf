module "startup-scripts" {
  source  = "terraform-google-modules/startup-scripts/google"
  version = "1.0.0"
}

resource "google_compute_address" "static" {
  count = var.num_nodes
  name  = "${var.external_ip_name}-${var.env}-${count.index + 1}"
}

resource "google_compute_instance" "default" {
  count                     = var.num_nodes
  name                      = "${var.machine_name}-${var.env}-${count.index + 1}"
  zone                      = var.zone
  tags                      = var.node_tags
  machine_type              = var.machine_type
  allow_stopping_for_update = true

  metadata = {
    startup-script        = "${module.startup-scripts.content}"
    startup-script-custom = data.template_file.init_instance.rendered
  }

  boot_disk {
    auto_delete = var.disk_auto_delete

    initialize_params {
      image = var.image_name
      size  = var.disk_size_gb
      type  = var.disk_type
    }
  }

  

  network_interface {
    subnetwork    = "${var.network_name}-${var.env}"
    access_config {
      nat_ip = google_compute_address.static[count.index].address
    }
  }

  depends_on = [var.depends_on_network]

}
