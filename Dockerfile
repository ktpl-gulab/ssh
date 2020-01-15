FROM ubuntu:16.04
RUN DEBIAN_FRONTEND=noninteractive
RUN apt-get update \ 
   && apt-get install -y openssh-server  \
   && mkdir /var/run/sshd \
   && echo 'root:gulab@123' | chpasswd \
   && sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config 
#CMD ["/usr/sbin/sshd", "-D"]
ENTRYPOINT service ssh start && /bin/bash
