## MINIMAL EXAMPLE
module "url_minimal" {
  source = "../../"
  url = "https://example.com"
}
output "url_minimal_all_parts" {
  value = module.url_minimal.parsed_url
}

## WITH PATH
module "url_with_path" {
  source = "../../"
  url = "https://www.example.com/path"
}

output "url_with_path_all_parts" {
  value = module.url_with_path.parsed_url
}

## FULL EXAMPLE
module "url_full" {
  source = "../../"
  url = "http://user:pass@www.example.com:8080/path?query1=1&query2=2#frag"
}

output "url_full_all_parts" {
  value = module.url_full.parsed_url
}

## SEPERATE PARTS
output "url_full_protocol" {
  value = module.url_full.protocol
}
output "url_full_hostname" {
  value = module.url_full.hostname
}
output "url_full_path" {
  value = module.url_full.path
}
output "url_full_query" {
  value = module.url_full.query
}
output "url_full_anchor" {
  value = module.url_full.anchor
}

output "full_path_and_params" {
  value = module.url_full.path_and_param
}
