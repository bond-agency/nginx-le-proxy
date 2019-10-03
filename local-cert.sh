#!/bin/bash


install_mkcert() {
  brew install mkcert
  brew install nss
  mkcert -install
}

create_cert() {
  local domain=$1
  mkcert $1
  mv "$domain.pem" "nginx/certs/$domain.crt"
  mv "$domain-key.pem" "nginx/certs/$domain.key"
  echo "Certificate and key created: $domain.crt $domain.key"
  docker-compose restart
}

install_mkcert
create_cert $1