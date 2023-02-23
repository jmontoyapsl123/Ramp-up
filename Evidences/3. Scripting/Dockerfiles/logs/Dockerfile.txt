FROM python:3.6
WORKDIR /usr/src/app
COPY requirements.txt ./
ENV REDIS_CHANNEL=log_channel
ENV REDIS_HOST="redis"
ENV REDIS_PORT=6379
RUN	apt-get update 
RUN apt-get install -y python3-pip 
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
CMD [ "python3", "./main.py" ]