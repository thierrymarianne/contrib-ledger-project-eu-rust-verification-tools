SHELL:=/bin/bash

.PHONY: help build

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build:
	unset LLVM11 && export INKWELL_BRANCH=_llvm-12 LLVM12=yes DOCKER_IMAGE_PREFIX="safepkt/" && docker/build

