FROM          python:3
RUN           useradd -m -d /app roboshop
WORKDIR       /app
USER          roboshop
COPY          payment.ini payment.py rabbitmq.py requirements.txt /app/
RUN           pip3 install -r requirements.txt
ENTRYPOINT    ["/app/.local/bin/uwsgi", "--ini", "payment.ini"]

#