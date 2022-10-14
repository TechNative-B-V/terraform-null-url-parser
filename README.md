# terraform-null-url-parser ![](https://img.shields.io/github/workflow/status/TechNative-B-V/terraform-null-url-parser-name/Lint?style=plastic)

This module parses a given URL into seperate components.

[![](we-are-technative.png)](https://www.technative.nl)

## What is it good for?

Say you want to configure an S3 bucket as redirecting website. You can use
*url-parser* for setting `hostname`, `protocol` and `path` in your
`routing_rules`.

## Usage

```hcl
# ...

module "target_url" {
  source = "../terraform-null-url-parser"
  # you should set a version
  url    = "https://registry.terraform.io/namespaces/TechNative-B-V"
}

resource "aws_s3_bucket_website_configuration" "bucket_webconf" {
  bucket = aws_s3_bucket.route53_http_redirect_bucket.bucket

  index_document {
    suffix = "index.html"
  }

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

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
