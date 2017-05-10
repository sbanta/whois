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
  docker run -it -d whois-docker /bin/bash
  alias dl='docker ps -l -q'
  docker start `dl`
  docker cp $filepath `dl`:/tmp/
  docker exec -it `dl` python whois.py /tmp/whois.py -i "/tmp/"$filepath -o outputtest.csv
  docker cp whois-docker:/tmp/outfiletest.csv ~/Desktop/
  docker stop `dl`
fi
