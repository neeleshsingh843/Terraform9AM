terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.66.0"  # Optional: specify the version you want to use
    }
  }
}

provider "aws" {
  
}

#run terraform providers command to check version just for provider version identification


### ----- below example for specifi version range we can take ---- ####
# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = ">= 4.10.0, < 5.0.0"
#     }
#   }
# }

# provider "aws" {
#   region = "us-east-1"
# }