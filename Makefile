#!/usr/bin/make -f

build: clean
	hugo

clean:
	@rm -rf public

server:
	hugo server
