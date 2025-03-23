#!/bin/sh

# Verificar se a variável NGINX_CUSTOM_CONF_ENABLED está habilitada e se o arquivo custom.conf existe
if [ "$NGINX_CUSTOM_CONF_ENABLED" = "true" ] && [ -f "/tmp/nginx-custom.conf" ]; then
    rm -f "/etc/nginx/conf.d/default.conf"

    # Se a configuração personalizada estiver habilitada e o arquivo custom.conf existir, usá-lo
    envsubst '$APP_PUBLIC' < "/tmp/nginx-custom.conf" > "/etc/nginx/conf.d/default.conf"
else
    if [ -f "/tmp/nginx.conf" ]; then
        rm -f "/etc/nginx/conf.d/default.conf"
        
        # Caso contrário, utilizar a configuração padrão (nginx.conf)
        envsubst '$APP_PUBLIC' < "/tmp/nginx.conf" > "/etc/nginx/conf.d/default.conf"
    fi
fi


# COMANDO DE INICIALIZAÇÃO OBTIDO NA IMAGEM ORIGINAL
exec nginx -g "daemon off;"
