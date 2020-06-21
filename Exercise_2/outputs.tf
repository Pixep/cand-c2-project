# TODO: Define the output variable for the lambda function.
output "lambda_invoke_arn" {
  value       = "${aws_lambda_function.udacity_lambda.invoke_arn}"
  description = "The ARN used to invoke the lambda function."
}