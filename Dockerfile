FROM mcr.microsoft.com/dotnet/core/runtime:2.2

ARG jenkins_user_id
ARG jenkins_group_id

RUN apt-get update && \
apt-get install -y zip

RUN apt-get install sudo
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - && \
apt-get install -y nodejs

RUN apt-get install -y mono-complete

RUN apt-get install -y libcurl3

RUN apt-get install -y wget  && \
  wget https://github.com/GitTools/GitVersion/releases/download/v4.0.0-beta.12/GitVersion_4.0.0-beta0012.zip

RUN unzip GitVersion_4.0.0-beta0012.zip -d GitVersion

USER jenkins
