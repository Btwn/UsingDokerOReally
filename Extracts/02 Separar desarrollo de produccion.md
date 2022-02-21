## Separar desarrollo de produccion

Para que el entorno de prduccion no tenga herramientas de desarrollo como el debuger, per que la imagen sea la misma en ambos entornos se cra un bash para tal proposito 
`cmd.sh`

```sh
#!/bin/bash
set -e

if [ "$ENV" = 'DEV' ]; then
  echo "Running Development Server"
  exec python "identidock.py"
else
  echo "Running Production Server"
  exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/identidock.py --callable app --stats 0.0.0.0:9191
fi
```

En el archivo Dockerfile se añade el archivo cmd

```Dockerfile
CMD ["/cmd.sh"]
```

Y al correr el contenedor se especifica el entorno

```bash
chmod +x cmd.sh
docker run -e "ENV=DEV" -p 5000:5000 identidock
```
