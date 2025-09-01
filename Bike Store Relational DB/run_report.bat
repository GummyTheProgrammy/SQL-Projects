@echo off
rem Arquivo: run_report.bat
rem Script para gerar o relatório de receita anual

rem Navega para o diretório do script, garantindo que os caminhos relativos funcionem
pushd %~dp0

rem Cria a pasta para os relatórios se ela ainda não existir
if not exist "reports" mkdir "reports"

rem Caminho para o executável psql.exe
set PSQL_PATH="C:\Program Files\PostgreSQL\17\bin\psql.exe"

rem Caminhos para o script SQL e o arquivo de saída
set SQL_SCRIPT_PATH="generate_report.sql"
set REPORT_FILE_PATH="reports\revenue_report_%date:~6,4%-%date:~3,2%-%date:~0,2%.csv"

rem Conecta ao PostgreSQL e executa o script, salvando a saída
%PSQL_PATH% -d bike_store -U postgres -a -f %SQL_SCRIPT_PATH% > "%REPORT_FILE_PATH%"

rem Exibe uma mensagem de sucesso no log
echo Relatorio gerado em %REPORT_FILE_PATH%

rem Retorna ao diretório anterior
popd