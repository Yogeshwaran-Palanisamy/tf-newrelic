variable "rules" {
  type = set(object({
    nrql = string,
    dp = string,
    desciption = string
  }))
  default = [
    {
    "nrql" = "namespace_name='ci'",
    "dp"   = "Log_ci",
    "desciption" = "Data partition for ci namespace"
    },
    {
      "nrql" = "namespace_name='gha_runner'",
      "dp"   = "Log_gha",
      "desciption" = "Data partition for gha-runners namespace"
    },
    {
      "nrql" = "namespace_name='ngrok'",
      "dp"   = "Log_ngrok",
      "desciption" = "Data partition for ngrok namespace"
    }
  ]
}



