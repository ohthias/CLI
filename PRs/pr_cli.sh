#!/bin/bash

source github_config.sh

# URL base da API do GitHub

function list_prs() {
    echo "Listando Pull Requests..."
    curl -H "Authorization: token $TOKEN" \
         "$API_URL/repos/$REPO_OWNER/$REPO_NAME/pulls"
}

function create_pr() {
    if [ "$#" -ne 2 ]; then
        echo "Uso: $0 create_pr <branch_de_base> <branch_para_merge>"
        exit 1
    fi

    BASE_BRANCH=$1
    HEAD_BRANCH=$2

    echo "Criando Pull Request de $HEAD_BRANCH para $BASE_BRANCH..."

    curl -X POST -H "Authorization: token $TOKEN" \
         -H "Content-Type: application/json" \
         -d "{\"title\": \"Novo Pull Request de $HEAD_BRANCH para $BASE_BRANCH\", \"base\": \"$BASE_BRANCH\", \"head\": \"$HEAD_BRANCH\"}" \
         "$API_URL/repos/$REPO_OWNER/$REPO_NAME/pulls"
}

case $1 in
    list_prs)
        list_prs
        ;;
    create_pr)
        create_pr $2 $3
        ;;
    *)
        echo "Comando não reconhecido. Use 'list_prs' ou 'create_pr'."
        ;;
esac

chmod +x pr_cli.sh