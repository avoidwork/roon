FROM debian:bookworm-slim

RUN apt update && apt upgrade -y
RUN apt install -y wget curl htop ffmpeg bzip2 cifs-utils
RUN mkdir /music
WORKDIR /root
RUN wget https://download.roonlabs.net/builds/roonserver-installer-linuxx64.sh && chmod +x roonserver-installer-linuxx64.sh
RUN echo "Y" | ./roonserver-installer-linuxx64.sh || echo "done."

EXPOSE 55000/tcp
EXPOSE 9330-9339/tcp
EXPOSE 30000-30009/tcp
EXPOSE 9003/udp
#EXPOSE 32768-65535/udp

CMD ["/opt/RoonServer/start.sh"]
