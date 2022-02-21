## Linquear entre contenedores

vincular entre contenedores es tan facil como poner un link

- por medio de docker

```bash
docker run -d --name dnmonster amouat/dnmonster:1.0
docker run -d -p 5000:5000 -e "ENV=DEV" --link dnmonster:dnmonster identidock
```

- o por medio de docker-composer

```yml
identidock:
  build: .
  ports:
   - "5000:5000"
  environment:
    ENV: DEV
  volumes:
   - ./app:/app
  links:
   - dnmonster

dnmonster:
  image: amouat/dnmonster:1.0
```

Y acceder a ese contenedor, es internamete asi
`http://dnmonster:8080/monster/`

```python
@app.route('/monster/<name>')
def get_identicon(name):
	r = requests.get('http://dnmonster:8080/monster/' + name + '?size=80')
	image = r.content
	return Response(image, mimetype='image/png')
```
