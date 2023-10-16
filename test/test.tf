module "target_url" {
  source = "../"
  url    = "https://example.io/namespaces/TechNative-B-V"
}

output "hostname" {
  value = module.target_url.hostname
}

output "protocol" {

  value = module.target_url.protocol
}

output "path_and_param" {
  description = "The path, query string and anchor components combined as one string"
  value = module.target_url.path_and_param
}

output "output_url" {
  value = "${module.target_url.protocol}://${module.target_url.hostname}${module.target_url.path_and_param}"
}
