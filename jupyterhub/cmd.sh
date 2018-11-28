docker pull jupyterhub/singleuser

yum install python36
yum install python36-devel python36-setuptools
easy_install-3.6 pip

certbot certonly --standalone --preferred-challenges http -d domain
