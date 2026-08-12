FROM          python:3-slim
RUN           useradd -m -d /app roboshop
WORKDIR       /app
USER          roboshop
COPY          payment.ini payment.py rabbitmq.py requirements.txt /app/
#RUN           pip3 install -r requirements.txt
RUN           apt-get update && \
              apt-get install -y --no-install-recommends \
                gcc \
                python3-dev \
                build-essential && \
              rm -rf /var/lib/apt/lists/*
RUN           pip3 install --no-cache-dir -r requirements.txt
ENTRYPOINT    ["/app/.local/bin/uwsgi", "--ini", "payment.ini"]


# Stage 1 - Builder
#FROM python:3 AS builder
#
#WORKDIR /app
#
#COPY requirements.txt .
#
#RUN pip install --no-cache-dir -r requirements.txt
#
#COPY payment.ini payment.py rabbitmq.py ./
#
## Stage 2 - Runtime
#FROM python:3-slim
#
#RUN useradd -m -d /app roboshop
#
#WORKDIR /app
#
#COPY --from=builder /app /app
#
#USER roboshop
#
#ENTRYPOINT ["/app/.local/bin/uwsgi", "--ini", "payment.ini"]