resource "aws_security_group" "allow-ssh-8081" {
	vpc_id 		= aws_vpc.main.id
	name 		= "allow-ssh-8081"
	description 	= "security group that allows 8081 and 22 and all egress traffic"
	egress {
		from_port 	= 0
		to_port 	= 0
		protocol 	= "-1"
		cidr_blocks 	= ["0.0.0.0/0"]
	}
	ingress {
		from_port 	= 22
		to_port 	= 22
		protocol 	= "tcp"
		cidr_blocks 	= ["0.0.0.0/0"]
	}
	ingress {
		from_port 	= 8081
		to_port 	= 8081
		protocol 	= "tcp"
		cidr_blocks 	= ["0.0.0.0/0"]
	}

	tags = {
		Name = "allow-ssh-8081-tcp"
	}
}
