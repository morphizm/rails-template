FROM nginx:stable-alpine

ARG NGINX_ENV

ADD .htpasswd /etc/nginx/.htpasswd
ADD nginx.conf /etc/nginx/nginx.conf
ADD conf.d /etc/nginx/conf.d
ADD scripts /app/scripts

RUN ["sh", "/app/scripts/replace_config_placeholders"]
