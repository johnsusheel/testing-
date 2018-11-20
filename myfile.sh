#Apache Tomcat Installer Script
#Author : Shashank Srivastava
#set -x
echo "Logged into `hostname`. Installing here."
#Checking if installer tarballs are present or not. If they are not found, script will print error message & quit.
if [ -f /home/shashank/jdk-8u25-linux-x64.tar.gz ] && [ -f /home/shashank/apache-tomcat-8.0.15.tar.gz ]
then
echo "Unpacking Java installer tarball.......";
sleep 2s
#waiting for 2 seconds to show you what is being done.
sudo tar -xzvf /home/shashank/jdk-8u25-linux-x64.tar.gz;
echo ""
echo "Java tarball unpacked.";
echo ""
echo "Unpacking Tomcat installer tarball.......";
sleep 2s;
sudo tar -xzvf /home/shashank/apache-tomcat-8.0.15.tar.gz;
echo ""
echo "Tomcat tarball unpacked.";
echo ""
echo "Installing Java & Tomcat to /opt/app directory....";
sudo cp -rp /home/shashank/jdk1.8.0_25 /opt/app;
sudo cp -rp /home/shashank/apache-tomcat-8.0.15 /opt/app;
echo ""
echo "Exporting necessary variables......";
export JAVA_HOME=/opt/app/jdk1.8.0_25;
export PATH=$PATH:/opt/app/jdk1.8.0_25/bin:$PATH;
export CATALINA_HOME=/opt/app/apache-tomcat-8.0.15;
echo "Variables exported.";
echo ""
echo $JAVA_HOME;
echo ""
echo $PATH;
echo ""
echo $CATALINA_HOME;
sleep 2s;
echo ""
echo "Checking Java & Tomcat versions.";
echo ""
echo "Java is installed at `which java` Directory";
echo ""
java -version;
echo ""
java -cp $CATALINA_HOME/lib/catalina.jar org.apache.catalina.util.ServerInfo;
echo ""
echo "Starting Tomcat server"
echo ""
cd $CATALINA_HOME/bin
./startup.sh
echo "'
echo "Removing unpacked tarballs from PWD.";
sudo rm -rf /home/shashank/jdk1.8.0_25;
sudo rm -rf /home/shashank/apache-tomcat-8.0.15;
else
echo "Installer tarballs not found in /home/shashank. Please make sure they exist there. Exiting installation process now."
exit
fi
