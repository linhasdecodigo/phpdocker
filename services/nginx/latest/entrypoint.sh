#!/bin/sh

# Verificar se a variável CUSTOM_CONFIG_ENABLED está habilitada e se o arquivo custom.conf existe
if [ "$CUSTOM_CONFIG_ENABLED" = "true" ] && [ -f "/tmp/custom.conf" ]; then
    # Se a configuração personalizada estiver habilitada e o arquivo custom.conf existir, usá-lo
    envsubst '$PUBLIC_PATH' < "/tmp/custom.conf" > "/etc/nginx/conf.d/default.conf"
else
    # Caso contrário, utilizar a configuração padrão (nginx.conf)
    envsubst '$PUBLIC_PATH' < "/tmp/nginx.conf" > "/etc/nginx/conf.d/default.conf"
fi

# Iniciar o Nginx em primeiro plano, mantendo o container em execução
exec nginx -g "daemon off;"
