FROM nginx:1.11.4-alpine

ENV SYMFONY_ENV prod
ENV PROJECT_ENV prod

# Install tzdata and change to Europe/Paris
RUN  set -x && \
    apk --update add tzdata logrotate && \
    ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime && \
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

# Custom nginx configuration
ADD nginx/nginx.conf /etc/nginx/nginx.conf
ADD nginx/default.conf /etc/nginx/conf.d/default.conf

# Custom logrotate configuration for nginx
ADD logrotate/nginx /etc/logrotate.d/nginx
ADD logrotate/cron /etc/periodic/daily/logrotate-cron

# Custom entry point
ADD scripts/start.sh /root/start.sh

RUN chmod +x /root/start.sh \
  && chmod +x /etc/periodic/daily/logrotate-cron

WORKDIR /var/www/html
VOLUME ["/var/log/nginx"]
CMD ["/root/start.sh"]
