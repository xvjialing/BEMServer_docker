FROM ubuntu:16.04
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends g++ make python3 python3-pip python3-dev python3-setuptools libxmlsec1-dev pkg-config wget git \
    && ln -s /usr/bin/pip3 /usr/bin/pip \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && python -m pip install --upgrade pip \
    && wget --no-check-certificate -O bemserver.tar.gz https://codeload.github.com/HIT2GAP-EU-PROJECT/bemserver/tar.gz/master \
    && tar zxvf bemserver.tar.gz \
    && rm bemserver.tar.gz \
    && cd bemserver-master \
    && pip install -r requirements.txt \
    && apt-get purge -y wget git \
    && apt-get clean -y \
    && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/*
