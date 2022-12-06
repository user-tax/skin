#!/usr/bin/env bash

DIR=$(dirname $(realpath "$0"))
cd $DIR
set -ex

watchexec --shell=none \
  -w ./skin \
  -r --exts styl -- ./build.coffee

