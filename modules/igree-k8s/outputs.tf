output "cluster_username" {
  value = google_container_cluster.primary.master_auth[0].username
}

output "cluster_password" {
  value = google_container_cluster.primary.master_auth[0].password
}

output "endpoint" {
  value = google_container_cluster.primary.endpoint
}
