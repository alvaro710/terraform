resource "aws_s3_bucket" "b"{
    bucket= "app_bucket"
    acl= "public-read"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "MYBUCKETPOLICY",
  "Statement": [
    {
      "Sid": "IPAllow",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::my_tf_test_bucket/*",
      "Condition": {
         "IpAddress": {"aws:SourceIp": "8.8.8.8/32"}
      }
    }
  ]
}
POLICY
}
    //policy= file("policy.json")

    
    website{
        index_document = "index.html"
        error_document = "index.html"
    }

    tags={
        Terraform ="true"
        Description = "Global"
    }

    
