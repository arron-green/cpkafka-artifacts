# Kafka Schema-Registry artifact builder

This was created due to the annoying and complicated steps that it takes to
build confluent kafka and it's dependencies from source

## Why do this?
Currently kafka 1.0 and schema-registry Confluent Platform 4.0.0 does not have support for SASL
authentication.  This is coming soon and i needed an automated way of building
the project from source.

The snapshot artifacts produced by this build will allow you to use SASL based
authentication to connect to the avro schema-registry.  This will be required
if you're using the schema-registry provided by confluent-cloud

If you're reading this i hope this project addresses
some of the frustrations i had when trying to perform this task.

However, this project will be outdated and no longer needed by the time
kafka 1.1 and CP 4.1 are finally released.  Until then enjoy this automation :)

## Infrastructure as code
This project uses docker along with [sdkman](http://sdkman.io) to help
bootstrap the required dependencies to consistly build from source

## How to build

```bash
./build
```

####Profit!

```bash
ls -la build-artifacts/
 .
 ..
 common-package-4.1.x.tgz
 m2-artifact-repo.tgz
 package-schema-registry
 pkg-kafka-serde-tools-4.1.x.tgz
 pkg-schema-registry-4.1.x.tgz
 rest-utils-package-4.1.x.tgz
```
