data "template_file" "user_data" {
    template = file("${path.root}/userdata/nexus.tpl")
}

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
	
	user_data = base64encode(data.template_file.user_data.template)
	
#	provisioner "file" {
#		source = "./script.sh"
#		destination = "/tmp/script.sh"
#	}
#	
#	provisioner "remote-exec" {
#		inline = [
#			"chmod +x /tmp/script.sh",
#			"sudo /tmp/script.sh"
#		]
#	}
#	provisioner "remote-exec" {
#		script = "./script.sh"
#	}
#	connection {
#		
#		host = self.public_ip
#		type = "ssh"
#		user = var.INSTANCE_USERNAME
#		private_key = file("${var.PATH_TO_PRIVATE_KEY}")
#		
#	}
}

