# nginx-le-proxy

Nginx + Let's Encrypt proxy with predefined network and always up-to-date `nginx.tmpl` from https://raw.githubusercontent.com/jwilder/nginx-proxy/master/nginx.tmpl.

This setup is completely based on examples from these repos:
- https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion
- https://github.com/jwilder/nginx-proxy

## Usage

Create the required external network

```
docker network create nginx-proxy-network
```

Start the proxy with

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

There is also more realistic setup for running this proxy in front of WordPress + MariaDB + Nginx setup. [Check it out!](https://github.com/bond-agency/docker-wpbp)
