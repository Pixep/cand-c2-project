# TODO: Designate a cloud provider, region, and credentials
provider "aws" {
  region = "us-east-1"
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "Udacity_T2" {
  ami = "ami-09d95fab7fff3776c"
  instance_type = "t2.micro"
  count = 4
  subnet_id = "subnet-05be3984234fbdc83"

  tags = {
    Name = "Udacity T2"
  }  
}

# TODO: provision 2 m4.large EC2 instances named Udacity M4
# resource "aws_instance" "Udacity_M4" {
#   ami = "ami-09d95fab7fff3776c"
#   instance_type = "m4.large"
#   count = 2
#   subnet_id = "subnet-05be3984234fbdc83"

#   tags = {
#     Name = "Udacity M4"
#   }
# }

