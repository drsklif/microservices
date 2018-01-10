resource "google_container_cluster" "primary" {
  name               = "${var.gke_name}"
  zone               = "${var.gke_zone}"
  min_master_version = "${var.gke_version}"
  initial_node_count = "${var.gke_node_count}"
  enable_legacy_abac = "${var.gke_legacy_abac}"
  logging_service    = "${var.gke_logging_service}"
  monitoring_service = "${var.gke_monitoring_service}"

  node_config {
    machine_type = "${var.gke_node_machine_type_small}"
    image_type   = "${var.gke_node_image_type}"
    disk_size_gb = "${var.gke_node_disk_size}"

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
  addons_config {
    http_load_balancing {
        disabled = false
    }
    horizontal_pod_autoscaling {
        disabled = true
    }
    kubernetes_dashboard {
        disabled = "${var.gke_dashboard_disabled}"
    }
  }

  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials ${var.gke_name} --zone ${var.gke_zone} --project ${var.google_project}"
  }
}

resource "google_compute_firewall" "gke-allow" {
  name    = "allow-reddit-app"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["30000-32767"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_container_node_pool" "big" {
  name               = "big-pool"
  zone               = "${google_container_cluster.primary.zone}"
  cluster            = "${google_container_cluster.primary.name}"
  node_count         = "${var.gke_node_count_big}"

  node_config {
    machine_type = "${var.gke_node_machine_type_big}"
    image_type   = "${var.gke_node_image_type}"
    disk_size_gb = "${var.gke_node_disk_size}"

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
