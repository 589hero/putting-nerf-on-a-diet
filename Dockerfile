FROM nvidia/cuda:11.1.1-cudnn8-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install python3-pip && apt-get -y install libgl1-mesa-glx && apt-get install -y libglib2.0-0 libsm6 libxrender1 libxext6

WORKDIR /app

COPY . .

RUN pip install -r requirements_demo.txt

EXPOSE 8501

CMD ["streamlit", "run", "app.py"]