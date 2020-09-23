# docker build -f Dockerfile -t nojson/netstat:2009.22 .

FROM debian:latest

MAINTAINER "Jim Wang" <jim@fuzzyio.com>

RUN apt-get update \
    && apt-get install -y dnsutils fping nano \
    && apt autoclean -y \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/*


#RUN apt-get update \
#    && apt-get install -y cron \
#    && apt autoclean -y \
#    && apt autoremove -y \
#    && rm -rf /var/lib/apt/lists/*
#
#RUN service cron start

WORKDIR /usr/local/lib/netstat/

ADD *.sh /usr/local/lib/netstat/

CMD ["tail", "-f", "/dev/null"]

# Base Start
# docker run -d --name netstat nojson/netstat:latest
