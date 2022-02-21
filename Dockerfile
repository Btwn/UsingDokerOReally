FROM python:3.9

RUN pip install Flask
WORKDIR /app
COPY app /app

CMD ["python", "identidock.py"]
