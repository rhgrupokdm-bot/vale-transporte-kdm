@echo off
REM Script para fazer upload do index.html para GitHub
REM Basta colar este arquivo na pasta Downloads junto com index.html e executar

cd /d "%USERPROFILE%\Downloads"

REM Verifica se o arquivo existe
if not exist index.html (
    echo.
    echo ERRO: Arquivo index.html nao encontrado em Downloads!
    echo.
    echo Coloque o arquivo index.html nesta pasta: %USERPROFILE%\Downloads
    echo.
    pause
    exit /b 1
)

echo.
echo ============================================================
echo      Fazendo upload do Vale Transporte para GitHub
echo ============================================================
echo.

REM Clona o repositório
echo [1/5] Clonando repositorio...
git clone https://github.com/rhgrupokdm-bot/vale-transporte-kdm.git temp-repo
cd temp-repo

REM Configura Git
echo [2/5] Configurando Git...
git config user.email "rhgrupokdm-bot@users.noreply.github.com"
git config user.name "rhgrupokdm-bot"

REM Copia o arquivo
echo [3/5] Copiando arquivo...
copy "..\index.html" "index.html"

REM Adiciona e faz commit
echo [4/5] Fazendo commit...
git add index.html
git commit -m "Adiciona sistema Vale Transporte index.html"

REM Faz push
echo [5/5] Fazendo push para GitHub...
git push https://rhgrupokdm-bot:Dani4061#@github.com/rhgrupokdm-bot/vale-transporte-kdm.git main

REM Volta para Downloads
cd ..

REM Limpeza
echo.
echo Limpando arquivos temporarios...
rmdir /s /q temp-repo

echo.
echo ============================================================
echo  SUCESSO! Sistema está online em:
echo  https://rhgrupokdm-bot.github.io/vale-transporte-kdm/
echo ============================================================
echo.
pause
