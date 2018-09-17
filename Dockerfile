FROM debian:testing

MAINTAINER Gustavo Delgado V.1

#Instalar apache, php y librerias necesaria para laravel
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get install -y php php-mysql php-mcrypt php-curl php-gd php-mbstring php-xml && \
    apt-get install -y libapache2-mod-php

#Instalar utilizadades
RUN apt-get install -y curl && \
    apt-get install -y vim

#Habilitar modulo apache
RUN a2enmod rewrite

#Exponer apache puerto
EXPOSE 80

#Actualizar apache por defecto con configuracion adecuada 
ADD apache.conf /etc/apache2/sites-enable/000-default.conf

RUN service apache2 restart

CMD /usr/sbin/apache2ctl -D FOREGROUND
