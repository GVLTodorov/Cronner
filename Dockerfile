FROM alpine:latest
MAINTAINER georgi.vladimirov.todorov@gmail.com

RUN apk update && apk add curl jq ca-certificates

VOLUME /etc/periodic

COPY crontab /etc/cron.d/
RUN chmod +x /etc/cron.d/crontab
RUN crontab /etc/cron.d/crontab

RUN touch /var/log/cron.log

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
RUN "./entrypoint.sh"

COPY start.sh /
RUN chmod +x /start.sh
CMD ["/start.sh"]
