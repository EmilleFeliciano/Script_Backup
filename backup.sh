#!/bin/bash

#CONFIGURAÇÃO DO SCRIPT
ORIGEM="$HOME/Documentos" # Pasta de origem que será feita o backup
DESTINO="$HOME/backups"        # Pasta onde o backup será salvo
DATA=$(date +"%Y-%m-%d_%H-%M-%S") # Data e hora atual (formato seguro para nomes de arquivos)
ARQUIVO_BACKUP="backup_$DATA.tar.gz" # Nome do arquivo final compactado

# VERIFICA SE A PASTA DE ORIGEM EXISTE
if [ ! -d "$ORIGEM" ]; then
    echo "ERRO: A pasta de origem '$ORIGEM' não existe."
    exit 1
fi
# CRIA PASTA DE DESTINO SE NÃO EXISTIR
mkdir -p "$DESTINO"

#CRIA O BACKUP
tar -czf "$DESTINO/$ARQUIVO_BACKUP" -C "$ORIGEM" .

# MENSAGEM DE CONFIRMAÇÃO
echo "Backup criado com sucesso!"
echo "Arquivo salvo em: $DESTINO/$ARQUIVO_BACKUP"

