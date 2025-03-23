#!/bin/sh

# Verificar se a variável PHP_CUSTOM_CONF_ENABLED está habilitada e se o arquivo custom.ini existe
if [ "$PHP_CUSTOM_CONF_ENABLED" = "true" ] && [ -f "/tmp/php-custom.ini" ]; then
    # Se a configuração personalizada estiver habilitada e o arquivo php-custom.ini existir, usá-lo
    # o nome zzzz-php-custom.ini (com o prefixo zzzz) garante que ele seja o último a ser carregado, sobrescrevendo
    # qualquer configuração feita em outros arquivos .ini, inclusive o zzz-php.ini padrão do projeto
    cp /tmp/php-custom.ini /usr/local/etc/php/conf.d/zzzz-php-custom.ini
fi

# COMANDO DE INICIALIZAÇÃO OBTIDO NA IMAGEM ORIGINAL
exec php-fpm
