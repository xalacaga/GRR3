# GRR3
## GRR : Gestion des Reservations et Ressources 
## Official site

[GRR](https://grr.devome.com/fr/grr3)

## First
Create Persistance

mkdir -P /opt/persistance/grr/html

mkdir -P /opt/persistance/grr/mysql
 
## Second
Configure your mysql.env

exemple:
```
MYSQL_ROOT_PASSWORD=rootpassword
MYSQL_DATABASE=grrdb
MYSQL_USER=xav
MYSQL_PASSWORD=grrpassword
```
## Final
Start your docker compose 

sudo docker-compose up -d

## Start
Log to your GRR

http://localhost 
Configure your bdd

To find bbd ip type : docker inspect mysql | grep IPAddress

That's all

Enjoy.

