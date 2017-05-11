FROM python:2.7

RUN mkdir /tmp

# Set the working directory to /tmp
WORKDIR /app

#RUN rm -rf /tmp

RUN git clone https://github.com/sbanta/whois.git /tmp

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

#RUN git pull
