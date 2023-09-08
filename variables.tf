variable "ami" {
  type        = string
  description = "Ubuntu AMI ID in N. Virginia Region"
  default     = "ami-0af6e9042ea5a4e3e"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "t2.micro"
}

variable "ec2_tag" {
  type        = string
  description = "Name of the EC2 instance"
  default     = "webapp_ec2"
}

variable "sec_group_tag" {
  type        = string
  description = "Name of the EC2 instance"
  default     = "Web App"
}

variable "key_name" {
  type        = string
  description = "Name of the SSH key pair"
  default     = "WebApp"
}

output "public_ip" {
  value       = aws_instance.webapp_ec2.public_ip
  description = "Public IP Address of EC2 instance"
}

output "instance_id" {
  value       = aws_instance.webapp_ec2.id
  description = "Instance ID"
}