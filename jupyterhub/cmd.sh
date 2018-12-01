docker pull jupyterhub/singleuser

yum install python36
yum install python36-devel python36-setuptools
easy_install-3.6 pip

certbot certonly --standalone --preferred-challenges http -d domain

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

nvm ls-remote  --lts
nvm install v10.14.1
npm install -g configurable-http-proxy

docker pull jupyterhub/singleuser:0.9
