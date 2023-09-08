# To create one security group
resource "aws_security_group" "sec_grup_web_app" {
  name        = "web_app"
  description = "security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = var.sec_group_tag
  }
}

// To Generate Private Key
resource "tls_private_key" "rsa_4096" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

// Create Key Pair for Connecting EC2 via SSH
resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa_4096.public_key_openssh
}

// Save PEM file locally
resource "local_file" "private_key" {
  content  = tls_private_key.rsa_4096.private_key_pem
  filename = var.key_name

  provisioner "local-exec" {
    command = "chmod 400 ${var.key_name}"
  }
}

# To create a micro EC2 instance
resource "aws_instance" "webapp_ec2" {
  ami           = var.ami 
  instance_type = var.instance_type  
  key_name      = aws_key_pair.key_pair.key_name
  security_groups= ["web_app"]

  tags = {
    Name = var.ec2_tag,
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i '${aws_instance.webapp_ec2.public_ip},' --user ubuntu --private-key ${var.key_name} deploy.yml"
  }
}