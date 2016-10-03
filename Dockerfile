############################################################
# Dockerfile to run appium for android devices
############################################################

FROM ubuntu:14.04
MAINTAINER Otoniel Isidoro

RUN apt-get update
RUN apt-get install -y wget

# install Android SDK dependencies
RUN apt-get install -y openjdk-7-jre-headless lib32z1 lib32ncurses5 lib32bz2-1.0 g++-multilib
    
# Main Android SDK
RUN wget -qO- "https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz" | tar -zxv -C /opt/
RUN echo y | /opt/android-sdk-linux/tools/android update sdk --all --filter tools,platform-tools,build-tools-23.0.1,android-23 --no-ui --force

ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH "$PATH:/opt/android-sdk-linux/tools:/opt/android-sdk-linux/platform-tools"

RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get -y install nodejs

RUN mkdir /opt/appium
RUN useradd -m -s /bin/bash appium
RUN chown -R appium:appium /opt/appium

USER appium
ENV HOME /home/appium

RUN cd /opt/appium && npm install appium
ENV PATH "$PATH:/opt/appium/node_modules/.bin/"

EXPOSE 4723
CMD appium
