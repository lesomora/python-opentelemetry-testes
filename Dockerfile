FROM tiangolo/uwsgi-nginx-flask:python3.11

COPY ./requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

RUN pip install opentelemetry-distro opentelemetry-exporter-otlp 

RUN opentelemetry-bootstrap -a install

COPY ./app /app
COPY ./supervisord.conf /etc/supervisor/conf.d
COPY ./nginx.conf /etc/nginx
