output "id" {
  description = "Bucket id"
  value       = [for u in aws_s3_object.this:u.id]
}