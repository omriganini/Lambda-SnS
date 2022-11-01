resource "aws_iam_role" "lambda_role" {
name   = "Spacelift_Test_Lambda_Function_Role"
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

resource "aws_iam_policy" "iam_policy_for_lambda" {

 name         = "aws_iam_policy_for_terraform_aws_lambda_role"
 path         = "/"
 description  = "AWS IAM Policy for managing aws lambda role"
 policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": [
       "logs:CreateLogGroup",
       "logs:CreateLogStream",
       "logs:PutLogEvents"
     ],
     "Resource": "arn:aws:logs:*:*:*",
     "Effect": "Allow"
   }
 ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
 role        = aws_iam_role.lambda_role.name
 policy_arn  = aws_iam_policy.iam_policy_for_lambda.arn
}


provider "archive" {}

data "archive_file" "zip" {
  type        = "zip"
  source_file = "Lambda_func.py"
  output_path = "Lambda_func.zip"

}

resource "aws_lambda_function" "tf_lamb_func" {
  function_name = "Lamb_func"
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.lambda_handler"
  runtime       = "python3.7"
  depends_on    = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
  filename      = "${data.archive_file.zip.output_path}"
}


resource "aws_sns_topic" "tf_sns" {
  name = "sns_tf"
}
resource "aws_sns_topic_subscription" "sns_tf" {
  endpoint  = "omriganini6@gmail.com"
  protocol  = "email"
  topic_arn = aws_sns_topic.tf_sns.arn
}

resource "aws_apigatewayv2_api" "tf_api" {
  name          = "tf_api"
  protocol_type = "HTTP"
}

#resource "aws_apigatewayv2_integration" "int" {
#  api_id           = aws_apigatewayv2_api.tf_api.id
#  integration_type = "HTTP_PROXY"
#
#  connection_type           = "INTERNET"
#  content_handling_strategy = "CONVERT_TO_TEXT"
#  description               = "Lambda"
#  passthrough_behavior      = "WHEN_NO_MATCH"
#}

