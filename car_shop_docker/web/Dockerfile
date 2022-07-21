FROM  alpine:latest as build
ARG QUICKSTART
WORKDIR /
COPY ./auto_quickstart/${QUICKSTART} .
RUN unzip -q ${QUICKSTART}

FROM prestashop/prestashop:1.7.8.6-apache
ARG GIT_REPO
ARG SOURCE_PATH
RUN rm -Rf /var/www/html && mkdir /var/www/html && chown www-data:www-data /var/www/html && chmod 777 /var/www/html \
	&& mkdir /home/prestashop/logs && chown www-data:www-data /home/prestashop/logs
COPY --chown=www-data:www-data --from=build /auto_store_home1_qs /home/prestashop/${GIT_REPO}/${SOURCE_PATH}
EXPOSE 80