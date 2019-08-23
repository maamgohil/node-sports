FROM mcr.microsoft.com/dotnet/core/runtime:2.2

ARG jenkins_user_id
ARG jenkins_group_id

RUN apt-get update && \
apt-get install -y zip

RUN apt-get install sudo
RUN curl -sL https://deb.nodesource.com/setup_0.x | sudo -E bash - && \
apt-get install -y nodejs


RUN apt-get install && \
    apt-transport-https && \
    ca-certificates && \    
    gnupg2 && \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
apt-get update && \
apt-get install -y docker-ce

RUN apt-get install mono-complete

RUN apt-get install libcurl3

RUN wget https://github.com/GitTools/GitVersion/releases/download/v4.0.0-beta.12/GitVersion_4.0.0-beta0012.zip

RUN unzip GitVersion_4.0.0-beta0012.zip -d GitVersion

RUN groupadd -g ${jenkins_group_id} jenkins && \
useradd jenkins -u ${jenkins_user_id} -g jenkins --shell /bin/bash --create-home && \
echo "jenkins ALL=(ALL) NOPASSWD:/usr/bin/npm" > /etc/sudoers.d/jenkins && \
chmod +x /etc/sudoers.d/jenkins && \
echo "jenkins:jenkins" | chpasswd && adduser jenkins sudo

USER jenkins
