FROM centos:7
MAINTAINER iYapiH
RUN yum -y update && yum -y install java-1.8.0-openjdk git wget
RUN mkdir /buildtools &&\
			chmod 777 /buildtools
WORKDIR /buildtools
RUN wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
RUN java -jar BuildTools.jar

RUN mkdir /server &&\
			chmod 777 /server &&\
			cp /buildtools/spigot-1.11.2.jar /server/

WORKDIR /server

RUN java -Xms1024M -Xmx1024M -jar spigot-1.11.2.jar &&\
			sed -i "s/false/true/g" eula.txt

ADD ./plugins/* /server/plugins/

CMD ["java", "-Xms1024M", "-Xmx1024M", "-jar", "spigot-1.11.2.jar"]
