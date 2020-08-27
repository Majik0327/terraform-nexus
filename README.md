# terraform-nexus

Original project structure from: https://geekdudes.wordpress.com/2018/01/09/install-packages-to-amazon-virtual-machine-using-terraform/

Running: You'll need to run "ssh-keygen -f mykey" in the base directory of this project. That keypair will then be used to create an AWS keypair that is used for commands like remote-exec, as well as SSH-ing in.

Fair warning: I have been unable to connect using AWS's built-in "Connect via SSH" tool. I can only connect using "ssh -i mykey ubuntu@IP_ADDRESS"

