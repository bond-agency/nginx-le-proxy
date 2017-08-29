# nginx-le-proxy

Nginx + Let's Encrypt proxy with predefined network and always up-to-date `nginx.tmpl` from https://raw.githubusercontent.com/jwilder/nginx-proxy/master/nginx.tmpl.

This setup is completely based on examples from these repos:
- https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion
- https://github.com/jwilder/nginx-proxy

## Usage

Start with
```bash
docker-compose up -d
```

Create some project which has been connected to the same network `nginx-proxy-network` and define the needed environment variables:

```yml
version: '3'
services:
  nginx:
    image: nginx
    expose:
      - 80
    environment:
      - VIRTUAL_HOST=exmaple.com
      - LETSENCRYPT_HOST=example.com
      - LETSENCRYPT_EMAIL=mail@example.com
networks:
  default:
    external:
      name: nginx-proxy-network
```
