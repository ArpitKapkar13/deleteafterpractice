resource "aws_instance" "web" {
  ami           = var.web_ami
  instance_type = var.web_instance_type
  key_name = var.web_keys
  disable_api_termination = var.wev_disable_api_termination 
  subnet_id = var.web_subnetA.id
  vpc_security_group_ids = [var.web_security_group]

  user_data = <<-EOF
               #!/bin/bash
               sudo yum update -y
               sudo yum install -y httpd
               sudo systemctl start httpd
               sudo systemctl enable httpd
               echo "<h1>Welcome to Webserver</h1>" > /var/www/html/index.html
               EOF

}