# roon
Roon core on Ubuntu 22.04 LTS

## Directories

Recommended to bind mount:

1. /var/run/RoonServer/Logs
1. /music

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
  -v /media/music:/music \
  --restart unless-stopped \
  avoidwork/roon:latest
```
