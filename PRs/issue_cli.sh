#!/bin/bash

source github_config.sh

API_URL="https://api.github.com"

function list_issues() {
    echo "Listando Issues..."
    curl -H "Authorization: token $TOKEN" \
         "$API_URL/repos/$REPO_OWNER/$REPO_NAME/issues"
}

function create_issue() {
    if [ "$#" -ne 2 ]; then
        echo "Uso: $0 create_issue <título> <descrição>"
        exit 1
    fi

    TITLE=$1
    DESCRIPTION=$2

    echo "Criando Issue: $TITLE..."

    curl -X POST -H "Authorization: token $TOKEN" \
         -H "Content-Type: application/json" \
         -d "{\"title\": \"$TITLE\", \"body\": \"$DESCRIPTION\"}" \
         "$API_URL/repos/$REPO_OWNER/$REPO_NAME/issues"
}

case $1 in
    list_issues)
        list_issues
        ;;
    create_issue)
        create_issue "$2" "$3"
        ;;
    *)
        echo "Comando não reconhecido. Use 'list_issues' ou 'create_issue'."
        ;;
esac

chmod +x issue_cli.sh