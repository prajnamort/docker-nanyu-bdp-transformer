FROM alpine:3.5
LABEL maintainer "prajnamort@gmail.com"

# python3, pip3
RUN apk add --no-cache python3

# psycopg2 (pip3)
RUN apk add --no-cache postgresql-dev \
    && apk add --no-cache --virtual psycopg2-build-deps gcc libc-dev python3-dev \
    && pip3 install psycopg2==2.7.1 \
    && apk del psycopg2-build-deps

# nginx
RUN apk add --no-cache nginx \
    && rm /etc/nginx/conf.d/default.conf \
    && mkdir /run/nginx

# supervisor
RUN apk add --no-cache supervisor \
    && mkdir -p /var/log/supervisor
