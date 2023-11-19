output "ec2_private_ip" {
  value = aws_instance.EC2_deploy.private_ip
}
output "ec2_public_ip" {
  value = aws_instance.EC2_deploy.associate_public_ip_address
}
output "iam_instance_profile" {
  value = aws_instance.EC2_deploy.iam_instance_profile
}
output "ec2_id" {
  value = aws_instance.EC2_deploy.id
}
output "availability_zone" {
  value = aws_instance.EC2_deploy.*.availability_zone
  description = "list of avaliablity zones of instances"
}