resource "aws_key_pair" "my_key_pair" {
  key_name = "terra-key"
  public_key = file("/Users/sanchitsingh/Documents/Imp/vscode files/terraform-advanced/keys/terra-key.pub")
}

resource "aws_default_vpc" "default" {
  
}

resource "aws_security_group" "my_security_group" {
    name = "my_security_group"
    vpc_id = aws_default_vpc.default.id
    ingress {
        description = "To allow incoming"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    ingress {
        description = "To allow incoming for jenkins"
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }



    egress {
        description = "to allow outoging"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
  
}

resource "aws_instance" "my_demo_instance" {
   
   ami = "ami-09040d770ffe2224f"
   instance_type = "t2.micro"
   key_name = aws_key_pair.my_key_pair.key_name
   security_groups = [ aws_security_group.my_security_group.name ]
   user_data = file("/Users/sanchitsingh/Documents/Imp/vscode files/terraform-advanced/ec2/install.sh")
   tags = {
      Name = "my-demo-instance"
   }
}
