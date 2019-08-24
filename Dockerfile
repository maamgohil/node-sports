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

RUN apt-get install -y libssl-dev

RUN apt-get install -y wget  && \
  wget https://github.com/GitTools/GitVersion/releases/download/v4.0.0-beta.12/GitVersion_4.0.0-beta0012.zip

RUN wget https://github.com/libgit2/libgit2/archive/v0.28.2.tar.gz && \
tar xzf v0.28.2.tar.gz && \
cd libgit2-0.28.2/ && \
cmake . && \
make && \
sudo make install

RUN unzip GitVersion_4.0.0-beta0012.zip -d GitVersion

RUN curl -LJO https://github.com/github/hub/releases/download/v2.12.3/hub-linux-amd64-2.12.3.tgz && \
tar -xvf *.tgz -C . && mv hub-linux-amd64*/bin/* /usr/local/bin

USER jenkins
