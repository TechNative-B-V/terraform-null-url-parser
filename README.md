# terraform-null-url-parser ![](https://img.shields.io/github/workflow/status/TechNative-B-V/terraform-null-url-parser/Lint?style=plastic)

This module parses a given URL into seperate components.

[![](we-are-technative.png)](https://www.technative.nl)

## What is it good for?

Say you want to configure an S3 bucket as redirecting website. You can use
*url-parser* for setting `hostname`, `protocol` and `path` in your
`routing_rules`.


## Usage

```hcl

module "target_url" {
  source = "TechNative-B-V/terraform-null-url-parser/null"
  version = "0.1.0"

  url    = "https://registry.terraform.io/namespaces/TechNative-B-V"
}

resource "aws_s3_bucket_website_configuration" "bucket_webconf" {

  ...

  routing_rules = <<EOF
[{
    "Redirect": {
        "Hostname": "${module.target_url.hostname}",
        "Protocol": "${module.target_url.protocol}",
        "ReplaceKeyWith": "${module.target_url.path_and_param}"
    }
}]
EOF
}
```

This generates:

```
[{
    "Redirect": {
        "Hostname": "registry.terraform.io",
        "Protocol": "https",
        "ReplaceKeyWith": "/namespaces/TechNative-B-V"
    }
}]
```

<!-- BEGIN_TF_DOCS -->
## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_url"></a> [url](#input\_url) | URL to parse | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_anchor"></a> [anchor](#output\_anchor) | Anchor component of URL. E.g http://test.com/index.html#second-paragrapth -> 'second-paragraph' |
| <a name="output_hostname"></a> [hostname](#output\_hostname) | Hostname component of URL. E.g http://dev.test.com -> 'dev.test.com' |
| <a name="output_parsed_url"></a> [parsed\_url](#output\_parsed\_url) | All URL components as map of strings |
| <a name="output_path"></a> [path](#output\_path) | Path component of URL. E.g http://test.com/blog/one -> '/blog/one' |
| <a name="output_path_and_param"></a> [path\_and\_param](#output\_path\_and\_param) | The path, query string and anchor components combined as one string |
| <a name="output_protocol"></a> [protocol](#output\_protocol) | Protocol component of URL. E.g http://test.com -> 'http' |
| <a name="output_query"></a> [query](#output\_query) | Query string component of URL. E.g http://test.com/index.html?a=1&b=2 -> 'a=1&b2' |
<!-- END_TF_DOCS -->
