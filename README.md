# PDS Component CI

Docker image for NodeJS app deployment that need a local MongoDB and Redis
instances.

## Version

* `7`, `latest` ([7/Dockerfile](https://github.com/networld-to/pds-component-ci/blob/master/7/Dockerfile)) - NodeJS version 7.x, MongoDB version 3.2.x, Redis Server 3.x
* `6` ([6/Dockerfile](https://github.com/networld-to/pds-component-ci/blob/master/6/Dockerfile)) - NodeJS version 6.x, MongoDB version 3.2.x, Redis Server 3.x

## Getting started

Starting MongoDB and Redis use the `start` script. For only Mongo,
respectively Redis,  use `start_mongo` or `start_redis`
