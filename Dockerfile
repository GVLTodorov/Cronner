FROM debian:stable-slim
MAINTAINER georgi.vladimirov.todorov@gmail.com

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends curl jq cron ca-certificates

VOLUME /etc/cronner

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
RUN "./entrypoint.sh"

COPY crontab /etc/cron.d/
RUN chmod +x /etc/cron.d/crontab
RUN crontab /etc/cron.d/crontab

RUN touch /var/log/cron.log

COPY start.sh /
RUN chmod +x /start.sh
CMD ["/start.sh"]
