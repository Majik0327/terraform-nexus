#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
	sleep 1
done

# Update apt to install Java (OpenJDK JRE)
sudo apt update
sudo apt install openjdk-8-jre -y

# download nexus
wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz

# extract nexus
tar -zxf latest-unix.tar.gz

# move nexus-* directory to nexus
mv nexus-* nexus

# Change the stuff to be owned by ubuntu user
sudo chown -R ubuntu ./nexus
sudo chown -R ubuntu ./sonatype-work

# start nexus
# ./nexus/bin/nexus start
