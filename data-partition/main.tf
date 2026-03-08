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