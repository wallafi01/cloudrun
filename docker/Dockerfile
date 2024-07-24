# Use a imagem base do Ubuntu
FROM ubuntu:latest

# Atualize os pacotes e instale o Apache
RUN apt update && apt install -y apache2 apache2-utils && apt clean

# Copie o conteúdo do site para o diretório padrão do Apache
COPY ./site/ /var/www/html/

# Defina o ambiente PORT como uma variável de ambiente
# Se $PORT não estiver definido, use a porta 3000 como padrão
ENV PORT 3000

# Exponha a porta configurada
EXPOSE 80

# Comando de entrada para iniciar o Apache
CMD ["sh", "-c", "sed -i 's/Listen 80/Listen ${PORT}/' /etc/apache2/ports.conf && apache2ctl -D FOREGROUND"]
