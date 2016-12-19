FROM centos:latest

ARG USER_NAME＝zchen

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
RUN useradd -m -G root,wheel ${USER_NAME}; echo "${USER_NAME}:changeit" | chpasswd; mkdir -p /home/${USER_NAME}/.ssh; \
mkdir -p /home/${USER_NAME}/.m2; \
touch /home/${USER_NAME}/.ssh/authorized_keys; \
chown -R ${USER_NAME} /home/${USER_NAME}; chmod 600 /home/${USER_NAME}/.ssh/authorized_keys; \
chmod 700 /home/${USER_NAME}/.ssh; \
echo "America/New_York" > /etc/timezone; \
/usr/bin/ssh-keygen -A

COPY ./settings.xml /home/${USER_NAME}/.m2/

CMD ["/usr/sbin/sshd"]
