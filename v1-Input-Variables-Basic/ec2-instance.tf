# Create EC2 Instance
resource "aws_instance" "my-ec2-vm_linux" {
  ami                    = var.ec2_ami_id
  instance_type          = "t3.micro"
  key_name               = "Rajinikanth"
  count                  = var.ec2_instance_count
  user_data              = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1> Welcome to DevOps-Classes on terraform  </h1>" > /var/www/html/index.html
    EOF
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "myec2linux"
  }
}

resource "aws_instance" "my-ec2-vm_ubuntu" {
  ami                    = var.ec2_ami_ubuntu_id
  instance_type          = "t3.micro"
  key_name               = "Rajinikanth"
  count                  = var.ec2_instance_count
  user_data              = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install apache -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1> Welcome to DevOps-Classes on terraform  </h1>" > /var/www/html/index.html
    EOF
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "myec2vmubuntu"
  }
}
