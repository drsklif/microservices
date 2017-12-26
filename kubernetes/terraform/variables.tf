variable google_project {
  description = "Project ID"
}

variable google_region {
  description = "Region"
  default     = "europe-west1"
}

variable gke_name {
  description = "GKE cluster name"
  default     = "cluster-1"
}

variable gke_zone {
  description = "Zone"
  default     = "europe-west1-d"
}

variable gke_version {
  description = "Minimum GKE version"
  default     = "1.8.3-gke.0"
}

variable gke_node_count {
  description = "Size of the cluster"
  default     = 2
}

variable gke_legacy_abac {
  description = "legacy authentication support"
  default     = false
}

variable gke_node_machine_type_small {
  description = "GCE machine type"
  default     = "g1-small"
}

variable gke_node_machine_type_big {
  description = "GCE machine type"
  default     = "n1-standard-1"
}

variable gke_node_image_type {
  description = "nodes OS image"
  default     = "cos"
}

variable gke_node_disk_size {
  description = "disk size of each node"
  default     = 20
}

variable gke_dashboard_disabled {
  description = "kubernetes dashboard addon status"
  default     = false
}

variable gke_logging_service {
  description = "type of logging service"
  default     = "logging.googleapis.com"
}

variable gke_monitoring_service {
  description = "type of monitoring service"
  default     = "include monitoring.googleapis.com"
}
