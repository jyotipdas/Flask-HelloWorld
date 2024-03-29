FROM python:2 

USER root
RUN $ECHO $USER

WORKDIR ~
COPY requirements.txt .

RUN pip install -r requirements.txt

COPY *.py ./
EXPOSE 80
ENTRYPOINT ['gunicorn', '-b 0.0.0.0:5000 wsgi:app'] 
