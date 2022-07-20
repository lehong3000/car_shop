FROM prestashop/prestashop:1.7.8.6-apache
RUN echo starting.. \
	&& mkdir /home/logs && chown www-data:www-data /home/logs \
	&& rm -Rf /var/www/html && mkdir /var/www/html && chown www-data:www-data /var/www/html && chmod 777 /var/www/html \
	&& apt-get update && apt-get install git -y