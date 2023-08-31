FROM python:3.9@sha256:c0dcc146710fed0a6d62cb55b92f00bfbfc3b931fff6218f4958bab58333c37b

WORKDIR /work
ADD main.py .
ADD requirements.txt .

# 安装支持
RUN /usr/local/bin/python -m pip install --upgrade pip \
    && apt-get update \
    && apt-get -y install libgl1 \
    && python -m pip install paddlepaddle==2.5.1 -i https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip3 install -r requirements.txt
CMD [ "python", "main.py" ]

EXPOSE 7001