resource "aws_instance" "gd_example" {
	ami = lookup(var.AMIs, var.AWS_REGION)
	instance_type = "t2.small"

	# the VPC subnet
	subnet_id = aws_subnet.main-public-1.id

	# the security group
	vpc_security_group_ids = ["${aws_security_group.allow-ssh-8081.id}"]

	# the publish SSH key
	# key_name = aws_key_pair.mykeypair.key_name
	key_name = var.KEYPAIR_NAME
	
	provisioner "file" {
		source = "./script.sh"
		destination = "/tmp/script.sh"
	}
	
	provisioner "remote-exec" {
		inline = [
			"chmod +x /tmp/script.sh",
			"sudo /tmp/script.sh",
			"/home/ubuntu/nexus/bin/nexus start"
		]
	}
	connection {
		
		host = self.public_ip
		type = "ssh"
		user = var.INSTANCE_USERNAME
		private_key = file("${var.PATH_TO_PRIVATE_KEY}")
		
	}
}

