@echo off
setlocal EnableExtensions EnableDelayedExpansion
set "DESTDIR=%~1"

REM (Opcional) para aceitar acentos corretamente no console/arquivo
chcp 65001 >nul

set "OUT=breakpoints.json"

set /p "LOC=Informe o caminho do fonte (ex: /teste/MyLOJA701.PRW): "
set /p "START=Informe a linha inicial (ex: 1747): "
set /p "END=Informe a linha final (ex: 1828): "

REM Converte para numero e garante ordem (se start > end, troca)
set /a S=%START% >nul 2>&1
if errorlevel 1 (
  echo Linha inicial invalida.
  pause
  exit /b 1
)

set /a E=%END% >nul 2>&1
if errorlevel 1 (
  echo Linha final invalida.
  pause
  exit /b 1
)

REM Aplica -1 (ex: 1747..1828 vira 1746..1827)
set /a S-=1
set /a E-=1

REM Garante ordem (se S > E, troca)
if !S! gtr !E! (
  set /a T=!S!
  set /a S=!E!
  set /a E=!T!
)
REM Inicia o JSON
(
  echo [
) > "%OUT%"

REM Gera os itens do array
for /L %%L in (!S!,1,!E!) do (
  if %%L==!S! (set "SEP=") else (set "SEP=,")
  >>"%OUT%" echo   !SEP!{
  >>"%OUT%" echo     "location": "!LOC!",
  >>"%OUT%" echo     "line": [
  >>"%OUT%" echo       {
  >>"%OUT%" echo         "line": %%L,
  >>"%OUT%" echo         "character": 0
  >>"%OUT%" echo       },
  >>"%OUT%" echo       {
  >>"%OUT%" echo         "line": %%L,
  >>"%OUT%" echo         "character": 0
  >>"%OUT%" echo       }
  >>"%OUT%" echo     ],
  >>"%OUT%" echo     "enabled": true
  >>"%OUT%" echo   }
)

REM Fecha o JSON
>>"%OUT%" echo ]

echo.
echo Arquivo gerado: "%CD%\%OUT%"

REM Move para a pasta do VSCode
set "DEST=%DESTDIR%\%OUT%"

if not exist "%DESTDIR%" (
  echo Pasta destino nao existe: "%DESTDIR%"
  pause
  exit /b 1
)

move /Y "%OUT%" "%DEST%" >nul

echo.
echo Arquivo movido com sucesso!
echo O arquivo se encontra em: "%DEST%"
pause
