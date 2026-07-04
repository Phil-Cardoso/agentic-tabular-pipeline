#!/bin/bash

# Garante que o script execute na pasta onde ele está localizado
cd "$(dirname "$0")"

echo "Verificando rede Docker 'MESTRADO'..."

if ! docker network inspect MESTRADO >/dev/null 2>&1; then
    echo "Rede 'MESTRADO' não encontrada. Criando..."
    docker network create MESTRADO
else
    echo "Rede 'MESTRADO' já existe."
fi

echo "Criando diretórios do Airflow..."
mkdir -p dags logs plugins config

echo "Construindo a imagem do Airflow..."
docker compose build

echo "Iniciando os containers..."
docker compose up -d

echo ""
echo "======================================"
echo "Airflow iniciado com sucesso!"
echo "Acesse: http://localhost:8080"
echo "======================================"