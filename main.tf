provider "google" {
  project = "terraform-demo-project-457708"
  region  = "europe-west2"
}

provider "google-beta" {
  project = "terraform-demo-project-457708"
  region  = "europe-west2"
}

module "vpc" {
  source      = "./modules/vpc"
  vpc_name    = var.vpc_name
  subnet_name = var.subnet_name
  subnet_cidr = var.subnet_cidr
  region      = var.region
}

module "cloudsql" {
  source        = "./modules/cloudsql"
  instance_name = "demo-sql"
  region        = var.region
  tier          = "db-f1-micro"
  network       = module.vpc.vpc_self_link
  iam_user      = "rajoo.uddin@pax2pay.com"
}
