FROM ubuntu:latest
MAINTAINER georgi.vladimirov.todorov@gmail.com

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends curl jq cron

VOLUME /etc/periodic

RUN echo "Create Directories..." \
    && mkdir /etc/periodic \
    && mkdir /etc/periodic/1min \
    && mkdir /etc/periodic/15min \
    && mkdir /etc/periodic/30min \
    && mkdir /etc/periodic/hourly \
    && mkdir /etc/periodic/12hour \
    && mkdir /etc/periodic/daily \
    && mkdir /etc/periodic/weekly \
    && mkdir /etc/periodic/monthly

COPY crontab /etc/cron.d/
RUN chmod +x /etc/cron.d/crontab
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
CMD ["cron", "-f"]
