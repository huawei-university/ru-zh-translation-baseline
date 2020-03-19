FROM ubuntu:18.04
RUN apt-get -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date=false update && \
    apt-get install -y --no-install-recommends python3-pip python3-setuptools git

RUN pip3 install --trusted-host files.pythonhosted.org \
    certifi \
    pyonmttok==1.18.3 \
    waitress \
    configargparse \
    tensorboard \
    pyyaml \
    flask \
    future \
    tqdm==4.30

RUN pip3 install --trusted-host files.pythonhosted.org \
    torch==1.4.0+cpu torchtext==0.4.0 -f https://download.pytorch.org/whl/torch_stable.html

WORKDIR /
RUN git clone https://github.com/OpenNMT/OpenNMT-py.git && cd OpenNMT-py 
WORKDIR /OpenNMT-py
RUN python3 setup.py install

WORKDIR /

COPY run.sh .
COPY OpenSubtitles.model* ./
COPY src.code .

ENTRYPOINT ["bash", "run.sh"] 
