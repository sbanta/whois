#!/bin/bash -ex

# Usage: run.sh filepath

if [ $# -eq 0 ]; then
  echo "Missing filename or filepath"
  exit 1
else
  filepath=$1
  export filepath
  docker build --no-cache=true -t whois-docker .
  docker cp $filepath 7a3db01a5762:/tmp/
  docker run whois-docker python whois.py /tmp/whois.py -i $filepath -o outputtest.csv
  docker cp 7a3db01a5762:/tmp/outfiletest.csv ~/Desktop/
fi
