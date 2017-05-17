FROM alpine:3.5
LABEL maintainer "prajnamort@gmail.com"

# apk
RUN apk add --no-cache \
    gcc \
    libc-dev \
    postgresql-dev \
    python3 \
    python3-dev \
    nginx \
    supervisor

# nginx
RUN rm /etc/nginx/conf.d/default.conf
RUN mkdir /run/nginx
