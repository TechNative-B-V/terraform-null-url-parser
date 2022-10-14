# URL Parser Complete example

You can run `terraform plan` to see what this example does.

```
Changes to Outputs:
  + full_path_and_params    = "/pathquery1=1&query2=2frag"
  + url_full_all_parts      = {
      + anchor   = "frag"
      + hostname = "user:pass@www.example.com:8080"
      + path     = "/path"
      + protocol = "http"
      + query    = "query1=1&query2=2"
    }
  + url_full_anchor         = "frag"
  + url_full_hostname       = "user:pass@www.example.com:8080"
  + url_full_path           = "/path"
  + url_full_protocol       = "http"
  + url_full_query          = "query1=1&query2=2"
  + url_minimal_all_parts   = {
      + anchor   = null
      + hostname = "example.com"
      + path     = ""
      + protocol = "https"
      + query    = null
    }
  + url_with_path_all_parts = {
      + anchor   = null
      + hostname = "www.example.com"
      + path     = "/path"
      + protocol = "https"
      + query    = null
    }
```
