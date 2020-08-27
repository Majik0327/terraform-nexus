variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
	default = "us-east-1"
}

variable "PATH_TO_PRIVATE_KEY" {
	default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
	default = "mykey.pub"
}

variable "AMIs" {
	type = map(string)
	default = {
		# Ubuntu
		us-east-1 = "ami-0bcc094591f354be2"
	}
}

variable "INSTANCE_USERNAME" {
	default = "ubuntu"
}

variable "KEYPAIR_NAME" {
	default = "deployer-key"
}
