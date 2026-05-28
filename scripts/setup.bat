@echo off
echo === Nexus Platform AI Setup ===
where docker >nul 2>&1 || (echo Docker required & exit /b)
where node >nul 2>&1 || (echo Node.js required & exit /b)
call npm install
docker-compose up -d
npx prisma migrate dev --name init
npx prisma db seed
echo Setup complete. Run npm run dev
