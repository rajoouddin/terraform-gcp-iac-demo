resource "google_compute_network" "main_vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  description             = "VPC created by Terraform"
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.main_vpc.id
}
