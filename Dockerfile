FROM docker.io/nginx:alpine
WORKDIR /app/site
ADD site .
COPY ./nginx.conf /etc/nginx/nginx.conf