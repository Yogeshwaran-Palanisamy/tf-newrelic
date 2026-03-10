# Configure terraform
terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
      version = "3.80.2"
    }
  }
}

provider "newrelic" {
  account_id = 7792329
  region     = "EU"
}