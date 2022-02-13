FROM ubuntu:latest

RUN echo "America/New_York" > /etc/timezone; \
    apt update && apt install -y vim iputils-ping openssh-client python3 python3-pip; \
    pip3 install ansible

CMD ["/bin/bash"]