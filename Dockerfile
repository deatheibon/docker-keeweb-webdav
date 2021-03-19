FROM viossat/keeweb:latest

RUN apk add --no-cache \
	apache2-utils \
	lighttpd-mod_auth \
	lighttpd-mod_webdav
RUN mkdir -p /etc/lighttpd/certs

COPY lighttpd.pem /etc/lighttpd/certs
COPY 20-webdav.sh $START_PATH
COPY 20-webdav.conf $CONF_PATH
