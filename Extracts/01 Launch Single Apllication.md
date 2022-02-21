## lanzar una aplicacion sencilla con Docker

Puede ser en cualquier lenguaje, pero en el libro se uso python

Crear un archivo en la ruta `app/identidock.py`

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
	return 'Hello World!\n'

if __name__ == '__main__':
	app.run(debug=True, host='0.0.0.0')
```

Luego crear un archivo `Dockerfile`

```Dockerfile
FROM python:3.9

RUN pip install Flask
WORKDIR /app
COPY app /app

CMD ["python", "identidock.py"]
```

para correr el contenedor se corren los sigueintes comandos

```bash
sudo docker build -t identidock .

sudo docker run -d -p 5000:5000 identidock

curl localhost:5000
```

se tiro un curl solo para comprobar que este corriendo, como resultado
`Hello World!`

