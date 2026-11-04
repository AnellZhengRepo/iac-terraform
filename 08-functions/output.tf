output "lower_project_name" {
  description = "lower_project_name"
  value       = local.lower_project_name
}

output "replace_project_name" {
  description = "replace_project_name"
  value       = local.replace_project_name
}

output "port_list" {
    value = local.port_list
}

output "sg_rules" {
  value = local.sg_rules
}

output "instance_size" {
  value = local.instance_size
}

output "credentials" {
  value = var.credentials
}

output "convert_to_positive" {
  value = local.convert_to_positive
}

output "max_cost" {
  value = local.max_cost
}

output "min_cost" {
  value = local.min_cost
}

output "total_cost" {
  value = local.total_cost
}

output "avg_cost" {
  value = local.avg_cost
}

output "config_exist" {
  value = local.config_file_exists
}

output "config_data" {
  value = local.config_data
}