FROM python:3.7

# set user root
USER root

# install awscli
RUN python -m pip install pip --upgrade
RUN pip install awscli --user
RUN echo "export PATH=$PATH:/root/.local/bin" >> /root/.bashrc

# create and connect volumn with host directory
RUN mkdir /root/src
VOLUME /root/src

# set cwd to connected dir
WORKDIR /root/src
#
