#!/bin/bash

# Token de autenticação
TOKEN="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"

REPO_NAME=$1

# Fazer a requisição POST para a API do GitHub
curl -H "Authorization: token $TOKEN" \
     -H "Content-Type: application/json" \
     -d "{\"name\": \"$REPO_NAME\", \"private\": false}" \
     https://api.github.com/user/repos

echo "Repositório $REPO_NAME criado com sucesso!"

chmod +x create_repo.sh

#Uso
./create_repo.sh meu_novo_repositorio