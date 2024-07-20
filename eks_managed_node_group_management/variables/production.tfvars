# set environment
environment                    = "production"

# production variables
aws_launch_template_version    = "$Latest"
desired_size                   = 1
instance_types                 = ["t2.micro"]
max_size                       = 2
min_size                       = 1