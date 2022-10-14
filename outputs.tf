output "parsed_url" {
  value = regex("(?:(?P<protocol>[^:/?#]+):)?(?://(?P<hostname>[^/?#]*))?(?P<path>[^?#]*)(?:\\?(?P<query>[^#]*))?(?:#(?P<anchor>.*))?", var.url)
}

output "hostname" {
  value = local.parsed_url.hostname
}

output "protocol" {
  value = local.parsed_url.protocol
}

output "path" {
  value = local.parsed_url.path
}

output "query" {
  value = local.parsed_url.query
}

output "anchor" {
  value = local.parsed_url.anchor
}

output "path_and_param" {
  value = "${ local.parsed_url.path != null ? local.parsed_url.path : "" }${ local.parsed_url.query != null ? local.parsed_url.query : "" }${ local.parsed_url.anchor != null ? local.parsed_url.anchor : "" }"
}

