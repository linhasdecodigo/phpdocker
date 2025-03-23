FROM nginx:1.27-bookworm

# Instalar o pacote gettext, necessário para usar o comando envsubst,
# que permite substituir variáveis nos arquivos de configuração
RUN apt-get update && apt-get install -y --no-install-recommends gettext

# Apagar o diretório /var/www/html da imagem para evitar conflito com o volume
# montado na pasta /var/www, onde a aplicação será mapeada
RUN rm -rf /var/www/html

# Copiar o arquivo de configuração padrão (nginx.conf) para o diretório temporário /tmp
COPY nginx.conf /tmp/nginx.conf

# Copiar o script de entrada para dentro do container e garantir que ele tenha permissão de execução
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# DAQUI EM DIANTE FOI PEGO NA IMAGEM ORIGINAL
# Sobrescreve o ENTRYPOINT para rodar o script original primeiro, e depois o meu script
ENTRYPOINT ["/bin/bash", "-c", "/docker-entrypoint.sh && /entrypoint.sh"]

# Incluído no entrypoint.sh
# CMD ["nginx" "-g" "daemon off;"]