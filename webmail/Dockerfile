# Use a imagem oficial do Nextcloud como base
FROM nextcloud

# Atualiza o gerenciador de pacotes e instala as ferramentas necessárias
RUN apt-get update && \
    apt-get install -y iputils-ping nano && \
    rm -rf /var/lib/apt/lists/*

# Exponha a porta 80 (opcional, se você pretende usar um servidor web embutido)
EXPOSE 80