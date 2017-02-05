docker run -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin --name keycloak -d -p 9990:9990 -p 8080:8080 jboss/keycloak
sudo docker run -p 587:587 -e maildomain=mail.example.com -e smtp_user=user:pwd -v /path/to/certs:/etc/postfix/certs --name postfix -d catatnight/postfix
