FROM ubuntu:latest

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends curl jq cron

RUN echo "Create Directories..." \
    && mkdir /etc/periodic \
    && mkdir /etc/cron.1min \
    && mkdir /etc/cron.15min \
    && mkdir /etc/cron.30min \
    && mkdir /etc/cron.hourly \
    && mkdir /etc/cron.12hour \
    && mkdir /etc/cron.daily \
    && mkdir /etc/cron.weekly \
    && mkdir /etc/cron.monthly

COPY crontab /etc/cron.d/
RUN crontab /etc/cron.d/crontab
CMD ["cron", "-f"]
