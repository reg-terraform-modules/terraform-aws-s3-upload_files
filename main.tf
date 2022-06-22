resource "aws_s3_object" "this" {
  for_each      = fileset(var.upload_directory, var.file_name)
  bucket        = var.bucket_name
  key           = replace("${var.bucket_key}${each.value}", var.upload_directory, "")
  source        = "${var.upload_directory}${each.value}"
  acl           = var.bucket_acl
  content_type  = lookup(var.mime_types, split(".", each.value)[length(split(".", each.value)) - 1])
  etag          = filemd5("${var.upload_directory}${each.value}")
}