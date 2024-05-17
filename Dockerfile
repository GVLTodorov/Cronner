FROM debian:stable-slim
MAINTAINER georgi.vladimirov.todorov@gmail.com

ENV TZ=UTC

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends curl jq cron ca-certificates bc zip unzip

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
RUN ./entrypoint.sh

COPY crontab /etc/cron.d/
RUN chmod +x /etc/cron.d/crontab
RUN crontab /etc/cron.d/crontab

RUN touch /var/log/cron.log

VOLUME /etc/cronner

COPY start.sh /
RUN chmod +x /start.sh
CMD ["/start.sh"]
