
FROM ubuntu:latest

RUN apt update && apt install -y apache2 apache2-utils && apt clean

COPY . /var/www/html/


ENV PORT 3000


EXPOSE 80

# Comando de entrada para iniciar o Apache
CMD ["sh", "-c", "sed -i 's/Listen 80/Listen ${PORT}/' /etc/apache2/ports.conf && apache2ctl -D FOREGROUND"]
