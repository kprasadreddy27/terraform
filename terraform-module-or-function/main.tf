resource "aws_instance" "create_instance" {
  ami           = data.aws_ami.joindevops.id
  instance_type = var.instance_type
  vpc_security_group_ids = var.sg_ids
  
  tags = merge(
    var.ec2_tags,
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-${var.component}"
    }
  )
}
