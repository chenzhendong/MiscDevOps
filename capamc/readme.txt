docker run -d -v ~/apps:/apps --name keycloak --link mongodb:mongo -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin jboss/keycloak-mongo

sudo docker run -p 587:587 -e maildomain=mail.example.com -e smtp_user=user:pwd -v /path/to/certs:/etc/postfix/certs --name postfix -d catatnight/postfix

docker run -it -d --name c9 --link keycloak:keycloak -v ~/apps:/workspace/ kdelfour/cloud9-docker

docker run --name mongodb -d -v mongo-data:/data/db mongo
