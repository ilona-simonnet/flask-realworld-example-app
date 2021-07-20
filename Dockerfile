FROM centos:8

ENV FLASK_DEBUG=1

RUN dnf update -y && dnf upgrade -y \
&& dnf install -y python3 \
&& dnf install -y libpq-devel \
&& dnf install -y python3-devel \
&& pip3 install psycopg2-binary 

WORKDIR /app
COPY . /app

COPY requirements.txt .

RUN pip3 install -r requirements.txt

EXPOSE 8443

CMD python3 autoapp.py
