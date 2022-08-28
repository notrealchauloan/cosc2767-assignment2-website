# Install Java 11 following with y for allow/yes
sudo amazon-linux-extras install java-openjdk11 -y

# Go to opt
cd /opt

# Install Tomcat
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.65.tar.gz

# Unzip tomcat zip folder
tar -xvzf apache-tomcat-9.0.65.tar.gz

# Change the folder name to be "tomcat"
mv apache-tomcat-9.0.65 tomcat

# comment line 21,22 in /opt/tomcat/webapps/host-manager AND manager/META-INF/context.xml
sed -i '/sameSiteCookies/a \<!--' /opt/tomcat/webapps/host-manager/META-INF/context.xml
sed -i '/sessionAttributeValueClassNameFilter/i \-->' /opt/tomcat/webapps/host-manager/META-INF/context.xml

sed -i '/sameSiteCookies/a \<!--' /opt/tomcat/webapps/manager/META-INF/context.xml
sed -i '/sessionAttributeValueClassNameFilter/i \-->' /opt/tomcat/webapps/manager/META-INF/context.xml

sed -i '/tomcat-users>/i \<role rolename="admin-gui"/>' /opt/tomcat/conf/tomcat-users.xml
sed -i '/tomcat-users>/i \<role rolename="manager-gui"/>' /opt/tomcat/conf/tomcat-users.xml
sed -i '/tomcat-users>/i \<role rolename="manager-script"/>' /opt/tomcat/conf/tomcat-users.xml
sed -i '/tomcat-users>/i \<role rolename="manager-jmx"/>' /opt/tomcat/conf/tomcat-users.xml
sed -i '/tomcat-users>/i \<role rolename="manager-status"/>' /opt/tomcat/conf/tomcat-users.xml
sed -i '/tomcat-users>/i \<user username="admin" password="s3cret" roles="admin-gui,manager-gui, manager-script, manager-jmx, manager-status"/>' /opt/tomcat/conf/tomcat-users.xml

# Create a symbolic link
ln -s /opt/tomcat/bin/startup.sh /usr/local/bin/tomcatup
ln -s /opt/tomcat/bin/shutdown.sh /usr/local/bin/tomcatdown

tomcatdown
tomcatup