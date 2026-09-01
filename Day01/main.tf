resource "aws_instance" "my_ec2"{
    ami = "ami-0150f017fff1a46de"
    instance_type = "t3.micro"
    key_name = "mumbai"
    #End
}