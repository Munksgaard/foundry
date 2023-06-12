.PHONY: build run load

DOCKER ?= docker

run: build
	$(DOCKER) run --rm -p 30000:30000 foundry:latest

build:
	$(DOCKER) build . --tag foundry

load: foundryvtt.tar.gz
	$(DOCKER) load < $<

foundryvtt.tar.gz: build Dockerfile
	$(DOCKER) save foundry:latest | gzip > $@
