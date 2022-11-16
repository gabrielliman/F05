FROM nvcr.io/nvidia/pytorch:21.05-py3
MAINTAINER Matheus Pereira <matheuspereira@dcc.ufmg.br>

# Install linux packages
RUN apt update && apt install -y zip

# Install python dependencies
RUN python -m pip install --upgrade pip

RUN pip install --no-cache --upgrade tensorboard Cython onnx gsutil matplotlib \
    opencv-python pillow scipy torch torchvision tqdm \
    scikit-learn numpy utils scikit-image
RUN pip install pytesseract
RUN export DEBIAN_FRONTEND=noninteractive && apt-get -yq install tesseract-ocr-por
RUN pip install pdfplumber==0.5.28 pdf2image nltk 
RUN apt-get install -y npm
RUN npm install difflib
RUN pip install bs4 lxml
RUN apt-get install -y poppler-utils
RUN pip install dateparser
RUN apt-get install -y tmux
RUN pip install fastapi
RUN pip install "uvicorn[standard]"
RUN pip install python-multipart

RUN wget https://github.com/MPMG-DCC-UFMG/F05/archive/refs/heads/master.zip && unzip master.zip
