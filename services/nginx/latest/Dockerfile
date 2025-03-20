FROM nginx:latest

# Instalar o gettext para usar o envsubst
RUN apt-get update && apt-get install -y --no-install-recommends gettext

# Copiar o arquivo de configuração como um template
COPY default.conf.template /etc/nginx/conf.d/default.conf.template

# Criar um script de entrada para substituir as variáveis
COPY entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Definir o script de entrada
ENTRYPOINT ["/docker-entrypoint.sh"]