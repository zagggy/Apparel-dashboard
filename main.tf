provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "dashboard_server" {
  ami           = "ami-0c7217cdde317cfec" # Amazon Linux 2023 AMI
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install docker -y
              service docker start
              docker run -d -p 80:8501 --restart always your-docker-hub-username/apparel-dashboard:latest
              EOF

  tags = { Name = "Apparel-Dashboard" }
}
