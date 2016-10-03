
docker-appium-android
==============
Setup do appium-server para testes automatizados android usando devices reais

### PRÉ REQUISITOS

* docker

### BUILD
build this container by running:  

`docker build .`

### EXECUTE

docker run --privileged -v /dev/bus/usb:/dev/bus/usb -i -p 4723:4723 aluedeke/appium-android:latest  


Contém os seguintes pacotes:

ubuntu 14.04  
openjdk 7  
nodejs  
appium server  
android sdk  
