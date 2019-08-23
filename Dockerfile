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

RUN wget https://github.com/GitTools/GitVersion/releases/download/v4.0.0-beta.12/GitVersion_4.0.0-beta0012.zip

RUN unzip GitVersion_4.0.0-beta0012.zip -d GitVersion

RUN groupadd -g ${jenkins_group_id} jenkins && \
useradd jenkins -u ${jenkins_user_id} -g jenkins --shell /bin/bash --create-home && \
echo "jenkins ALL=(ALL) NOPASSWD:/usr/bin/npm" > /etc/sudoers.d/jenkins && \
chmod +x /etc/sudoers.d/jenkins && \
echo "jenkins:jenkins" | chpasswd && adduser jenkins sudo

USER jenkins
