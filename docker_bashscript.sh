# Install docker
yum install docker -y

# Start docker
service docker start

# Pull tomcat image from Docker Hub
docker pull tomcat

cd ~

# Add new dockeradmin user:
useradd dockeradmin

# Add a password for this dockeradmin user:
passwd dockeradmin

# Add that new dockeradmin user to docker group:
usermod -aG docker dockeradmin

# Enable EC2 server to allow users to login with the password
# Comment out the line
sed -i '/PasswordAuthentication/a \-->' /etc/ssh/sshd_config
sed -i '/PasswordAuthentication/i \<!--' /etc/ssh/sshd_config
# Then append new line
sed -i '/PermitEmptyPasswords/a \PasswordAuthentication yes' /etc/ssh/sshd_config

# Restart the ssh service for our change to take effective:
service sshd reload
