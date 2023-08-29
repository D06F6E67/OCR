FROM python:3.9

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