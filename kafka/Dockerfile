from arrongreen/cpkafka-artifacts-base:latest

ARG SDKMAN_DIR=/usr/local/sdkman
ARG PKG_NAME=
ARG PKG_VER=
ARG SCALA_VER=
ARG GRADLE_OPTS=

USER root
ADD ${PKG_NAME}.tgz .
RUN chown -R kafkabldr:kafkabldr /home/kafkabldr

USER kafkabldr

# install kafka from source
COPY ./install ./kafka-install
RUN ./kafka-install
