provider "kubernetes" {
  version = "~> 1.0.1"
}

provider "google" {
  version = "~> 1.3.0"
  project = "${var.google_project}"
  region  = "${var.google_region}"
}
