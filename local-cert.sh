#!/bin/bash


install_mkcert() {
  brew install mkcert
  brew install nss
  mkcert -install
}

create_cert() {
  local domain=$1
  mkcert $1
  mv "$1.pem" "nginx/certs/$1.crt"
  mv "$1-key.pem" "nginx/certs/$1.key"
  echo "Certificate and key created: $1.crt $1.key"
  docker-compose restart
}

install_mkcert
create_cert $1