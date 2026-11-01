locals {
  lower_project_name = lower(var.project_name)
}

locals {
  replace_project_name = lower(replace(var.project_name, " ", "-"))
}