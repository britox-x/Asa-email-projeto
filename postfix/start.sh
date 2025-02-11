#!/bin/bash

# Inicia os serviços
service syslog-ng start
service postfix start
service dovecot start

# Mantém o contêiner ativo
tail -F /var/log/mail.log