from ubuntu:trusty

ENV SDKMAN_DIR /usr/local/sdkman
COPY ./scripts/sdkman-bootstrap ./sdkman-bootstrap
RUN ./sdkman-bootstrap

ARG JAVA_VER=8.0.172-zulu
ARG SCALA_VER=2.11.12
ARG GRADLE_VER=4.8.1
ARG MAVEN_VER=3.5.2

COPY ./scripts/sdkman-env ./sdkman-env
RUN ./sdkman-env
ENV PATH "$PATH:$SDKMAN_DIR/bin"
RUN chmod +x $SDKMAN_DIR/bin/*.sh

RUN useradd -c 'kafka builder' -m -d /home/kafkabldr -s /bin/bash kafkabldr
RUN usermod -aG sudo kafkabldr
RUN echo "if [ -e /build-artifacts ]; then sudo chown kafkabldr /build-artifacts; fi" >> /home/kafkabldr/.bashrc
USER kafkabldr
ENV HOME /home/kafkabldr
RUN mkdir -p /home/kafkabldr/.m2
ADD artifacts.tgz /

ARG MAVEN_OPTS=
ARG GRADLE_OPTS=
ARG PKG_KAFKA_VER=
ARG PKG_CONFLUENT_VER=
ARG AVRO_VER=1.8.2
ARG MAVEN_SKIP_TESTS=true

# install kafka from source
COPY ./scripts/kafka-install ./kafka-install
RUN ./kafka-install

COPY ./scripts/log4j.properties $HOME/log4j.properties
ENV MAVEN_OPTS "${MAVEN_OPTS} -Dlog4j.configuration=file:${HOME}/log4j.properties"

# install confluent-common from source
COPY ./scripts/common-install ./common-install
RUN ./common-install

# install confluent-restutils from source
COPY ./scripts/restutils-install ./restutils-install
RUN ./restutils-install

# install schema-registry from source
COPY ./scripts/schema-registry-install ./schema-registry-install
RUN ./schema-registry-install

# install kafka-rest from source
COPY ./scripts/kafka-rest-install ./kafka-rest-install
RUN ./kafka-rest-install

# install ksql from source
COPY ./scripts/ksql-install ./ksql-install
RUN ./ksql-install
