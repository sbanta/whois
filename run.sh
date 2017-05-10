#!/bin/bash -ex

# Usage: run.sh filepath

if [ $# -eq 0 ]; then
  echo "Missing filename or filepath"
  exit 1
else
  filepath=$1
  export filepath
  docker build -t whois-docker .
  #docker cp $filepath whois-docker:/tmp/
  #docker run --name image_name whois-docker python whois.py /tmp/whois.py -i "/tmp/"$filepath -o outputtest.csv
  #docker cp $filepath whois-docker:/tmp/
  #docker run -it whois-docker python whois.py /tmp/whois.py -i "/tmp/"$filepath -o outputtest.csv
  docker run --name testing -it -d whois-docker /bin/bash
  docker start testing
  docker cp $filepath testing:/tmp/
  docker testing ls /tmp/
  docker exec -it testing python whois.py /tmp/whois.py -i "/tmp/"$filepath -o outputtest.csv
  docker cp whois-docker:/tmp/outfiletest.csv ~/Desktop/
  docker stop testing
  docker rm testing
fi
