FROM debian:buster-slim

RUN apt-get update && apt-get install -y git python3 python3-yaml python3-flask python3-paho-mqtt python3-cryptography

WORKDIR /usr/app

RUN git clone https://github.com/tsagadar/koubachi-pyserver.git

EXPOSE 8005

ENV PYTHONPATH "${PYTHONPATH}:src"

WORKDIR /usr/app/koubachi-pyserver

CMD ["python3", "-m" ,"koubachi_pyserver.app", "--config", "/data/config.yml"]
