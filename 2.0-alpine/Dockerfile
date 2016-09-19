FROM nginx:1.11.4-alpine

ENV SYMFONY_ENV prod
ENV PROJECT_ENV prod

# Install tzdata and change to Europe/Paris
RUN  set -x && \
    apk --update add tzdata && \
    ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime && \
    date && \
    rm -rf /var/cache/apk/*

# Install tools...
RUN set -x && \
    apk --update add \
      ca-certificates \
      curl \
      nano \
      wget \
      openssl \
      openssh-client \
      acl \
      bash \
      git \
    && rm -rf /var/cache/apk/*


# Nginx configuration
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Default site configuration
COPY conf/default.conf /etc/nginx/conf.d/default.conf

# Sources
WORKDIR /var/www/html

VOLUME ["/var/log/nginx"]

