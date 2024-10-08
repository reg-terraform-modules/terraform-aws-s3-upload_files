# Resource/function: s3/upload_files

## Purpose
Generic code for uploading files to s3 buckets

## Description
Upload files to s3 buckets.

## Terraform functions

### Data sources

### Resources
- `aws_s3_object`
    - loads data in the bucket

## Input variables
### Required
- `bucket_name`
    - defines the name of the bucket
- `upload_directory`
    - local directory where files are located  

### Optional (default values used unless specified)
- `bucket_key`
    - s3 target folder where all files will be copied from upload_directory
    - if by default "" - all files will be copied directly to bucket 
- `tags`
    - tags added to role - should be specified jointly with all other resources in the same module
    - default: `"tag" = "none given"`
- `bucket_acl`
    - Canned acl to be used - see https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl for options
    - default: `"private"`
- `mime_types`
    - map(strings). A MIME type (or media type) is an identifier for file formats or format contents on the Internet.

## Output variables
- `id`
    - `id` - array of the uploaded file names

## Example use
The below example generates a bucket using default input where available.
```sql
module "s3_dim_station_name_upload" {
  source  = "app.terraform.io/renovasjonsetaten/s3-upload_files/aws"
  version = "0.1.1"
  bucket_name         = module.s3_dim_station_name_folder.name
  bucket_key          = module.s3_dim_station_name_folder.key
  bucket_acl          = "public-read"
  upload_directory    = join("", [path.module, "/s3_dimension_station_name/"])
  tags                = local.resource_tags
}

```

## Further work
