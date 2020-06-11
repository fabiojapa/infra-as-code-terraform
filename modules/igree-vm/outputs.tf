output "addresses" {
  description = "List of address values managed by this module (e.g. [\"1.2.3.4\"])"
  value = google_compute_instance.default.*.network_interface.0.access_config.0.nat_ip
}