# Confluent Kafka artifact builder

[![Build Status](https://travis-ci.org/arron-green/cpkafka-schema-registry-artifact-bldr.svg?branch=master)](https://travis-ci.org/arron-green/cpkafka-schema-registry-artifact-bldr)

This was created due to the complicated and time consuming steps that it takes to
build confluent kafka and it's related artifacts from source

# Targeted Artifacts

| Artifact      | Tag/Branch    |
| ------------- | ------------- |
| kafka            | 2.0           |
| confluent-common | 5.0.x  |
| rest-utils  | 5.0.x  |
| schema-registry  | 5.0.x  |
| kafka-rest  | 5.0.x  |
| ksql  | 5.0.x  |

# nightly builds

check [releases](https://github.com/arron-green/cpkafka-artifacts/releases) for nightly pre-built artifacts

## Building locally

```bash
./build

# get some coffee
ls build-artifacts/*.tgz
```
