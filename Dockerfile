FROM ubuntu:16.04

COPY build.sh /tmp/
RUN bash /tmp/build.sh 3.8.0 && rm /tmp/build.sh
