locals {
  lower_project_name = lower(var.project_name)
}

locals {
  replace_project_name = lower(replace(var.project_name, " ", "-"))
}

locals {
  merge_tags = merge(var.default_tags, var.environment_tags)
}

locals {
  bucket_name = lower(substr(var.bucket_name, 0, 63))
}

locals {
  port_list = split(",", var.allowed_ports)
}

locals {
  sg_rules = [
    for port in local.port_list :
    {
        name = "port-${port}"
        port = port
        description = "Allow traffic on port ${port}"
    }
  ]
}

locals {
  instance_size = lookup(var.instace_sizes, var.environment, "t2.micro")
}

locals {
  convert_to_positive = [for cost in var.monthly_costs : abs(cost)]
  max_cost = max(local.convert_to_positive...)
  min_cost = min(local.convert_to_positive...)
  total_cost = sum(local.convert_to_positive)
  avg_cost = local.total_cost / length(var.monthly_costs)
}

locals {
  config_file_exists = fileexists("config.json")
}

locals {
  config_data = local.config_file_exists? jsondecode(file("config.json")): {}
}