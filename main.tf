resource "aws_instance" "demo-ec2" {
  ami               = var.tag_ec2_ami
  instance_type     = var.tag_ec2_instance_type
  availability_zone = var.tag_ec2_azs
  subnet_id         = var.tag_subnet1__id
  security_groups   = [var.tag_sg__id]
  tags = {
    "Name" = var.tag_ec2_instance_name
  }
  user_data = filebase64("${path.module}/websitefile.sh")
}

resource "aws_launch_template" "demo-launch-template" {
  name          = var.tag_lt_name
  image_id      = var.tag_ec2_ami
  instance_type = var.tag_ec2_instance_type

  monitoring {
    enabled = true
  }

  network_interfaces {
    security_groups             = [var.tag_sg__id]
    associate_public_ip_address = true
    subnet_id                   = var.tag_subnet1__id
  }
  user_data = filebase64("${path.module}/websitefile.sh")
}


resource "aws_autoscaling_group" "demo-asg" {
  name = var.tag_asg_name
  desired_capacity    = 1
  max_size            = 2
  min_size            = 1
  vpc_zone_identifier = [var.tag_subnet1__id]
  launch_template {
    id      = aws_launch_template.demo-launch-template.id
    version = aws_launch_template.demo-launch-template.latest_version
  }
}

resource "aws_autoscaling_attachment" "demo-asg-attachment" {
   lb_target_group_arn    = var.tag_lb__tg__id
   autoscaling_group_name = aws_autoscaling_group.demo-asg.id
  
}


