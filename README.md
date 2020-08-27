# terraform-nexus

Original project structure from: https://geekdudes.wordpress.com/2018/01/09/install-packages-to-amazon-virtual-machine-using-terraform/

Necessary to run this:
1. You'll need to run "ssh-keygen -f mykey" in the base directory of this project. That keypair will then be used to create an AWS keypair that is used for commands like remote-exec, as well as SSH-ing in.

2. If you don't have the AWS CLI set up, you'll need to put your credentials in terraform.tfvars and uncomment the 2nd and 3rd lines.

Warning: I have been unable to connect using AWS's built-in "Connect via SSH" tool. I can only connect using "ssh -i mykey ubuntu@IP_ADDRESS"

