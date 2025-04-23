output "vpc_name" {
  value = google_compute_network.main_vpc.name
}

output "subnet_name" {
  value = google_compute_subnetwork.subnet.name
}

output "vpc_self_link" {
  value = google_compute_network.main_vpc.self_link
}
