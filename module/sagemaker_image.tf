#---------------------------------------------------
# AWS sagemaker image
#---------------------------------------------------
resource "aws_sagemaker_image" "sagemaker_image" {
  count = var.enable_sagemaker_image ? 1 : 0

  image_name = "${module.label.id}-sagemaker-image"
  role_arn   = var.sagemaker_image_role_arn

  display_name = var.sagemaker_image_display_name
  description  = var.sagemaker_image_description

  tags = merge(
    {
      Name = "${module.label.id}-sagemaker-image"
    },
    var.tags
  )

  lifecycle {
    create_before_destroy = true
    ignore_changes        = []
  }

  depends_on = []
}