output "instance_ip_addr" {
    value = aws_instance.web.public_ip
  
}

output "instance_id" {
    value = aws_instance.web.id
  
}