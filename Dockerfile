FROM centos:latest
MAINTAINER Chukin Anton <admin@kusumpharm.com>

RUN yum -y install openssh-server
RUN useradd -mUs /bin/bash -p '$1$T3/ljogY$I/L6AID71acz3avYaxGYc/' chukin
ADD sshd /etc/pam.d/sshd

RUN yum -y install sudo
ADD sudo /etc/sudoers.d/chukin
RUN chown root. /etc/sudoers.d/chukin

VOLUME ["/home"]

EXPOSE 22

ADD start.sh /start.sh

CMD ["/start.sh"]