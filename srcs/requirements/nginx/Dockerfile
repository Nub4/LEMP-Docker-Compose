FROM	debian:buster

COPY	./conf/default.conf /etc/nginx/conf.d/default.conf

RUN apt-get update && apt-get install -y \
 	nginx \
 	openssl

# SSL
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/nginx-selfsigned.crt \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-subj "/C=BE/ST=Brussels/L=Brussels/O=Ecole 19/OU=minummin/CN=minummin.42.fr"
RUN openssl rsa -noout -text -in /etc/ssl/private/nginx-selfsigned.key

CMD		["nginx", "-g", "daemon off;"]