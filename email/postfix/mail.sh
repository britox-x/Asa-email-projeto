#!/bin/bash

# Adiciona o usuário 'matheus'
if ! id "matheus" &>/dev/null; then
    useradd -c 'matheus' -m -s /bin/false matheus
    echo "matheus:123456" | chpasswd
    echo "Usuário 'matheus' criado com sucesso."
else
    echo "Usuário 'matheus' já existe."
fi

# Adiciona o usuário 'sales'
if ! id "sales" &>/dev/null; then
    useradd -c 'sales' -m -s /bin/false sales
    echo "sales:123456" | chpasswd
    echo "Usuário 'sales' criado com sucesso."
else
    echo "Usuário 'sales' já existe."
fi