#!/bin/sh

open http://$(docker-machine ip dev):4000

docker run --rm -v $PWD:/project -p 4000:4000 jekyll $@
