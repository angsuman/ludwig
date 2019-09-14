FROM tensorflow/tensorflow:latest-gpu

RUN apt update && apt -y upgrade && apt install -y git libgmp3-dev python3-pip
RUN git clone --depth=1 https://github.com/uber/ludwig.git \
    && cd ludwig/ \
    && pip3 install -r requirements.txt \
    && python3 -m spacy download en \
    && python3 setup.py install

WORKDIR /data

ENTRYPOINT ["ludwig"]
