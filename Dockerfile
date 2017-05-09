FROM python:2.7

RUN mkdir /var/lib/build/
WORKDIR /var/lib/build/

RUN apt-get -u update && apt-get upgrade -y
RUN pip install ipwhois
RUN pip install pprint