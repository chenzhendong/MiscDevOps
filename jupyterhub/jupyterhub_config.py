from oauthenticator.google import GoogleOAuthenticator

c.JupyterHub.ip = '0.0.0.0'
c.JupyterHub.port = 443

c.Application.log_level = 'INFO'

c.JupyterHub.authenticator_class = GoogleOAuthenticator
c.GoogleOAuthenticator.hosted_domain = 'mcpsmd.net'
c.GoogleOAuthenticator.login_service = 'MCPS'

c.JupyterHub.spawner_class = 'dockerspawner.DockerSpawner'

c.JupyterHub.ssl_key = '/etc/letsencrypt/live/python.capamc.org/privkey.pem'
c.JupyterHub.ssl_cert = '/etc/letsencrypt/live/python.capamc.org/fullchain.pem'

#import netifaces
#docker0 = netifaces.ifaddresses('docker0')
#docker0_ipv4 = docker0[netifaces.AF_INET][0]
#c.JupyterHub.hub_ip = docker0_ipv4['addr']

from jupyter_client.localinterfaces import public_ips
c.JupyterHub.hub_ip = public_ips()[0]
