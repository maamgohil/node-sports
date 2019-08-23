# node-sports
https://docs.docker.com/install/linux/docker-ce/debian/


docker run -p 8080:8080 -p 50000:50000  -v /var/run/docker.sock:/var/run/docker.sock -v c:/users/maamg:/var/jenkins_home --name jenkins jenkins/jenkins



docker run -p 8080:8080 -p 50000:50000  -v /var/run/docker.sock:/var/run/docker.sock -v c:/users/maamg:/var/jenkins_home --name jenkins j/j


docker exec -it -u root jenkins /bin/bash


To list all local users you can use:

cut -d: -f1 /etc/passwd

docker stop 060061d6d054
docker rm 060061d6d054

docker build -t j/j .



docker container rm $(docker container ls -aq)