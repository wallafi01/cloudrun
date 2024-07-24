variable "project_id" {
  default = "idea-stresstest"
}

variable "region" {
  default = "us-east1"
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

