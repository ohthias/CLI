#!/bin/bash

# Token de autenticação
TOKEN="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"

# Nome do usuário e do repositório a ser deletado
OWNER=$1
REPO_NAME=$2

# Fazer a requisição DELETE para a API do GitHub
curl -X DELETE -H "Authorization: token $TOKEN" \
     https://api.github.com/repos/$OWNER/$REPO_NAME

echo "Repositório $REPO_NAME deletado com sucesso!"

chmod +x delete_repo.sh

#Uso
./delete_repo.sh usuario meu_repositorio
