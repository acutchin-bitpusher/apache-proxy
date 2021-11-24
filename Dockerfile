FROM ubuntu:latest

#RUN apt-get update
#RUN TZ="America/Los_Angeles" DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
#RUN apt-get install -y \
#  procps \
#  vim
#RUN apt-get -qq install -y apache2

RUN apt-get update && \
  TZ="America/Los_Angeles" DEBIAN_FRONTEND="noninteractive" apt-get -qq -y install \
  tzdata \
  apache2

RUN rm -f /etc/apache2/conf-enabled/* && \
  rm -f /etc/apache2/mods-enabled/* && \
  rm -f /etc/apache2/sites-enabled/* && \
  /usr/sbin/a2enmod proxy mpm_event authz_core && \
  mv /etc/apache2/apache2.conf /etc/apache2/apache2.conf.orig

COPY apache2.conf /etc/apache2/apache2.conf

##  DEBUGGING TOOLS - CAN BE DISABLED
RUN apt-get -qq -y install \
  procps \
  vim \
  curl \
  net-tools \
  telnet

CMD ["/bin/sleep", "7d"]
