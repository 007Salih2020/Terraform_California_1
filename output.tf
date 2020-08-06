output "instance_ip_addr" {
  value       = aws_instance.instance-pub.public_ip
  description = "public IP address for the public server instance"
}
