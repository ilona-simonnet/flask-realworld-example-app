FROM centos:8

ENV FLASK_DEBUG=1

RUN dnf update -y \
&& dnf install python3 \
&& pip install Flask
&& dnf install openssl

WORKDIR /app
COPY . /app

RUN python -m pip install -r requirements.txt

EXPOSE 8443

CMD python autoapp.py
