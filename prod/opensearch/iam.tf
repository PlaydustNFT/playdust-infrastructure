resource "aws_iam_user" "opensearch-master-user" {

  name = "opensearch"
  path = "/opensearch/"


  tags = {
    environment = "prod"
  }
}

resource "aws_iam_user_policy" "opensearch-master-user" {
  name = "opensearch-master-user"
  user = aws_iam_user.opensearch-master-user.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
