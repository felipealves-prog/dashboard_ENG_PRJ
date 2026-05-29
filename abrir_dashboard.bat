@echo off
title SolarGrid — Dashboard Projetos Executivos
color 0A

echo.
echo  ==========================================
echo   SolarGrid — Atualizando Dashboard...
echo  ==========================================
echo.

:: Vai para a pasta onde este .bat esta localizado
cd /d "%~dp0"

:: Atualiza os dados da planilha
echo  Buscando dados do Google Sheets...
python atualizar_dados.py

echo.
echo  ==========================================
echo   Iniciando servidor local...
echo  ==========================================
echo.

:: Abre o dashboard no navegador apos 2 segundos
start "" timeout /t 2 >nul
start "" "http://localhost:8000/dashboard-projetos-executivos.html"

:: Inicia o servidor (mantem a janela aberta)
python -m http.server 8000

echo.
echo  Servidor encerrado. Feche esta janela.
pause
