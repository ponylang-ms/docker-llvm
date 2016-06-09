FROM ubuntu:16.04

COPY build.sh /tmp/
RUN bash /tmp/build.sh 3.7.1 && rm /tmp/build.sh
