terraform {
  backend "gcs" {
    bucket = "terraform-demo-457708-tfstate"
    prefix = "terraform/state"
  }
}
