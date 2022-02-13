FROM ubuntu:latest

RUN echo "America/New_York" > /etc/timezone; \
    apt update && apt install  openssh-server sudo -y; \
    useradd -m -s /bin/bash -g root -G sudo -u 1000 ubuntu; \
    echo 'ubuntu:ubuntu' | chpasswd; \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers; \
    service ssh start

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
