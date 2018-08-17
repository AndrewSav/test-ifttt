#!/bin/bash

# run this on the docker host where you are setting up vault/goldfish
# point vault.domain.tld and goldfish.domain.tld to this machine

set -e

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
SETTINGS="$SCRIPTPATH/settings.sh"

if [ ! -f $SETTINGS ]; then
  echo "Please copy settings.sh.template to settings.sh first and edit it according to your requirements"
  exit 1
fi

source $SETTINGS

echo "Email: $EMAIL"
echo "Static: $STATIC"
echo "Webhook: $WEBHOOK"

sed "s/mail@domain.tld/$EMAIL/g" traefik/traefik.toml.template > traefik/traefik.toml
sed "s/static.domain.tld/$STATIC/g" traefik/traefik.toml > traefik/traefik.toml.tmp && mv traefik/traefik.toml.tmp traefik/traefik.toml
sed "s/webhook.domain.tld/$WEBHOOK/g" traefik/traefik.toml > traefik/traefik.toml.tmp && mv traefik/traefik.toml.tmp traefik/traefik.toml
sed "s/static.domain.tld/$STATIC/g" docker-compose.yml.template > docker-compose.yml
sed "s/webhook.domain.tld/$WEBHOOK/g" docker-compose.yml > docker-compose.yml.tmp && mv docker-compose.yml.tmp docker-compose.yml

mkdir -p /mnt/traefik
mkdir -p /mnt/webhook
cp -r traefik/* /mnt/traefik/
cp -r webhook/* /mnt/webhook/
docker-compose up -d
