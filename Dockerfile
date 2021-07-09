FROM centos:8

ENV FLASK_DEBUG=1

RUN dnf update -y 
RUN dnf upgrade -y
RUN sudo dnf install python3 
#RUN pip install Flask 

WORKDIR /app
COPY . /app

COPY requirements.txt .

#RUN python -m pip install -r requirements.txt
RUN pip install -r requirements.txt

EXPOSE 8443

CMD python autoapp.py
