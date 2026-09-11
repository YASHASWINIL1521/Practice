terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.4.0"
    }
  }
     backend "azurerm" {
    resource_group_name  = "github-support-team-rg"
    storage_account_name = "gitsupportteamstateacct"
    container_name       = "yashaswini-statefile" #change
    key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {
  }
}


resource "azurerm_resource_group" "my-rg" {
name = "Yashaswini-dev"
location = "eastus"
}

resource "azurerm_virtual_network" "My-network" {
     depends_on = [ azurerm_resource_group.my-rg ] #meta arg
  name = "yashu-vent"
  resource_group_name = "Yashaswini-dev"
  location = "eastus"
  address_space = ["10.0.0.0/16"]

}