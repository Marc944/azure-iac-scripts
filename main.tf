provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "candidate_rg" {
  name     = "CANDIDATE_RG"
  location = "West Europe"
}

module "network" {
  source = "Azure/network/azurerm"
  resource_group_name = azurerm_resource_group.candidate_rg.name
  location            = azurerm_resource_group.candidate_rg.location
}

module "jenkins" {
  source = "./jenkins"
  resource_group_name = azurerm_resource_group.candidate_rg.name
  location            = azurerm_resource_group.candidate_rg.location
}

module "aks" {
  source = "./aks"
  resource_group_name = azurerm_resource_group.candidate_rg.name
  location            = azurerm_resource_group.candidate_rg.location
}

module "keyvault" {
  source = "./keyvault"
  resource_group_name = azurerm_resource_group.candidate_rg.name
  location            = azurerm_resource_group.candidate_rg.location
}

module "acr" {
  source = "./acr"
  resource_group_name = azurerm_resource_group.candidate_rg.name
  location            = azurerm_resource_group.candidate_rg.location
}

