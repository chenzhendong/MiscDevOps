FROM centos:latest

RUN yum -y update; \
 yum --enablerepo=updates clean metadata; \
 yum -y install java-1.8.0-openjdk-devel git tar svn sudo wget nc unzip openssh-server openssh-clients lsof net-tools; \
 yum -y update; \
 yum clean all 

ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk PATH=${JAVA_HOME}/bin:${PATH} MAVEN_VERSION=3.3.3 MAVEN_HOME=/usr/share/maven PATH=${MAVEN_HOME}/bin:${PATH} TZ=America/New_York
RUN curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
 
## create user and setup sudoers
RUN useradd -m -G root,wheel zchen; echo "zchen:changeit" | chpasswd; mkdir -p /home/zchen/.ssh; \
mkdir -p /home/zchen/.m2; \
touch /home/zchen/.ssh/authorized_keys; \
chown -R zchen /home/zchen; chmod 600 /home/zchen/.ssh/authorized_keys; \
chmod 700 /home/zchen/.ssh; \
echo "America/New_York" > /etc/timezone; \
/usr/bin/ssh-keygen -A

COPY ./settings.xml /home/zchen/.m2/
USER zchen
CMD ["/usr/sbin/sshd"]
CMD ["/bin/bash"]
