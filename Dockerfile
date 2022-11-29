FROM ubuntu:20.04

WORKDIR /app

COPY requirements.txt requirements.txt
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip install flask==2.1.*
COPY . .

EXPOSE 9090
CMD [ "npm","run","start" ]
