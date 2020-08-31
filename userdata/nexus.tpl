#!/bin/bash

# update apt and install java
apt update
apt install openjdk-8-jre -y

# create a nexus directory inside /opt
cd /opt
mkdir nexus
cd nexus
wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz
tar -zxf latest-unix.tar.gz
rm latest-unix.tar.gz
mv nexus-* nexus
# adduser nexus --disabled-password
# chown -R nexus:nexus ./nexus
# chown -R nexus:nexus ./sonatype-work
# echo 'run_as_user="nexus"' > ./nexus/bin/nexus.rc
./nexus/bin/nexus start
