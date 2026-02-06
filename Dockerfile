FROM            python:3
RUN             useradd -m -d /app roboshop
USER            roboshop
WORKDIR         /app
COPY            payment.ini payment.py rabbitmq.py requirements.txt /app/
RUN             pip3 install -r requirements.txt
ENTRYPOINT      ["uwsgi", "--ini", "payment.ini"]
