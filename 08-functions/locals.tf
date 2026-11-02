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