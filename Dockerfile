FROM ubuntu:latest
MAINTAINER georgi.vladimirov.todorov@gmail.com

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends curl jq cron

VOLUME /etc/periodic

COPY crontab /etc/cron.d/
RUN chmod +x /etc/cron.d/crontab
RUN crontab /etc/cron.d/crontab

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
