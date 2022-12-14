FROM python

COPY . /app
WORKDIR /app
RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN pip install -r requirements.txt
EXPOSE $PORT 
CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app
