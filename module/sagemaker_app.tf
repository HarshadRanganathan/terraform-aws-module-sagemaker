resource "random_string" "lifecycle" {
  length = 4
}

resource "aws_sagemaker_app" "main" {
  count = var.enable_sagemaker_domain && var.enable_sagemaker_app ? 1 : 0
  domain_id         = aws_sagemaker_domain.sagemaker_domain[0].id
  user_profile_name = aws_sagemaker_user_profile.sagemaker_user_profile[0].user_profile_name
  app_name          = var.sagemaker_app_name
  app_type          = var.sagemaker_app_type

  resource_spec {
    instance_type = var.app_instance_type
  }

  tags = merge(
    {
      Name = "${module.label.id}-sagemaker-app"
    },
    var.tags
  )

  depends_on = [aws_sagemaker_domain.sagemaker_domain]
}
