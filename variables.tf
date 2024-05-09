variable "project_id" {
  default = "burner-cloud-run"
}

variable "region" {
  default = "us-central1"
}

variable "cloudrun_name" {
  default = "cloudrun-service"
}
variable "cloudrun_ingress" {
  default = "INGRESS_TRAFFIC_ALL"
}

variable "cloudrun_image" {
  default = "us-docker.pkg.dev/cloudrun/container/hello"
}