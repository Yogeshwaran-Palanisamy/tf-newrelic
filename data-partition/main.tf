resource "newrelic_data_partition_rule" "ci" {
for_each       = {for rule in var.rules: rule.dp => rule}
  description           = each.value.desciption
  enabled               = true
  nrql                  = each.value.nrql
  retention_policy      = "STANDARD"
  target_data_partition = each.value.dp
  lifecycle {
    create_before_destroy = false
  }
}

data "newrelic_alert_policy" "initial" {
  name = "Initial policy"
}

module "monitor" {
  source = "./modules/synthetic-monitor"
}

module "condition" {
  source = "./modules/alert-condition"
  policy_id = data.newrelic_alert_policy.initial.id
  monitor_id = module.monitor.health_check_id
}

module "notification" {
  source = "./modules/alert-notification"
  policy_id = data.newrelic_alert_policy.initial.id

  providers = {
    newrelic = newrelic
  }
}
