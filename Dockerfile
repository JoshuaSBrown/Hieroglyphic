# Container image that runs your code
FROM phusion/baseimage:focal-1.2.0

RUN apt-get clean
RUN apt-get update
RUN apt-get install software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get install python3.9 python3.9-distutils -y
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.9 get-pip.py

RUN useradd -ms /bin/bash hieroglyphic
USER hieroglyphic
WORKDIR /home/hieroglyphic

COPY --chown=hieroglyphic:hieroglyphic requirements.txt requirements.txt
COPY --chown=hieroglyphic:hieroglyphic VERSION VERSION
ENV PATH=${PATH}:${WORKDIR}/.local/bin
RUN python3.9 -m pip install -r requirements.txt --user
# Install sphinx, doxygen
# Copies your code file from your action repository to the filesystem path `/` of the container

# Code file to execute when the docker container starts up (`entrypoint.sh`)
#ENTRYPOINT ["/entrypoint.sh"]
