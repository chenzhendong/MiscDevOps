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
RUN useradd -m camelot; echo "camelot:changeit" | chpasswd; mkdir -p /home/camelot/.ssh; \
mkdir -p /home/camelot/.m2; \
touch /home/camelot/.ssh/authorized_keys; \
chown -R camelot /home/camelot; chmod 600 /home/camelot/.ssh/authorized_keys; \
chmod 700 /home/camelot/.ssh; \
echo "camelot    ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/camelot; \
echo "America/New_York" > /etc/timezone; \
/usr/bin/ssh-keygen -A

ADD ./settings.xml /home/camelot/.m2/

CMD ["/usr/sbin/sshd", "&&" ,"/bin/bash"]
