FROM ubuntu:22.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget curl htop ffmpeg bzip2 cifs-utils
RUN mkdir -p /music
WORKDIR /root
RUN wget https://download.roonlabs.net/builds/roonserver-installer-linuxx64.sh && chmod +x roonserver-installer-linuxx64.sh
RUN echo "Y" | ./roonserver-installer-linuxx64.sh

EXPOSE 55000/tcp
EXPOSE 9330-9339/tcp
EXPOSE 30000-30009/tcp
EXPOSE 9003/udp
#EXPOSE 32768-65535/udp #too many ports for some docker clients to administrate

CMD ["/opt/RoonServer/start.sh"]
