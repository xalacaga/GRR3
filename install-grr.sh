#!/bin/bash
SRC_WEB="https://site.devome.com/fr/grr/telechargement/category/3-versions-patch?download=17:grr-3-3-0a"
DEPOT=/opt/grr_src
DEST_GRR=/var/www/html/grr
VERSION=GRR330a
#Installation des sources GRR
mkdir /var/www/html/grr
if [ -f /var/www/html/grr/${VERSION} ]
then 
	echo "GRR is already installed"
else
touch /var/www/html/grr/${VERSION}
mkdir /opt/grr_src
cd /opt/grr_src
wget -P ${DEPOT} ${SRC_WEB}
unzip *
cp -r ${VERSION}/GRR/* ${DEST_GRR}
cd /opt
rm -Rf ${DEPOT}
chown -R www-data:www-data ${DEST_GRR}
fi
#Configuration du VHOST
echo -e "<VirtualHost *:80>\n\tDocumentRoot /var/www/html/grr\n\n\t<Directory /var/www/html/grr>\n\t\tAllowOverride All\n\t\tOrder Allow,Deny\n\t\tAllow from all\n\t</Directory>\n\n\tErrorLog /var/log/apache2/error-grr.log\n\tLogLevel warn\n\tCustomLog /var/log/apache2/access-grr.log combined\n</VirtualHost>" > /etc/apache2/sites-available/000-default.conf

#Activation Rewrite
a2enmod rewrite && service apache2 restart && service apache2 stop

#Apache Start
/usr/sbin/apache2ctl -D FOREGROUND
