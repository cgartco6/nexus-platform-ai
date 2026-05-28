#!/bin/bash
set -e
echo "=== Nexus Platform AI Setup ==="
command -v docker >/dev/null 2>&1 || { echo "Docker required"; exit 1; }
command -v node >/dev/null 2>&1 || { echo "Node.js required"; exit 1; }
npm install
docker-compose up -d
npx prisma migrate dev --name init
npx prisma db seed
echo "Setup complete. Run 'npm run dev'"
