FROM nvidia/cuda:12.1.1-devel-ubuntu20.04

RUN apt-get update \
    && apt-get install -y git python3 curl vim \
    && cd /opt \
    && curl -O https://repo.anaconda.com/miniconda/Miniconda3-py38_23.1.0-1-Linux-x86_64.sh \
    && chmod +x Miniconda3-py38_23.1.0-1-Linux-x86_64.sh \
    && /opt/Miniconda3-py38_23.1.0-1-Linux-x86_64.sh -b -p /opt/miniconda3 \
    && rm -f  Miniconda3-py38_23.1.0-1-Linux-x86_64.sh  \
    && echo "export PATH=$PATH:/opt/miniconda3/bin" >> ~/.bashrc \
    && . ~/.bashrc \
    && conda create -y --name test python=3 numba numpy \
    && conda init bash 

COPY test.py /root
WORKDIR /root
# conda create --name test python=3 numba numpy
# conda init bash 
## quit shell and reenter
# conda activate test

CMD ["sleep", "infinity"]

