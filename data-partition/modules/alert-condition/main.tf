terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
      version = "3.80.2"
    }
    
  }
}
resource "newrelic_synthetics_alert_condition" "jenkins_health_check" {
  policy_id = var.policy_id

  name        = "jenkins health check"
  monitor_id  = var.monitor_id
  runbook_url = "https://www.example.com"
}