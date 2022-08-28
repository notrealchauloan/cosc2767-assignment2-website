# Install Java 11 following with y for allow/yes
sudo amazon-linux-extras install java-openjdk11 -y

# Go to opt
cd /opt

# Download binary distribution of Maven
wget https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz

# Extract the compressed file
tar -xvzf apache-maven-3.8.6-bin.tar.gz

# Rename folder
mv apache-maven-3.8.6 maven

cd ~

# Edit bash_profile file
sed -i '/programs/a \JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.13.0.8-1.amzn2.0.3.x86_64' .bash_profile
sed -i '/programs/a \M2=/opt/maven/bin' .bash_profile
sed -i '/programs/a \M2_HOME=/opt/maven' .bash_profile

# search file where there is 'PATH=' and append text at the end of that line
sed -i '/PATH=/ s/$/:$JAVA_HOME:$M2_HOME:$M2/' .bash_profile

cd ~

# Apply new changes to bash_profile
source ~/.bash_profile

## Install Jenkins
# Import Jenkins repo
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

# Install Jenkins
yum install jenkins -y

# Start Jenkins
service jenkins start

cat /var/lib/jenkins/secrets/initialAdminPassword