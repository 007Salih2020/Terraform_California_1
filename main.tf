# Provider 
provider "aws" {
  profile = "default"
  version = "~> 2.70"
  region  = var.region
}

# Launcing instances
resource "aws_instance" "instance-pr" {
  ami           = var.ami_name
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.sub-private.id
  associate_public_ip_address = false 
  vpc_security_group_ids = [aws_security_group.secgroup-pr.id]
  
  tags = {
    Name = "instance-pr"
  }  
}

resource "aws_instance" "instance-pub" {
  ami           = var.ami_name
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.sub-public.id
  associate_public_ip_address = true  
  vpc_security_group_ids = [aws_security_group.secgroup-pub.id]
  
  tags = {
    Name = "instance-pub"
  }  
  
  connection {
    type = "ssh"
    user = var.user_name
    private_key = file("~/ssh-keygen/id_rsa") //C:\Users\erdinc\Documents\Cloud\AWS\ssh-keygen ///c/Users/erdinc/.ssh/id_rsa
    host = self.public_ip
 }
  provisioner "remote-exec" {
     inline = [
        "sudo yum update -y", 
        "sudo amazon-linux-extras install Httpd-apache -y",
        "sudo chkconfig apache  on",
        "sudo systemctl start apache ",
        "sudo systemctl enable apache "
   ] 
 }
} 