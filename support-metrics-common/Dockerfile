from arrongreen/cpkafka-artifacts-common:latest

ARG SDKMAN_DIR=/usr/local/sdkman
ARG PKG_NAME=
ARG PKG_VER=
ARG AVRO_VER=
ARG KAFKA_VER=
ARG MAVEN_SKIP_TESTS=
ARG MAVEN_OPTS=

USER root
ADD ${PKG_NAME}.tgz .
RUN chown -R kafkabldr:kafkabldr /home/kafkabldr

USER kafkabldr

# install  from source
COPY ./install ./support-metrics-common-install
RUN ./support-metrics-common-install
