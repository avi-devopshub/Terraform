data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-kernel-6.18-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

resource "aws_instance" "my_ec2"{
    ami = data.aws_ami.amazon_linux.id
    key_name = var.key_name
    instance_type = var.instance_type
    tags = {
        Name = "my_ec2"
    }
}