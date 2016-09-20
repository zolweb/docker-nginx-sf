FROM nginx:1.11.4-alpine

ENV SYMFONY_ENV prod
ENV PROJECT_ENV prod

# Install tzdata and change to Europe/Paris
RUN  set -x && \
    apk --update add tzdata logrotate && \
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


COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/default.conf /etc/nginx/conf.d/default.conf
ADD conf/logrotate /etc/logrotate.d/nginx
ADD conf/logrotate-cron /etc/periodic/daily/logrotate-cron
RUN chmod +x /etc/periodic/daily/logrotate-cron

# Sources
WORKDIR /var/www/html

VOLUME ["/var/log/nginx"]

COPY scripts/start.sh /root/start.sh
RUN chmod +x /root/start.sh

CMD ["/root/start.sh"]
