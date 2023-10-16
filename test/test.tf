module "target_url" {
  source = "../"
  #version = "0.1.0"

  url    = "https://registry.terraform.io/namespaces/TechNative-B-V"
}

resource "aws_s3_bucket" "terratestbucket" {
  bucket = "technative-terratest-test-bucket"
  
}

resource "aws_s3_bucket_website_configuration" "terratest" {
  bucket = aws_s3_bucket.terratestbucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
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

output "input_url" {
  value = module.target_url.url
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