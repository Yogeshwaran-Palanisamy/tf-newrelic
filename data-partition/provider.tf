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
  api_key = "NRAK-VKPX3D51XLLV7ZT0AQ0U5OXCQ5I"
  region     = "EU"
}