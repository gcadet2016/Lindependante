FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y apache2 
RUN apt-get install -y php 
RUN apt-get install -y php-dev 
RUN apt-get install -y php-mysql 
RUN apt-get install -y libapache2-mod-php 
RUN apt-get install -y php-curl 
RUN apt-get install -y php-json 
RUN apt-get install -y php-common 
RUN apt-get install -y php-mbstring 
RUN apt-get install -y composer
RUN curl -s "https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh" | /bin/bash
RUN apt-get install -y software-properties-common
RUN apt-get install -y php 7.2-phalcon
COPY ./php.ini /etc/php/7.2/apache2/php.ini
COPY ./slc.conf /etc/apache2/sites-available/slc.conf
COPY ./apache2.conf /etc/apache2/apache2.conf
RUN rm -rfv /etc/apache2/sites-enabled/*.conf
RUN ln -s /etc/apache2/sites-available/slc.conf /etc/apache2/sites-enabled/slc.conf

CMD ["apachectl","-D","FOREGROUND"]
RUN a2enmod rewrite
EXPOSE 80
EXPOSE 443

RUN echo "All Done!"