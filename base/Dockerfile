FROM debian:stretch-slim

ARG JAVA_VER=8.0.172-zulu
ARG SCALA_VER=2.11.12
ARG GRADLE_VER=4.8.1
ARG MAVEN_VER=3.5.2

ENV SDKMAN_DIR /usr/local/sdkman
ENV PATH "$PATH:$SDKMAN_DIR/bin"

COPY ./scripts/sdkman-bootstrap /sdkman-bootstrap
RUN ./sdkman-bootstrap \
    && chmod +x $SDKMAN_DIR/bin/*.sh \
    && useradd -c 'kafka builder' -m -d /home/kafkabldr -s /bin/bash kafkabldr \
    && usermod -aG sudo kafkabldr \
    && mkdir -p /home/kafkabldr/.m2 /home/kafkabldr/.gradle \
    && chmod -R +w /home/kafkabldr \
    && chown -R kafkabldr:kafkabldr /home/kafkabldr

USER kafkabldr
WORKDIR /home/kafkabldr
ADD --chown=kafkabldr:kafkabldr ./scripts/log4j.properties .
