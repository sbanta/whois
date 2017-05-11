FROM python:2.7

RUN mkdir /app

# Set the working directory to /app
WORKDIR /app

#RUN rm -rf /app

RUN git clone https://github.com/sbanta/whois.git /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

#RUN git pull
