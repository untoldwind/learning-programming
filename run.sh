#!/bin/sh

docker run --rm -v $PWD:/project -p 4000:4000 jekyll $@
