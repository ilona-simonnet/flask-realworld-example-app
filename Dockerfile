FROM centos:8

ENV FLASK_DEBUG=1

RUN dnf update -y 
RUN dnf upgrade -y
RUN dnf install -y python3-pip
#RUN pip install Flask 
RUN pip --version
RUN pip3 --version

WORKDIR /app
COPY . /app

COPY requirements.txt .


RUN pip install -r requirements.txt

EXPOSE 8443

CMD python autoapp.py
