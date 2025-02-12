FROM ubuntu:latest

# Atualiza e instala pacotes
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y postfix dovecot-core dovecot-imapd dovecot-pop3d mailutils telnet syslog-ng nano && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copia arquivos de configuração
COPY main.cf /etc/postfix/
COPY master.cf /etc/postfix/
COPY dovecot.conf /etc/dovecot/
COPY 10-auth.conf /etc/dovecot/conf.d/
COPY 10-mail.conf /etc/dovecot/conf.d/
COPY 10-master.conf /etc/dovecot/conf.d/
COPY certificate.crt /etc/ssl/certs/certificate.crt
COPY key.key /etc/ssl/private/key.key
COPY mailname /etc/
COPY mail.sh /etc/init.d/

# Ajusta permissões
RUN chown root:dovecot /etc/ssl/private/key.key && \
    chown root:dovecot /etc/ssl/certs/certificate.crt && \
    chmod 755 /etc/init.d/mail.sh

# Cria usuários
RUN useradd -m matheus && \
    useradd -m raissa && \
    useradd -m brito && \
    useradd -m davi && \
    echo "matheus:senha123" | chpasswd && \
    echo "raissa:senha456" | chpasswd && \
    echo "brito:senha789" | chpasswd && \
    echo "davi:senha101" | chpasswd

# Script de inicialização
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Expondo as portas
EXPOSE 25 110 143 465 587

# Comando para iniciar os serviços
CMD ["sh", "-c", "/etc/init.d/mail.sh ; service syslog-ng start ; service postfix start ; service dovecot start ; tail -F /var/log/mail.log"]