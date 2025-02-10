# Docker images

[![Docker Image CI](https://github.com/gonimar/docker/actions/workflows/docker-image.yml/badge.svg)](https://github.com/gonimar/docker/actions/workflows/docker-image.yml)
[![Docker publish](https://github.com/gonimar/docker/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/gonimar/docker/actions/workflows/docker-publish.yml)


## Cli
[//]: # (![Docker Image Size]&#40;https://img.shields.io/docker/image-size/gonimar/cli&#41;)


`docker run -it --rm -v $(pwd):/runtime gonimar/cli`

## semver

```sh
alias semver="docker run -ti --rm gonimar/semver"

semver -c -i minor 1.0.2
# 1.1.0

semver -c -i patch 1.1.0
# 1.1.1

semver -c -i minor $(git describe --tags --abbrev=0)
# 5.6.0
```
Makefile example

```makefile
RELEASE_TYPE ?= patch

CURRENT_VERSION := $(shell git ls-remote --tags | awk '{ print $$2}'| sort -nr | head -n1|sed 's/refs\/tags\///g')

ifndef CURRENT_VERSION
  CURRENT_VERSION := 0.0.0
endif

NEXT_VERSION := $(shell docker run --rm gonimar/semver semver -c -i $(RELEASE_TYPE) $(CURRENT_VERSION))

current-version:
	@echo $(CURRENT_VERSION)

next-version:
	@echo $(NEXT_VERSION)

release:
	git checkout master;
	git tag $(NEXT_VERSION)
	git push --tags
```

## PostgreSQL

```sh
alias psql="docker run -ti --rm gonimar/postgres"

psql -d <db-name> -U <username> -W
```
or using the variable $PSQL_CONNECTION_STRING

sample for reference:

```sh
$PSQL_CONNECTION_STRING=postgres://psqladmin:postgres@localhost:5432/postgres?sslmode=require

psql $PSQL_CONNECTION_STRING
```
or run sql script directly

```bash
psql $PSQL_CONNECTION_STRING -f script.sql
```


## PHP
