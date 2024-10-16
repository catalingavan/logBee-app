terraform {
  required_providers {
    azurerm = {
      version = "~> 4.5"
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id                 = local.subscription_id
  resource_provider_registrations = "none"
}

data "terraform_remote_state" "common" {
  backend = "local"
  config = {
    path = "../01_common/terraform.tfstate"
  }
}

resource "azurerm_service_plan" "service_plan" {
  name                = "logbee-service-plan"
  location            = data.terraform_remote_state.common.outputs.resource_group_location
  resource_group_name = data.terraform_remote_state.common.outputs.resource_group_name
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "logbee_frontend" {
  name                = "logbee-frontend"
  location            = data.terraform_remote_state.common.outputs.resource_group_location
  resource_group_name = data.terraform_remote_state.common.outputs.resource_group_name
  service_plan_id     = azurerm_service_plan.service_plan.id

  site_config {
    always_on = false
    application_stack {
      docker_image_name = "catalingavan/logbee.frontend:1.2.1"
    }
    app_command_line = "sh -c 'azcopy copy https://logbeestorage.blob.core.windows.net/logbee-container/frontend.appsettings.json /app/appsettings.json && exec dotnet logBee.Frontend.AspNetCore.dll'"
  }
}

# resource "null_resource" "download_zip" {
#   provisioner "local-exec" {
#     command = "curl -o /logbee.Frontend.zip https://github.com/catalingavan/logbee-app/releases/download/logbee.Frontend-v1.2.1/logbee.Frontend-v1.2.1-linux-x64.zip"
#   }
# }

# resource "null_resource" "deploy_zip" {
#   provisioner "local-exec" {
#     command = "az webapp deployment source config-zip --resource-group ${data.terraform_remote_state.common.outputs.resource_group_name} --name ${azurerm_linux_web_app.logbee_frontend.name} --src /logbee.Frontend.zip"
#   }
# }
