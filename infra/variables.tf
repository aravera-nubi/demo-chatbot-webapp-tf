# Local vars
variable "createdby" {
  description = "The individual or team responsible for creating the resource"
}

variable "deadline" {
  description = "The date by which the project or task associated with the resource should be completed."
}

variable "owner" {
  description = "The individual or team responsible for maintaining and managing the resource."
}

variable "pod" {
  description = "The specific pod to which the resource belongs within Nubiral."
}

variable "project" {
  description = "The name of the project to which the resource is associated."
}

variable "coe" {
  description = "The Nubiral Coe which the resource belongs"
}

variable "environment" {
  description = "The environment of the project resources (test, staging, prod, etc)."
}

# RG vars

variable "location" {
  description = "The Azure Region in wich all resource groups should be created"
}

# App service plan vars
variable "sku_name" {
  description = "The SKU for the App Service plan."
  type        = string
  default     = "B1"
}

variable "os_type" {
  description = "The O/S type for the App Services to be hosted in this plan."
  type        = string
  default     = "Linux"
}

# App Service vars