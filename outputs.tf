output "parsed_url" {
  description = "All URL components as map of strings"
  value = regex("(?:(?P<protocol>[^:/?#]+):)?(?://(?P<hostname>[^/?#]*))?(?P<path>[^?#]*)(?:\\?(?P<query>[^#]*))?(?:#(?P<anchor>.*))?", var.url)
}

output "hostname" {
  description = "Hostname component of URL. E.g http://dev.test.com -> 'dev.test.com'"
  value = local.parsed_url.hostname
}

output "protocol" {
  description = "Protocol component of URL. E.g http://test.com -> 'http'"
  value = local.parsed_url.protocol
}

output "path" {
  description = "Path component of URL. E.g http://test.com/blog/one -> '/blog/one'"
  value = local.parsed_url.path
}

output "query" {
  description = "Query string component of URL. E.g http://test.com/index.html?a=1&b=2 -> 'a=1&b2'"
  value = local.parsed_url.query
}

output "anchor" {
  description = "Anchor component of URL. E.g http://test.com/index.html#second-paragrapth -> 'second-paragraph'"
  value = local.parsed_url.anchor
}

output "path_and_param" {
  description = "The path, query string and anchor components combined as one string"
  value = "${ local.parsed_url.path != null ? local.parsed_url.path : "" }${ local.parsed_url.query != null ? local.parsed_url.query : "" }${ local.parsed_url.anchor != null ? local.parsed_url.anchor : "" }"
}

