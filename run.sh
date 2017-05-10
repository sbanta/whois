#!/bin/bash -ex

# Usage: run.sh filepath

if [ $# -eq 0 ]; then
  echo "Missing filename or filepath"
  exit 1
else
  filepath=$1
  export filepath
  docker build --no-cache=true -t whois-docker .
  docker cp $filepath whois:/tmp/
  docker run -name whois whois-docker python whois.py /tmp/whois.py -i "/tmp/"$filepath -o outputtest.csv
  docker cp whois:/tmp/outfiletest.csv ~/Desktop/
fi
