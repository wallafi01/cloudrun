
resource "google_project_service" "cloud_run_api" {
  service = "run.googleapis.com"
}

resource "google_cloud_run_v2_service" "cloud_run_teraform" {
  name     = var.cloudrun_name
  location = var.region
  ingress  = var.cloudrun_ingress
  project  = var.project_id

  template {
    containers {
      image = var.cloudrun_image
      resources {
        limits = {
          cpu    = "2"
          memory = "1024Mi"
        }
      }
    }
  }
  depends_on = [
    google_project_service.cloud_run_api
  ]
}


data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_v2_service.cloud_run_teraform.location
  project     = google_cloud_run_v2_service.cloud_run_teraform.project
  service     = google_cloud_run_v2_service.cloud_run_teraform.name
  policy_data = data.google_iam_policy.noauth.policy_data
}

output "url" {
  value = google_cloud_run_v2_service.cloud_run_teraform.uri
}

################################################################################s

# Endereço Global
resource "google_compute_global_address" "global_address" {
  name = "global-address"
}

# Certificado SSL Gerenciado
resource "google_compute_managed_ssl_certificate" "ssl_certificate" {
  name = "managed-ssl-cert"

  managed {
    domains = [
      "ideaads.com.br",
      "www.ideaads.com.br"
    ]
  }
}

