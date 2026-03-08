# Configure terraform
terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

provider "newrelic" {
  account_id = 7792329
  api_key    = var.NEWRELIC_API_KEY
  region     = "EU"
}