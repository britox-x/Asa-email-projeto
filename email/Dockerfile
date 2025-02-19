FROM ubuntu:latest

# Instalação do Postfix e limpeza
RUN apt update -y && apt upgrade -y && \
    apt install -y postfix dovecot-core dovecot-imapd dovecot-pop3d openssl && \
    apt clean && rm -rf /var/lib/apt/lists/*


# Certifique-se de que os arquivos estão no diretório correto
COPY dovecot/10-auth.conf /etc/dovecot/conf.d/
COPY dovecot/10-mail.conf /etc/dovecot/conf.d/
COPY dovecot/10-ssl.conf /etc/dovecot/conf.d/
COPY dovecot/10-master.conf /etc/dovecot/conf.d/

COPY postfix/main.cf /etc/postfix/
COPY postfix/master.cf /etc/postfix/

EXPOSE  25 587 143 993

CMD ["sh", "-c", "service syslog-ng start ; service postfix start ; service dovecot start; tail -F /var/log/mail.log"]

