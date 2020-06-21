provider "aws" {
  region = var.aws_region
}

resource "aws_iam_role" "lambda_iam" {
  name = "lambda_iam"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "lambda_iam_policy" {
  name = "lambda_iam_policy"
  role = aws_iam_role.lambda_iam.id

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource": "*"
      }
    ]
  }
  EOF
}

resource "aws_lambda_function" "udacity_lambda" {
  filename      = "lambda.zip"
  function_name = "udacity-hello"
  runtime       = "python3.8"  
  handler       = "lambda.lambda_handler"
  role          = "${aws_iam_role.lambda_iam.arn}"

  source_code_hash = "${filebase64sha256("lambda.zip")}"

  environment {
    variables = {
      greeting = var.greeting
    }
  }  
}