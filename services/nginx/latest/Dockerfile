FROM nginx:latest

# Instalar o pacote gettext, necessário para usar o comando envsubst,
# que permite substituir variáveis nos arquivos de configuração
RUN apt-get update && apt-get install -y --no-install-recommends gettext

# Apagar o diretório /var/www/html da imagem para evitar conflito com o volume
# montado na pasta /var/www, onde a aplicação será mapeada
RUN rm -rf /var/www/html

# Copiar o arquivo de configuração padrão (nginx.conf) para o diretório temporário /tmp
COPY nginx.conf /tmp/nginx.conf

# Definir o argumento CUSTOM_CONFIG_ENABLED para habilitar ou desabilitar o uso do custom.conf
ARG CUSTOM_CONFIG_ENABLED=false
# Tornar o argumento CUSTOM_CONFIG_ENABLED disponível como variável de ambiente no container,
# permitindo que o script de entrada (entrypoint.sh) utilize esse valor
ENV CUSTOM_CONFIG_ENABLED=$CUSTOM_CONFIG_ENABLED

# Copiar o script de entrada para dentro do container e garantir que ele tenha permissão de execução
COPY entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Definir o script de entrada a ser executado quando o container iniciar
ENTRYPOINT ["/docker-entrypoint.sh"]