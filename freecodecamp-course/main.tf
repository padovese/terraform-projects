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

resource "aws_instance" "ec2_by_terraform" {
    ami = "ami-0ac80df6eff0e70b5"
    instance_type = "t2.micro"

    tags = {
        Name = "padova"
    }
}