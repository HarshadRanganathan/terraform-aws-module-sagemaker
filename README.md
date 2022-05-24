# terraform-aws-module-sagemaker


## Module Input Variables
----------------------

| Name                          | Description                                                           |  Type  |           Default            | Required |
| ----------------------------- | --------------------------------------------------------------------- | :----: | :--------------------------: | :------: |
| `name` | Name to be used on all resources as prefix | string | TEST | na |
| `stage` | Environment for service | string | STAGE | na |
| `tags` | A list of tag blocks. Each element should have keys named key, value, etc. | list | {} | na |
| `enable_sagemaker_model` | Enable sagemaker model usage | bool | false | na |
| `sagemaker_model_name` | The name of the model (must be unique). If omitted, Terraform will assign a random, unique name. | string | "" | na |
| `sagemaker_model_execution_role_arn` -| (Required) A role that SageMaker can assume to access model artifacts and docker images for deployment. | string | null | required |
| `sagemaker_model_enable_network_isolation` | (Optional) - Isolates the model container. No inbound or outbound network calls can be made to or from the model container. | string | null | optional |
| `sagemaker_model_vpc_config` | (Optional) - Specifies the VPC that you want your model to connect to. VpcConfig is used in hosting services and in batch transform. | list | [] | optional |
| `sagemaker_model_primary_container` | (Optional) The primary docker image containing inference code that is used when the model is deployed for predictions. If not specified, the container argument is required.  | list | [] | optional|
| `sagemaker_model_container` | (Optional) - Specifies containers in the inference pipeline. If not specified, the primary_container argument is required. | list | [] | optional |
| `enable_sagemaker_endpoint_configuration` | Enable sagemaker endpoint configuration usage | bool | false | na |
| `sagemaker_endpoint_configuration_name` | The name of the endpoint configuration. If omitted, Terraform will assign a random, unique name. | string | "" | na |
| `sagemaker_endpoint_configuration_kms_key_arn` | (Optional) Amazon Resource Name (ARN) of a AWS Key Management Service key that Amazon SageMaker uses to encrypt data on the storage volume attached to the ML compute instance that hosts the endpoint. | string | null | optional |
| `sagemaker_endpoint_configuration_production_variants` | (Required) Fields for endpoint | list | [] | required |
| `enable_sagemaker_endpoint` | Enable sagemaker endpoint usage | bool | false | na |
| `sagemaker_endpoint_name` | The name of the endpoint. If omitted, Terraform will assign a random, unique name. | string | null | na |
| `sagemaker_endpoint_endpoint_config_name` | The name of the endpoint configuration to use. | string | "" | na |
| `enable_sagemaker_notebook_instance_lifecycle_configuration` | Enable sagemaker notebook instance lifecycle configuration usage | bool | false | na |
| `sagemaker_notebook_instance_lifecycle_configuration_name` | The name of the lifecycle configuration (must be unique). If omitted, Terraform will assign a random, unique name. | string | null | na |
| `sagemaker_notebook_instance_lifecycle_configuration_on_create` | (Optional) A shell script (base64-encoded) that runs only once when the SageMaker Notebook Instance is created. | string | null | optional |
| `sagemaker_notebook_instance_lifecycle_configuration_on_start` | (Optional) A shell script (base64-encoded) that runs every time the SageMaker Notebook Instance is started including the time it's created. | string | null | optional |
| `enable_sagemaker_notebook_instance` | Enable sagemaker notebook instance usage | bool | false | na |
| `sagemaker_notebook_instance_name` | The name of the notebook instance (must be unique). | string | "" | na |
| `sagemaker_notebook_instance_role_arn` | (Required) The ARN of the IAM role to be used by the notebook instance which allows SageMaker to call other services on your behalf. | string | null | required |
| `sagemaker_notebook_instance_instance_type` | (Required) The name of ML compute instance type. | string | ml.t2.medium | required |
| `sagemaker_notebook_instance_subnet_id` | (Optional) The VPC subnet ID. | string | null | optional |
| `sagemaker_notebook_instance_security_groups` | (Optional) The associated security groups. | string | null | optional |
| `sagemaker_notebook_instance_kms_key_id` | (Optional) The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt the model artifacts at rest using Amazon S3 server-side encryption. | string | null | optional |
| `sagemaker_notebook_instance_lifecycle_config_name` | (Optional) The name of a lifecycle configuration to associate with the notebook instance. | string | null | optional |
| `sagemaker_notebook_instance_direct_internet_access` | (Optional) Set to Disabled to disable internet access to notebook. Requires security_groups and subnet_id to be set. Supported values: Enabled (Default) or Disabled. If set to Disabled, the notebook instance will be able to access resources only in your VPC, and will not be able to connect to Amazon SageMaker training and endpoint services unless your configure a NAT Gateway in your VPC. | string | null | optional |
| `enable_sagemaker_user_profile` | Enable sagemaker user profile usage | bool | false | na |
| `sagemaker_user_profile_name` | The name for the User Profile. | string | "" | na |
| `sagemaker_user_profile_domain_id` | The ID of the associated Domain. | string | "" | na |
| `sagemaker_user_profile_single_sign_on_user_value` | (Required) The username of the associated AWS Single Sign-On User for this User Profile. If the Domain's AuthMode is SSO, this field is required, and must match a valid username of a user in your directory. If the Domain's AuthMode is not SSO, this field cannot be specified. | string | nnull | required |
| `sagemaker_user_profile_single_sign_on_user_identifier` | (Optional) A specifier for the type of value specified in single_sign_on_user_value. Currently, the only supported value is UserName. If the Domain's AuthMode is SSO, this field is required. If the Domain's AuthMode is not SSO, this field cannot be specified. | string | null | optional |
| `sagemaker_user_profile_user_settings` | AAA | map | {'execution_role': None, 'security_groups': None} | na |
| `sagemaker_user_profile_sharing_settings` | (Optional) The sharing settings. | list | [] | optional |
| `sagemaker_user_profile_tensor_board_app_settings` | (Optional) The TensorBoard app settings. | list | [] | optional |
| `sagemaker_user_profile_jupyter_server_app_settings` | (Optional) The Jupyter server's app settings. | list | [] | optional |
| `sagemaker_user_profile_kernel_gateway_app_settings` | (Optional) The kernel gateway app settings. | list | [] | optional |
| `enable_sagemaker_domain` | Enable sagemaker domain usage | bool | false | na |
| `sagemaker_domain_name` | The domain name. | string | "" | na |
| `sagemaker_domain_auth_mode` | (Required) The mode of authentication that members use to access the domain. Valid values are IAM and SSO | string | null | required |
| `sagemaker_domain_vpc_id` | (Required) The ID of the Amazon Virtual Private Cloud (VPC) that Studio uses for communication. | string | null | required |
| `sagemaker_domain_subnet_ids` | (Required) The VPC subnets that Studio uses for communication. | string | null | required |
| `sagemaker_domain_kms_key_id` | (Optional) The AWS KMS customer managed CMK used to encrypt the EFS volume attached to the domain. | string | null | optional |
| `sagemaker_domain_app_network_access_type` | (Optional) Specifies the VPC used for non-EFS traffic. The default value is PublicInternetOnly. Valid values are PublicInternetOnly and VpcOnly. | string | null | optional |
| `sagemaker_domain_default_user_settings` | (Required) The default user settings. | map | {'execution_role': None, 'security_groups': None} | required |
| `sagemaker_domain_sharing_settings` | (Optional) The sharing settings.  | list | [] | optional |
| `sagemaker_domain_tensor_board_app_settings` | (Optional) The TensorBoard app settings. | list | [] | optional |
| `sagemaker_domain_jupyter_server_app_settings` | (Optional) The Jupyter server's app settings. | list | [] | optional |
| `sagemaker_domain_kernel_gateway_app_settings` | (Optional) The kernel gateway app settings. | list | [] | optional |
| `enable_sagemaker_model_package_group` | Enable sagemaker model package group usage | bool | false | na |
| `sagemaker_model_package_group_name` | The name of the model group. | string | "" | na |
| `sagemaker_model_package_group_description` | AAA | string | null | na |
| `enable_sagemaker_image` | Enable sagemaker image usage | bool | false | na |
| `sagemaker_image_name` | The name of the image. Must be unique to your account. | string | "" | na |
| `sagemaker_image_role_arn` | (Required) The Amazon Resource Name (ARN) of an IAM role that enables Amazon SageMaker to perform tasks on your behalf. | string | null | required |
| `sagemaker_image_display_name` | (Optional) The display name of the image. When the image is added to a domain (must be unique to the domain). | string | null | optional |
| `sagemaker_image_description` | (Optional) The description of the image. | string | null | optional |
| `enable_sagemaker_image_version` | Enable sagemaker image version usage | bool | false | na |
| `sagemaker_image_version_image_name` | The name of the image. Must be unique to your account. | string | "" | na |
| `sagemaker_image_version_base_image` | (Required) The registry path of the container image on which this image version is based. | string | null | required |
| `enable_sagemaker_feature_group` | Enable sagemaker feature group usage | bool | false | na |
| `sagemaker_feature_group_name` | The name of the Feature Group. The name must be unique within an AWS Region in an AWS account. | string | "" | na |
| `sagemaker_feature_group_record_identifier_feature_name` | The name of the Feature whose value uniquely identifies a Record defined in the Feature Store. Only the latest record per identifier value will be stored in the Online Store. | string | "" | na |
| `sagemaker_feature_group_event_time_feature_name` | The name of the feature that stores the EventTime of a Record in a Feature Group. | string | "" | na |
| `sagemaker_feature_group_role_arn` | (Required) - The Amazon Resource Name (ARN) of the IAM execution role used to persist data into the Offline Store if an offline_store_config is provided. | string | null | required |
| `sagemaker_feature_group_description` | (Optional) - A free-form description of a Feature Group. | string | null | optional |
| `sagemaker_feature_group_feature_definition` | (Optional) - A list of Feature names and types. | list | [] | optional |
| `sagemaker_feature_group_s3_storage_config` | (Required) The Amazon Simple Storage (Amazon S3) location of OfflineStore. | list | [] | required |
| `sagemaker_feature_group_data_catalog_config` | (Optional) The meta data of the Glue table that is autogenerated when an OfflineStore is created. | list | [] | optional |
| `sagemaker_feature_group_security_config` | (Required) Security config for at-rest encryption of your OnlineStore. | list | [] | required |
| `enable_sagemaker_code_repository` | Enable sagemaker code repository usage | bool | false | na |
| `sagemaker_code_repository_name` | The name of the Code Repository (must be unique). | string | "" | na |
| `sagemaker_code_repository_git_config` | (Required) Specifies details about the repository. | list | [] | required |
| `enable_sagemaker_app_image_config` | Enable sagemaker app image config usage | bool | false | na |
| `sagemaker_app_image_config_name` | The name of the App Image Config. | string | "" | na |
| `sagemaker_app_image_config_kernel_spec` | (Required) The default branch for the Git repository. | list | [] | required |
| `sagemaker_app_image_config_file_system_config` | (Optional) The URL where the Git repository is located. | list | [] | optional |

