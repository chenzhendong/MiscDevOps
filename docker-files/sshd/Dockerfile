FROM ubuntu:latest

RUN apt update && apt install  openssh-server sudo -y
RUN useradd -m -s /bin/bash -g root -G sudo -u 1000 ubuntu 
RUN  echo 'ubuntu:ubuntu' | chpasswd
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN service ssh start

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
