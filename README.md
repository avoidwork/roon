# roon
Roon Server on Ubuntu 22.04 LTS

Don't re-pull the image when Roon releases a new version; it will upgrade within the container.

## Extract Server Directories

Do this before setting a mount at `/var/roon/RoonServer`!

1. Create a volume or bind mount at `/var/roon/RoonServer1`
1. Create a shell inside the container, run `docker exec -it $CONTAINER_NAME /bin/bash`
1. Run `apt install -y rsync && cd /var/roon && rsync -avu RoonServer/ RoonServer1`
1. Run `exit` to exit the shell; your volume or bind mount will now have the server files
1. Amend volume or bind mount to be `/var/roon/RoonServer` & re-deploy 

## Recommended Mounts

1. `/music`
1. `/var/roon/RoonServer`

## Ports

| Type | Range |
|---|---|
| TCP | 9330-9339 |
| TCP | 30000-30009 |
| TCP | 55000 |
| UDP | 9003 |

## Usage

### Compose

```yaml
version: "3.8"
services:
  roon:
    image: avoidwork/roon:latest
    container_name: roon
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - roon:/var/roon/RoonServer
      - /media/music:/music
    ports:
      - 55000:55000/tcp
      - 9330-9339:9330-9339/tcp
      - 30000-30009:30000-30009/tcp
      - 9003:9003/udp
    restart: unless-stopped
```

### Command Line Interface

```console
docker run -d \
  --name=roon \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -p 55000:55000/tcp \
  -p 9330-9339:9330-9339/tcp \
  -p 30000-30009:30000-30009/tcp \
  -p 9003:9003/udp \
  -v roon:/var/roon/RoonServer \
  -v /media/music:/music \
  --restart unless-stopped \
  avoidwork/roon:latest
```

## Github

https://github.com/avoidwork/roon
