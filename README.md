# GRR3
## GRR : Gestion des Reservations et Ressources 
## le site officiel
```sh
https://grr.devome.com/fr/grr3
```
## First
Create Persistance
mkdir -P /opt/persistance/grr/html
mkdir -P /opt/persistance/grr/mysql
 
## Second
Configure your mysql.env
exemple:

MYSQL_ROOT_PASSWORD=rootpassword
MYSQL_DATABASE=grrdb
MYSQL_USER=xav
MYSQL_PASSWORD=grrpassword

## Final
Start your docker compose
sudo docker-compose up -d

## first RUN
log to your GRR
http://localhost 
configure your bdd 
to find bbd ip type : docker inspect mysql | grep IPAddress

That's all
enjoy.

