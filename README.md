# StakerUI
This is the java web application that is the web UI of the staker device announced here: https://bitcointalk.org/index.php?topic=1028126.msg11118445#msg11118445

# Install

This is a java dynamic web project developed using eclipse and tomcat7. The application is deployed to a tomcat7 server that is installed on the device, and is the only software on the device that we have written.

To install a copy of this web application to another device, you can install the tomcat manager application to your tomcat installation and use the web based management console to list, deploy and undeploy applications in the tomcat server.

To deploy, you will need to check this source out into eclipse for Java EE dev's (you will need a tomcat7 local install in order to debug in eclipse). Right click on the project, choose to export a WAR file, and then you will use this war file to deploy to your tomcat instace where you want your web UI running from. 