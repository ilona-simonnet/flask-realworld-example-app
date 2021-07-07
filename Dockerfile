FROM centos:8

ENV FLASK_DEBUG=1

RUN dnf update -y \
&& dnf install python3 \
&& pip install Flask

WORKDIR /app
COPY . /app

RUN pip install -r requirements.txt

EXPOSE 8443

CMD ["./autoapp.py"]
