#---------------------------------------------------
# AWS Sagemaker user profile
#---------------------------------------------------
resource "aws_sagemaker_user_profile" "sagemaker_user_profile" {
  count = var.enable_sagemaker_user_profile ? 1 : 0

  user_profile_name          = "${module.label.id}-sagemaker-user-profile"
  domain_id                 = aws_sagemaker_domain.sagemaker_domain[0].id
  single_sign_on_user_value = var.sagemaker_user_profile_single_sign_on_user_value

  single_sign_on_user_identifier = var.sagemaker_user_profile_single_sign_on_user_identifier

  user_settings {
    execution_role = var.user_profile_execution_role

    security_groups = var.user_profile_security_groups

    dynamic "sharing_settings" {
      iterator = sharing_settings
      for_each = var.sagemaker_user_profile_sharing_settings
      content {
        notebook_output_option = lookup(sharing_settings.value, "notebook_output_option", null)
        s3_kms_key_id          = lookup(sharing_settings.value, "s3_kms_key_id", null)
        s3_output_path         = lookup(sharing_settings.value, "s3_output_path", null)
      }
    }

    dynamic "tensor_board_app_settings" {
      iterator = tensor_board_app_settings
      for_each = var.sagemaker_user_profile_tensor_board_app_settings
      content {
        default_resource_spec {
          instance_type       = lookup(tensor_board_app_settings.value, "instance_type", null)
          sagemaker_image_arn = lookup(tensor_board_app_settings.value, "sagemaker_image_arn", null)
        }
      }
    }

    dynamic "jupyter_server_app_settings" {
      iterator = jupyter_server_app_settings
      for_each = var.sagemaker_user_profile_jupyter_server_app_settings
      content {
        default_resource_spec {
          instance_type       = lookup(jupyter_server_app_settings.value, "instance_type", null)
          sagemaker_image_arn = lookup(jupyter_server_app_settings.value, "sagemaker_image_arn", null)
        }
      }
    }

    dynamic "kernel_gateway_app_settings" {
      iterator = kernel_gateway_app_settings
      for_each = var.sagemaker_user_profile_kernel_gateway_app_settings
      content {
        default_resource_spec {
          instance_type       = lookup(kernel_gateway_app_settings.value, "instance_type", null)
          sagemaker_image_arn = lookup(kernel_gateway_app_settings.value, "sagemaker_image_arn", null)
        }
        custom_image {
          app_image_config_name = lookup(kernel_gateway_app_settings.value, "app_image_config_name", null)
          image_name            = lookup(kernel_gateway_app_settings.value, "image_name", null)

          image_version_number = lookup(kernel_gateway_app_settings.value, "image_version_number", null)
        }
      }
    }

  }

  tags = merge(
    {
      Name = "${module.label.id}-sagemaker-user-profile"
    },
    var.tags
  )

  lifecycle {
    create_before_destroy = true
    ignore_changes        = []
  }

  depends_on = [
    aws_sagemaker_domain.sagemaker_domain
  ]
}
