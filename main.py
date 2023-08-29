import uvicorn
# import os
# pip install "paddleocr>=2.0.1" --upgrade PyMuPDF==1.21.1
# pip uninstall -y numpy
# pip install "Numpy==1.23.5"
from paddleocr import PaddleOCR
from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def orc(path):
    ocr = PaddleOCR(use_angle_cls=True, lang="ch")
    result = ocr.ocr(path, cls=False)
    result_list = []
    print(len(result))
    for line in result:
        result_list.append(line[1][0])
        print(line[1][0])
    return {"data": result_list}


if __name__ == '__main__':
    uvicorn.run(app=app, host="0.0.0.0", port=7001)
    # orc('https://download.ydstatic.com/ead/zhiyun/guanwang_cdn_2019/images/p-ocr/cookbook100K.jpg')
