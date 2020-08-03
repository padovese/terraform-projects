#https://www.youtube.com/watch?v=SLB_c_ayRMo

provider "aws" {
  region  = "us-east-1"
  access_key = "-"
  secret_key = "-"
}

#resource "<provider>_<resource_type>" "name"{
#    config options...
#    key = "value"
#    other_key = "otther value"
#}

# terraform plan = run your code for sintax and rules validation
# terraform apply = run your code for real
# terraform destroy = delete the resources 
# (if you delete the code, TF will destroy the resource in the next apply command)

resource "aws_instance" "ec2_by_terraform" {
    ami = "ami-0ac80df6eff0e70b5"
    instance_type = "t2.micro"

    tags = {
        Name = "padova"
        Desc = "LOL"
    }
}

resource "aws_vpc" "first_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Production"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.first_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Production_subnet"
  }
}