FROM debian:bookworm

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y dovecot-core dovecot-imapd dovecot-pop3d openssl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Certifique-se de que os arquivos estão no diretório correto
COPY dovecot/10-auth.conf /etc/dovecot/conf.d/
COPY dovecot/10-mail.conf /etc/dovecot/conf.d/
COPY dovecot/10-ssl.conf /etc/dovecot/conf.d/
COPY postfix/main.cf /etc/postfix/
COPY postfix/master.cf /etc/postfix/
EXPOSE 143 993

CMD ["dovecot"]