# modules/database/main.tf (CLEAN, CORRECT VERSION)

resource "aws_db_subnet_group" "default" {
  name        = "${var.project_name}-db-subnet-group"
  subnet_ids  = var.private_subnet_ids
  description = "Subnet group for the RDS instance"

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}

resource "aws_security_group" "db" {
  name        = "${var.project_name}-db-sg"
  description = "Controls access to the RDS database"
  vpc_id      = var.vpc_id

  # Inbound rule for RDS: allow traffic from the app security group (conceptual)
  # This block is commented out until the compute module is fully wired up.
  /*
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [var.app_security_group_id]
  }
  */

  tags = {
    Name = "${var.project_name}-db-sg"
  }
}

resource "aws_db_instance" "main" {
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "15.2"
  instance_class         = var.db_instance_class
  db_name                = "appdb"
  username               = "appuser"
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.db.id]
  skip_final_snapshot    = true
  publicly_accessible    = false # CRUCIAL: Keep the database private!

  tags = {
    Name = "${var.project_name}-rds-instance"
  }
}