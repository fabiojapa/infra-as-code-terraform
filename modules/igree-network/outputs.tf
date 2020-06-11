output "net" {
  description = "net name"
  value = google_compute_network.default.name
}

output "subnet" {
  description = "net ip_cidr_range"
  value = google_compute_subnetwork.default.ip_cidr_range
}