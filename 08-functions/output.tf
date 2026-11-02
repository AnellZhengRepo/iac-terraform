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