FROM debian:latest


RUN apt update -y
RUN apt upgrade -y

RUN apt install postfix dovecot-imapd dovecot-pop3d telnet nano syslog-ng -y

COPY main.cf /etc/postfix
COPY master.cf /etc/postfix
COPY 10-auth.conf /etc/dovecot/conf.d
COPY 10-mail.conf /etc/dovecot/conf.d
COPY 10-master.conf /etc/dovecot/conf.d
COPY 10-ssl.conf /etc/dovecot/conf.d
COPY mailname /etc
COPY start.sh /etc/init.d

RUN chmod 755 /etc/init.d/start.sh

EXPOSE 25/tcp
EXPOSE 587/tcp
EXPOSE 110/tcp
EXPOSE 143/tcp

CMD ["sh", "-c", "/etc/init.d/start.sh ; service syslog-ng start ; service postfix start ; service dovecot start ; tail -F /var/log/mail.log"]