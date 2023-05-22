FROM nginx:stable
WORKDIR /etc/nginx/
COPY ./nginx/templates/nginx.conf.template ./templates/
COPY "./nginx/ssl/server.pem" "/etc/nginx/ssl/"
COPY "./nginx/ssl/server-key.pem" "/etc/nginx/ssl/"
COPY "./nginx/ssl/client.pem" "/etc/nginx/ssl/"
COPY "./nginx/ssl/client-key.pem" "/etc/nginx/ssl/"
EXPOSE 80 443