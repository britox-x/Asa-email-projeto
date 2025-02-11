FROM ubuntu:latest

# Atualiza e instala pacotes
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y postfix dovecot-core dovecot-imapd dovecot-pop3d mailutils telnet syslog-ng && \
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

# Ajusta permissões
RUN chown root:dovecot /etc/ssl/private/key.key && \
    chown root:dovecot /etc/ssl/certs/certificate.crt

# Cria usuários
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

CMD ["/usr/local/bin/start.sh"]

# Expondo as portas
EXPOSE 25 110 143 993 465 587