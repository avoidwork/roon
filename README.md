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
