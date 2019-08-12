FROM python:3.7

# set user root
USER root

# Parameters for key, secret key, region, output
ARG key=none
ARG secret_key=none
ARG region=none
ARG output=none

# install awscli
RUN python -m pip install pip --upgrade
RUN pip install awscli --user --no-warn-script-location
RUN echo "export PATH=$PATH:/root/.local/bin" >> /root/.bashrc
RUN mkdir -p /root/.aws

# create credential file
RUN echo "[default]" > /root/.aws/credentials
RUN echo "aws_access_key_id = ${key}" >> /root/.aws/credentials
RUN echo "aws_secret_access_key =${secret_key}  " >> /root/.aws/credentials

# create config file
RUN echo "[default]" > /root/.aws/config
RUN echo "region = ${region}" >> /root/.aws/config
RUN echo "output = ${output}" >> /root/.aws/config

# create and connect volumn with host directory
RUN mkdir -p /root/src
VOLUME /root/src

# set cwd to connected dir
WORKDIR /root/src
#
