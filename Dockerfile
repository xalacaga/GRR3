#On choisit une debian
FROM debian:stretch

MAINTAINER Xav "xavier.begue@gmail.com"

#Ne pas poser de question à l'installation
ENV DEBIAN_FRONTEND noninteractive

#Installation d'apache et de php5 avec extension
RUN apt-get update \
&& apt-get -y install \
apache2 \
php \
php-mysql \
php-ldap \
php-xmlrpc \
php-imap \
curl \
php-curl \
php-gd \
php-mbstring \
php-xml \
php-apcu-bc \
wget \
unzip

#Copie et execution du script pour l'installation et l'initialisation de GRR
COPY install-grr.sh /opt/
RUN chmod +x /opt/install-grr.sh
ENTRYPOINT ["/opt/install-grr.sh"]

#Exposition des ports
EXPOSE 80 443
