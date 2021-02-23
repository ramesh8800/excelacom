provider "aws" {
  region = "us-east-2"
}
resource "aws_db_subnet_group" "Groups" {
  name       = "db groups"
  subnet_ids = var.private_subnets

  tags = {
    Name = "DB subnet group"
  }
}

resource "aws_security_group" "data" {
  name        = "data-SG"
  description = "Allow mysql inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Traffic"
    from_port        = 1521
    to_port          = 1521
    protocol         = "tcp"
  }

  tags = {
    Name = "data_server-SG"
  }

}


resource "aws_db_instance" "db" {
  identifier             = "${var.identifier}-${var.environment}"
  allocated_storage      = "${var.allocated_storage}"
 // storage_type           = "${var.storage_type}"
  engine                 = "${var.engine}"
  engine_version         = "${var.engine_version}"
  instance_class         = "${var.instance_class}"
  name                   = "${var.database_name}"
  publicly_accessible    = false
  db_subnet_group_name   = aws_db_subnet_group.Groups.name
  vpc_security_group_ids = [aws_security_group.data.id]
  username               = "admin"
  password               = "admin123"


 depends_on = [ aws_db_subnet_group.Groups, aws_security_group.data ]

}
