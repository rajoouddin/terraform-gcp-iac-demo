resource "google_sql_database_instance" "default" {
  name             = var.instance_name
  database_version = "POSTGRES_16"
  region           = var.region

  settings {
    tier    = var.tier
    edition = "ENTERPRISE"
    ip_configuration {
      ipv4_enabled    = false
      private_network = var.network
    }
    database_flags {
      name  = "cloudsql.iam_authentication"
      value = "on"
    }
    activation_policy = "ALWAYS"
  }

  deletion_protection = false
}

resource "google_sql_user" "iam_user" {
  name     = var.iam_user
  instance = google_sql_database_instance.default.name
  type     = "CLOUD_IAM_USER"
}
