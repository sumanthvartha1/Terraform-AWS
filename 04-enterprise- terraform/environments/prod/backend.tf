terraform {

  backend "s3" {

    bucket = "terraform-enterpise-state-922120356958-ap-south-2-an"

    key = "prod/terraform.tfstate"

    region = "ap-south-2"
    
    use_lockfile = true

  }

}