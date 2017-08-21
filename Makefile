#!/usr/bin/make -f

build: clean
	@hugo

clean:
	@rm -rf public

server:
	@hugo server

publish: build
	aws s3 cp public/ s3://blog.jonathanoliver.com/ --recursive --profile personal
