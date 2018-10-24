#!/usr/bin/make -f

build: clean
	@hugo

clean:
	@rm -rf public

server:
	@hugo server

publish: build
	# now we just copy the html files to another git repo and push
