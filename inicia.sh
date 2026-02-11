#!/bin/bash

# Script para iniciar o servidor Evolution API localmente
# Autor: Evolution API Setup
# Data: 2026-02-02

set -e

echo "🚀 Iniciando Evolution API..."
echo ""

# Verificar se o Node.js está instalado
if ! command -v node &> /dev/null; then
    echo "❌ Node.js não está instalado. Por favor, instale o Node.js primeiro."
    exit 1
fi

echo "✅ Node.js $(node -v) detectado"
echo ""

# Verificar se as dependências estão instaladas
if [ ! -d "node_modules" ]; then
    echo "📦 Instalando dependências..."
    npm install
    echo ""
else
    echo "✅ Dependências já instaladas"
    echo ""
fi

# Verificar se o arquivo .env existe
if [ ! -f ".env" ]; then
    echo "⚠️  Arquivo .env não encontrado. Copiando de .env.example..."
    cp .env.example .env
    echo "⚠️  Por favor, configure o arquivo .env antes de continuar."
    exit 1
fi

echo "✅ Arquivo .env encontrado"
echo ""

# Gerar os arquivos do Prisma
echo "🔧 Gerando cliente Prisma..."
npm run db:generate
echo ""

# Iniciar o servidor em modo de desenvolvimento
echo "🌟 Iniciando servidor em modo de desenvolvimento..."
echo "📍 API: http://localhost:8080"
echo "📍 Swagger: http://localhost:8080/docs"
echo "📍 Manager: http://localhost:8080/manager"
echo ""
echo "Pressione Ctrl+C para parar o servidor"
echo ""

npm run dev:server
