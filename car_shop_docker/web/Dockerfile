FROM  alpine:latest as build
ARG QUICKSTART
WORKDIR /quickstart_source
COPY ./auto_quickstart/${QUICKSTART} .
RUN unzip -q ${QUICKSTART} && mv "$(ls | grep -Ev .+\\.zip$)" extract

FROM prestashop/prestashop:1.7.8.6-apache
RUN rm -Rf /var/www/html && mkdir /var/www/html && chown www-data:www-data /var/www/html && chmod 777 /var/www/html \
	&& mkdir -p /git_sources \
	&& apt-get update && apt-get install git -y
COPY --chown=www-data:www-data --chmod=755 --from=build /quickstart_source/extract /var/www/html
EXPOSE 80