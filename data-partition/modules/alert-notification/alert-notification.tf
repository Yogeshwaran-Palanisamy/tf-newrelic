terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

# Notification channel
resource "newrelic_notification_destination" "yogesh_destination" {
  name = "Yogesh Mail Destination"
  type = "EMAIL"

  property {
    key   = "email"
    value = "yogeshwaranpsp@gmail.com"
  }
}

resource "newrelic_notification_channel" "yogesh_notification_channel" {
  name           = "Yogesh Notification Channel"
  type           = "EMAIL"
  destination_id = newrelic_notification_destination.yogesh_destination.id
  product        = "IINT"

  property {
    key   = "subject"
    value = "Jenkins health check alert"
  }
}

resource "newrelic_workflow" "yogesh_workflow" {
  name                  = "Yogesh Workflow"
  muting_rules_handling = "NOTIFY_ALL_ISSUES"

  issues_filter {
    name = "Issue Filter"
    type = "FILTER"
    predicate {
      attribute = "labels.policyIds"
      operator  = "EXACTLY_MATCHES"
      values    = [var.policy_id]
    }
  }

  destination {
    channel_id = newrelic_notification_channel.yogesh_notification_channel.id
  }
}