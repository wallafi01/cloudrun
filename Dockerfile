
# FROM ubuntu:latest
# RUN apt update && apt install -y apache2 apache2-utils && apt clean
# COPY . /var/www/html/
# ENV PORT 3000
# EXPOSE 80
# CMD ["sh", "-c", "sed -i 's/Listen 80/Listen ${PORT}/' /etc/apache2/ports.conf && apache2ctl -D FOREGROUND"]
FROM ubuntu:latest

# Atualiza os pacotes e instala o Apache2 e OpenSSL
RUN apt update && \
    apt install -y apache2 apache2-utils openssl && \
    apt clean

# Copia o conteúdo do diretório atual para /var/www/html
COPY . /var/www/html/

# Gera certificados SSL autoassinados (para produção, use certificados de uma CA)
RUN mkdir /etc/apache2/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/apache2/ssl/apache.key \
    -out /etc/apache2/ssl/apache.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Department/CN=localhost"

# Copia um arquivo de configuração do Apache com suporte SSL
COPY apache-ssl.conf /etc/apache2/sites-available/000-default.conf

# Define a porta de escuta no Apache para 3000
RUN sed -i 's/Listen 80/Listen 3000/' /etc/apache2/ports.conf
RUN sed -i 's/<VirtualHost \*:80>/<VirtualHost \*:3000>/' /etc/apache2/sites-available/000-default.conf

# Expõe a porta 3000 e 443 (HTTP e HTTPS)
EXPOSE 3000 443

# Comando para iniciar o Apache
CMD ["apache2ctl", "-D", "FOREGROUND"]
