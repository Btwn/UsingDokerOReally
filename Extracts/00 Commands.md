## Comandos utiles

- Limpiar todos los contenedores
```bash
sudo docker stop $(sudo docker ps -aq)
sudo docker rm $(sudo docker ps -aq)
```