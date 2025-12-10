# modules/compute/main.tf

# 1. Application Security Group (SG)
resource "aws_security_group" "app" {
  name        = "${var.project_name}-app-sg"
  description = "Controls access to the application instances"
  vpc_id      = var.vpc_id

  # Inbound rule: Allow HTTP/HTTPS access from anywhere (conceptual ALB/public access)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule: Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-app-sg"
  }
}

# 2. Conceptual EC2 Instance (representing the application tier)
# This resource is for illustration and conceptual setup and is commented out.
/*
resource "aws_instance" "app" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet_ids[0] # Should be in a private subnet
  vpc_security_group_ids = [aws_security_group.app.id]

  tags = {
    Name = "${var.project_name}-app-instance"
  }
}
*/