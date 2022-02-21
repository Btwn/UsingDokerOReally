## Comandos utiles

- Limpiar todos los contenedores
```bash
sudo docker stop $(sudo docker ps -aq)
sudo docker rm $(sudo docker ps -aq)
```

- evitar que se quede el usuario root
```Dockerfile
FROM python:3.9

#RUN echo todos los camandos

# ya al final antes del CMD
RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
USER uwsgi

CMD ["echo", "algo]
```