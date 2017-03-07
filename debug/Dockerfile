FROM ubuntu:16.04
RUN apt-get update -qq
RUN apt-get -y install curl vim redis-tools wget

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -

RUN apt-get update -qq
RUN apt-get -y install nodejs

COPY 1_go_to_slash_data .

EXPOSE 8080
COPY server.js .
CMD node server.js