## Module Output Variables
----------------------

| Name                          | Description                                                           |
| ----------------------------- | --------------------------------------------------------------------- |
| `sagemaker_model_id` | The ID of sagemaker model |
| `sagemaker_model_name` | The name of the model. |
| `sagemaker_model_arn` | The Amazon Resource Name (ARN) assigned by AWS to this model. |
| `sagemaker_endpoint_configuration_id` | The ID of sagemaker endpoint configuration | 
| `sagemaker_endpoint_configuration_arn` | The Amazon Resource Name (ARN) assigned by AWS to this endpoint configuration. |
| `sagemaker_endpoint_configuration_name` | The name of the endpoint configuration. |
| `sagemaker_endpoint_id` | The ID of sagemaker endpoint |
| `sagemaker_endpoint_arn` | The Amazon Resource Name (ARN) assigned by AWS to this endpoint. |
| `sagemaker_endpoint_name` | The name of the endpoint. |
| `sagemaker_notebook_instance_lifecycle_configuration_id` | The ID of notebook instance lifecycle configuration |
| `sagemaker_notebook_instance_lifecycle_configuration_arn` | The Amazon Resource Name (ARN) assigned by AWS to this lifecycle configuration. |
| `sagemaker_notebook_instance_id` | The name of the notebook instance. |
| `sagemaker_notebook_instance_arn` | The Amazon Resource Name (ARN) assigned by AWS to this notebook instance. |
| `sagemaker_user_profile_id` | The user profile Amazon Resource Name (ARN). |
| `sagemaker_user_profile_arn` | The user profile Amazon Resource Name (ARN). |
| `sagemaker_user_profile_home_efs_file_system_uid` | The ID of the user's profile in the Amazon Elastic File System (EFS) volume. |
| `sagemaker_domain_id` | The ID of the Domain. |
| `sagemaker_domain_arn` | The Amazon Resource Name (ARN) assigned by AWS to this Domain. |
| `sagemaker_domain_url` | The domain's URL. |
| `sagemaker_domain_single_sign_on_managed_application_instance_id` | The SSO managed application instance ID. |
| `sagemaker_domain_home_efs_file_system_id` | The ID of the Amazon Elastic File System (EFS) managed by this Domain. |
| `sagemaker_model_package_group_id` | The name of the Model Package Group. |
| `sagemaker_model_package_group_arn` | The Amazon Resource Name (ARN) assigned by AWS to this Model Package Group. |
| `sagemaker_image_id` | The name of the Image. |
| `sagemaker_image_arn` | The Amazon Resource Name (ARN) assigned by AWS to this Image. |
| `sagemaker_image_version_id` | The name of the Image version. |
| `sagemaker_image_version_arn` | The Amazon Resource Name (ARN) assigned by AWS to this Image version. |
| `sagemaker_feature_group_id` | The name of the feature group. |
| `sagemaker_feature_group_arn` | The Amazon Resource Name (ARN) assigned by AWS to this feature_group. |
| `sagemaker_feature_group_name` | The name of the Feature Group. |
| `sagemaker_code_repository_id` | The name of the Code Repository. |
| `sagemaker_code_repository_arn` | The Amazon Resource Name (ARN) assigned by AWS to this Code Repository. |
| `sagemaker_app_image_config_id` | The name of the app image config. |
| `sagemaker_app_image_config_arn` | The Amazon Resource Name (ARN) assigned by AWS to this App Image Config. |

