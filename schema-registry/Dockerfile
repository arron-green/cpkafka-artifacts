from arrongreen/cpkafka-artifacts-restutils:latest

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
COPY ./install ./schema-registry-install
RUN ./schema-registry-install
