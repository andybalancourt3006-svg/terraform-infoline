data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/lambda"
  output_path = "${path.module}/lambda.zip"
}

resource "aws_lambda_function" "infoline_lambda" {
  function_name = "infoline-ecf-lambda"
  role          = aws_iam_role.lambda_role.arn

  runtime = "python3.12"
  handler = "handler.handler"

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  tags = {
    Project   = "InfoLine"
    ManagedBy = "Terraform"
    ECF       = "DevOps"
  }

  depends_on = [aws_iam_role_policy_attachment.lambda_basic_exec]
}
