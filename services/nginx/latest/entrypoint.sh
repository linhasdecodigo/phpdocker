#!/bin/sh
# Substitui a variável de ambiente PUBLIC_PATH no arquivo de configuração do Nginx
envsubst '$PUBLIC_PATH' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

# Inicia o Nginx
exec nginx -g "daemon off;"