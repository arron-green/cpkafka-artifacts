from ubuntu:trusty

ENV SDKMAN_DIR /usr/local/sdkman
COPY ./scripts/sdkman-bootstrap ./sdkman-bootstrap
RUN ./sdkman-bootstrap

ARG MAVEN_OPTS=
ARG GRADLE_OPTS=
ARG JAVA_VER=8.0.172-zulu
ARG SCALA_VER=2.11.8
ARG GROOVY_VER=2.4.12
ARG GRADLE_VER=4.5
ARG MAVEN_VER=3.5.2

COPY ./scripts/sdkman-env ./sdkman-env
RUN ./sdkman-env

RUN useradd -c 'kafka builder' -m -d /home/kafkabldr -s /bin/bash kafkabldr
RUN usermod -aG sudo kafkabldr
RUN echo "if [ -e /build-artifacts ]; then sudo chown kafkabldr /build-artifacts; fi" >> /home/kafkabldr/.bashrc
USER kafkabldr
# ENV HOME /home/kafkabldr

ARG PKG_CONFLUENT_VER=5.0.0-beta
ARG PKG_KAFKA_VER=5.0.0-beta
ARG AVRO_VER=1.8.2
ARG MAVEN_SKIP_TESTS=true

# install kafka from source
COPY ./scripts/kafka-install ./kafka-install
RUN ./kafka-install

# install confluent-common from source
COPY ./scripts/common-install ./common-install
RUN ./common-install

# install confluent-restutils from source
COPY ./scripts/restutils-install ./restutils-install
RUN ./restutils-install

# install schema-registry from source
COPY ./scripts/schema-registry-install ./schema-registry-install
RUN ./schema-registry-install

# install ksql from source
COPY ./scripts/ksql-install ./ksql-install
RUN ./ksql-install
