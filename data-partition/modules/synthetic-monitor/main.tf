terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
      version = "3.80.2"
    }
  }
}

resource "newrelic_synthetics_monitor" "health_check" {
  status           = "DISABLED"
  name             = "jenkins health check"
  period           = "EVERY_5_MINUTES"
  uri              = "${var.jenkins_uri}"
  type             = "SIMPLE"
  locations_public = ["AP_SOUTH_1"]
}

output "health_check_id" {
  value = newrelic_synthetics_monitor.health_check.id
}