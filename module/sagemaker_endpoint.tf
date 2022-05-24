#---------------------------------------------------
# AWS Sagemaker endpoint
#---------------------------------------------------
resource "aws_sagemaker_endpoint" "sagemaker_endpoint" {
  count = var.enable_sagemaker_endpoint ? 1 : 0

  name                 = "${module.label.id}-sagemaker-endpoint"
  endpoint_config_name = aws_sagemaker_endpoint_configuration.sagemaker_endpoint_configuration.*.name

  tags = merge(
    {
      Name = "${module.label.id}-sagemaker-endpoint"
    },
    var.tags
  )

  lifecycle {
    create_before_destroy = true
    ignore_changes        = []
  }

  depends_on = [
    aws_sagemaker_endpoint_configuration.sagemaker_endpoint_configuration
  ]
}
