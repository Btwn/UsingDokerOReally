FROM python:3.9

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask uWSGI
WORKDIR /app
COPY app /app

EXPOSE 9090 9191
USER uwsgi

CMD ["/cmd.sh"]
