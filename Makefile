NAME = tobarsegais/tobar-segais
VERSION = 1.0
THIS_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

.PHONE: all build tag_latest

all: build tag_latest

build:
		docker build -t "$(NAME):$(VERSION)" --rm "$(THIS_DIR)"

tag_latest:
		docker tag "$(NAME):$(VERSION)" "$(NAME):latest"


