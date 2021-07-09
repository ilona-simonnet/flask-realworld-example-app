FROM centos:8

ENV FLASK_DEBUG=1

RUN dnf update -y 
RUN dnf install python3 
RUN pip install Flask 

WORKDIR /app
COPY . /app

RUN python -m pip install -r requirements.txt

EXPOSE 8443

CMD python autoapp.py
