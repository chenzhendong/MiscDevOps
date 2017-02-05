sudo docker run -p 587:587 -e maildomain=mail.example.com -e smtp_user=user:pwd -v /path/to/certs:/etc/postfix/certs --name postfix -d catatnight/postfix
