FROM tensorflow/tensorflow:latest-gpu

RUN apt update && apt -y upgrade && apt install -y git libgmp3-dev python3-pip libsndfile-dev
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1
RUN git clone --depth=1 https://github.com/angsuman/ludwig.git \
    && cd ludwig/ \
    && pip3 install sndfile \
    && pip3 install -r requirements.txt \
    && python3 -m spacy download en \
    && python3 setup.py install

WORKDIR /data

ENTRYPOINT ["ludwig"]
