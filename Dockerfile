FROM ubuntu:latest

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends curl jq cron

RUN echo "Creating Directories..." \
    && mkdir /etc/periodic/1min \
    && mkdir /etc/periodic/15min \
    && mkdir /etc/periodic/30min \
    && mkdir /etc/periodic/hourly \
    && mkdir /etc/periodic/12hour \
    && mkdir /etc/periodic/daily \
    && mkdir /etc/periodic/weekly \
    && mkdir /etc/periodic/monthly

COPY crontab /etc/crontabs/root
COPY entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
