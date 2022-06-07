# Required variables:
variable "bucket_name" {
  description = "Name of the bucket"
  type        = string
}

variable "upload_directory" {
  description = "source local directory"
  type        = string  
}

#Optional variables - default values used unless others specified:
variable "bucket_key" {
  description = "bucket key. path between bucket and file"
  type        = string  
  default     = ""
}

variable "bucket_acl" {
  description = "Canned ACL - see https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl for options"
  type        = string
  default     = "private"
}

variable "file_name" {
  description = "Optional file name if a specific file in folder shall be uploaded. Defaults to all files in upload_directory."
  type        = string
  default     = "**/*.*"
}

variable "mime_types" {
  default = {
    html  = "text/html"
    txt   = "text/plain"
    css   = "text/css"
    js    = "application/javascript"
    map   = "application/json"
    json  = "application/json"
    csv   = "text/csv"
    sql   = "application/sql"
    gif   = "image/gif"
    jpg   = "image/jpeg"
    JPG   = "image/jpeg"
    jpeg  = "image/jpeg"
    png   = "image/png"
    yml   = "binary/octet-stream"
    yaml  = "binary/octet-stream"
    ico   = "image/vnd.microsoft.icon"
    woff  = "font/woff"
  }
}

variable "tags" {
  description = "Defaults to no tags."
  type        = map(string)
  default = {
    "tag" = "none given"
  }
}