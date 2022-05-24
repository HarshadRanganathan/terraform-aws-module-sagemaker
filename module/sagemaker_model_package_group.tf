#---------------------------------------------------
# AWS sagemaker model package group
#---------------------------------------------------
resource "aws_sagemaker_model_package_group" "sagemaker_model_package_group" {
  count = var.enable_sagemaker_model_package_group ? 1 : 0

  model_package_group_name        = "${module.label.id}-sagemaker-model-package-group"

  model_package_group_description = var.sagemaker_model_package_group_description

  tags = merge(
    {
      Name = "${module.label.id}-sagemaker-model-package-group"
    },
    var.tags
  )

  lifecycle {
    create_before_destroy = true
    ignore_changes        = []
  }

  depends_on = []
}