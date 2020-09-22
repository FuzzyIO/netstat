# docker build -f Dockerfile -t nojson/netstat:latest .

FROM debian:latest

MAINTAINER "Jim Wang" <jim@fuzzy.io>

RUN apt-get update \
    && apt-get install -y dnsutils fping \
    && apt autoclean -y \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/lib/netstat/

ADD *.sh /usr/local/lib/netstat/

CMD ["tail", "-f", "/dev/null"]

# Base Start
# docker run -d --name netstat nojson/netstat:latest
