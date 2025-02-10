# Docker files

## Cli
[![Docker Stars](https://img.shields.io/docker/stars/gonimar/cli.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/gonimar/cli.svg)]()
[![Docker Build Status](https://img.shields.io/docker/build/gonimar/cli.svg)]()
[![Docker Automated build](https://img.shields.io/docker/automated/gonimar/cli.svg)]()

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

## Angular 
[![Docker Stars](https://img.shields.io/docker/stars/gonimar/angular.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/gonimar/angular.svg)]()
[![Docker Build Status](https://img.shields.io/docker/build/gonimar/angular.svg)]()
[![Docker Automated build](https://img.shields.io/docker/automated/gonimar/angular.svg)]()

`docker run -it --rm -p 4200:4200 -p 49152:49152 -v $(pwd):/usr/src/app/ gonimar/angular`

## Ionic framework
[![Docker Stars](https://img.shields.io/docker/stars/gonimar/ionic-framework.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/gonimar/ionic-framework.svg)]()
[![Docker Build Status](https://img.shields.io/docker/build/gonimar/ionic-framework.svg)]()
[![Docker Automated build](https://img.shields.io/docker/automated/gonimar/ionic-framework.svg)]()

`docker run -it --rm -v $(pwd):/myApp gonimar/ionic-framework ionic start new-app sidemenu`


## PHP
[![Docker Stars](https://img.shields.io/docker/stars/gonimar/php.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/gonimar/php.svg)]()
[![Docker Build Status](https://img.shields.io/docker/build/gonimar/php.svg)]()
[![Docker Automated build](https://img.shields.io/docker/automated/gonimar/php.svg)]()
