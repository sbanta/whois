#!/bin/bash -ex

# Usage: run.sh filepath

if [ "$1" == ""]; then
  echo "Missing filename or filepath"
else
  filepath = $1
  export filepath
  docker build --no-cache=true -t whois-docker .
  docker cp ~/Desktop/Jump_Prod.csv 7a3db01a5762:/tmp/
  docker run whois-docker python whois.py /tmp/whois.py
  docker cp 7a3db01a5762:/tmp/outfile.csv ~/Desktop/
