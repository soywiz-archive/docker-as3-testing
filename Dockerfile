FROM debian:testing

MAINTAINER Carlos Ballesteros <soywiz@gmail.com>

# Installs unzip xvfb and wine
RUN dpkg --add-architecture i386
RUN apt-get update -y -q
RUN apt-get install -y -q unzip xvfb wine:i386
ENV DISPLAY :99

# Install Xvfb init script
ADD xvfb_init /etc/init.d/xvfb
RUN chmod a+x /etc/init.d/xvfb
ADD xvfb-daemon-run /usr/bin/xvfb-daemon-run
RUN chmod a+x /usr/bin/xvfb-daemon-run
