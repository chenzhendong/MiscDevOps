#!/bin/bash

export OAUTH_CLIENT_ID=
export OAUTH_CLIENT_SECRET=
export OAUTH_CALLBACK_URL=https://python.capamc.org/hub/oauth_callback

jupyterhub -f /root/jupyterhub/jupyterhub_config.py
