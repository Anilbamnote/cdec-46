resource "aws_security_group" "my_sg" {
    name = "allow-http-public"
    description = "allow HTTP Port"
    ingress {
        from_port        = 80
        to_port          = 80
        protocol         = "TCP"
        cidr_blocks      = ["0.0.0.0/0"]
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }
}

resource "aws_launch_template" "lt_home" {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name = var.key_pair
    vpc_security_group_ids = [aws_security_group.my_sg.id]
    user_data = filebase64("./home.sh")
}

resource "aws_launch_template" "lt_laptop" {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name = var.key_pair
    vpc_security_group_ids = [aws_security_group.my_sg.id]
    user_data = filebase64("./laptop.sh")
}

resource "aws_launch_template" "lt_mobile" {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name = var.key_pair
    vpc_security_group_ids = [aws_security_group.my_sg.id]
    user_data = filebase64("./mobile.sh")
}

# name
# launch configuration
# group size
# sclaing policy (condition (CloudWatch - Alarm), action)

resource "aws_autoscaling_group" "asg_home" {
  name                 = "asg-home"
  max_size             = 5
  min_size             = 2
  desired_capacity     = 2
  launch_template {
    id = aws_launch_template.lt_home.id
    version = aws_launch_template.lt_home.latest_version
  }
  vpc_zone_identifier  = [var.subnet_id_1, var.subnet_id_2]
  target_group_arns = [aws_lb_target_group.tg_home.arn]
}

resource "aws_autoscaling_policy" "asg_policy_home" {
  autoscaling_group_name = aws_autoscaling_group.asg_home.name
  name                   = "asg_policy_home"
  policy_type            = "PredictiveScaling"
  predictive_scaling_configuration {
    metric_specification {
      target_value = 50
      predefined_load_metric_specification {
        predefined_metric_type = "ASGTotalCPUUtilization"
      }
    }
  }
}

resource "aws_autoscaling_group" "asg_laptop" {
  name                 = "asg-laptop"
  max_size             = 5
  min_size             = 2
  desired_capacity     = 2
  launch_template {
    id = aws_launch_template.lt_laptop.id
    version = aws_launch_template.lt_laptop.latest_version
  }  
  vpc_zone_identifier  = [var.subnet_id_1, var.subnet_id_2]
  target_group_arns = [aws_lb_target_group.tg_laptop.arn]
}

resource "aws_autoscaling_policy" "asg_policy_laptop" {
  autoscaling_group_name = aws_autoscaling_group.asg_laptop.name
  name                   = "asg_policy_laptop"
  policy_type            = "PredictiveScaling"
  predictive_scaling_configuration {
    metric_specification {
      target_value = 50
      predefined_load_metric_specification {
        predefined_metric_type = "ASGTotalCPUUtilization"
      }
    }
  }
}

resource "aws_autoscaling_group" "asg_mobile" {
  name                 = "asg-mobile"
  max_size             = 5
  min_size             = 2
  desired_capacity     = 2
  launch_template {
    id = aws_launch_template.lt_mobile.id
    version = aws_launch_template.lt_mobile.latest_version
  }  
  vpc_zone_identifier  = [var.subnet_id_1, var.subnet_id_2]
  target_group_arns = [aws_lb_target_group.tg_mobile.arn]
}

resource "aws_autoscaling_policy" "asg_policy_mobile" {
  autoscaling_group_name = aws_autoscaling_group.asg_mobile.name
  name                   = "asg_policy_mobile"
  policy_type            = "PredictiveScaling"
  predictive_scaling_configuration {
    metric_specification {
      target_value = 50
      predefined_load_metric_specification {
        predefined_metric_type = "ASGTotalCPUUtilization"
      }
    }
  }
}