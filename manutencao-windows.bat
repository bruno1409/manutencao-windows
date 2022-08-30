@echo off
title Script para Manutencao do Windows

net session >nul 2>&1
if %errorlevel% equ 0 (
  goto inicio
) else (
  goto admin
)

:inicio
set opcao=0
cls
echo.
echo --- Script para Manutencao do Windows ---
echo.
echo Para obter a lista de tarefas que podem ser realizadas, acesse https://bruno1409.github.io/manutencao-windows/
echo.
set /p opcao=Digite o codigo da tarefa que deseja realizar: 
echo.

if %opcao% equ 101 goto 101
if %opcao% equ 102 goto 102
if %opcao% equ 103 goto 103
if %opcao% equ 201 goto 201
if %opcao% equ 202 goto 202
if %opcao% equ 203 goto 203
if %opcao% equ 204 goto 204
if %opcao% equ 301 goto 301
if %opcao% equ 302 goto 302
if %opcao% equ 303 goto 303
if %opcao% equ 304 goto 304
if %opcao% equ 305 goto 305
if %opcao% equ 306 goto 306
if %opcao% geq 1 goto invalido

:invalido
echo [!] Tarefa inexistente.
echo.
pause
goto inicio

:101
cls
echo.
echo --- Reparar o sistema de arquivos ---
echo.
chkdsk /r
echo.
pause
goto inicio

:102
cls
echo.
echo --- Reparar os arquivos do Windows ---
sfc /scannow
echo.
pause
goto inicio

:103
cls
echo.
echo --- Reparar os arquivos da pasta WinSxS ---
DISM /Online /Cleanup-Image /RestoreHealth
echo.
pause
goto inicio

:201
cls
echo.
echo --- Ver informacoes de energia ---
echo.
powercfg /a
pause
goto inicio

:202
cls
echo.
echo --- Desativar hibernacao (mantendo a inicializacao rapida) ---
echo.
powercfg /h /type reduced
echo.
pause
goto inicio

:203
cls
echo.
echo --- Desativar hibernacao (completo) ---
echo.
powercfg /h off
pause
goto inicio

:204
cls
echo.
echo --- Ativar hibernacao ---
echo.
powercfg /h on
pause
goto inicio

:301
cls
echo.
echo --- Gerar log do Windows Update no desktop ---
echo.
powershell Get-WindowsUpdateLog
pause
goto inicio

:302
cls
echo.
echo --- Ver hotfixes instalados ---
echo.
powershell Get-HotFix
pause
goto inicio

:303
cls
echo.
echo --- Ver atualizacoes instaladas ---
echo.
start ms-settings:windowsupdate-history
pause
goto inicio

:304
cls
echo.
echo --- Reparar o Windows Update (Basico) ---
echo.
net stop wuauserv
rd /s /q %systemroot%\SoftwareDistribution
net start wuauserv
pause
goto inicio

:305
cls
echo.
echo --- Reparar o Windows Update (Intermediario) ---
echo.
net stop bits
net stop wuauserv
net stop cryptsvc
del "%allusersprofile%\Microsoft\Network\Downloader\qmgr*.dat"
cd /d %windir%\system32
regsvr32 /s atl.dll
regsvr32 /s urlmon.dll
regsvr32 /s mshtml.dll
regsvr32 /s shdocvw.dll
regsvr32 /s browseui.dll
regsvr32 /s jscript.dll
regsvr32 /s vbscript.dll
regsvr32 /s scrrun.dll
regsvr32 /s msxml.dll
regsvr32 /s msxml3.dll
regsvr32 /s msxml6.dll
regsvr32 /s actxprxy.dll
regsvr32 /s softpub.dll
regsvr32 /s wintrust.dll
regsvr32 /s dssenh.dll
regsvr32 /s rsaenh.dll
regsvr32 /s gpkcsp.dll
regsvr32 /s sccbase.dll
regsvr32 /s slbcsp.dll
regsvr32 /s cryptdlg.dll
regsvr32 /s oleaut32.dll
regsvr32 /s ole32.dll
regsvr32 /s shell32.dll
regsvr32 /s initpki.dll
regsvr32 /s wuapi.dll
regsvr32 /s wuaueng.dll
regsvr32 /s wuaueng1.dll
regsvr32 /s wucltui.dll
regsvr32 /s wups.dll
regsvr32 /s wups2.dll
regsvr32 /s wuweb.dll
regsvr32 /s qmgr.dll
regsvr32 /s qmgrprxy.dll
regsvr32 /s wucltux.dll
regsvr32 /s muweb.dll
regsvr32 /s wuwebv.dll
netsh winsock reset
net start bits
net start wuauserv
net start cryptsvc
pause
goto inicio

:306
cls
echo.
echo --- Reparar o Windows Update (Avancado) ---
echo.
net stop bits
net stop wuauserv
net stop cryptsvc
del "%allusersprofile%\Microsoft\Network\Downloader\qmgr*.dat"
ren %Systemroot%\SoftwareDistribution\DataStore DataStore.bak
ren %Systemroot%\SoftwareDistribution\Download Download.bak
ren %Systemroot%\System32\catroot2 catroot2.bak
sc sdset bits D:(A;CI;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)
sc sdset wuauserv D:(A;;CCLCSWRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)
cd /d %windir%\system32
regsvr32 /s atl.dll
regsvr32 /s urlmon.dll
regsvr32 /s mshtml.dll
regsvr32 /s shdocvw.dll
regsvr32 /s browseui.dll
regsvr32 /s jscript.dll
regsvr32 /s vbscript.dll
regsvr32 /s scrrun.dll
regsvr32 /s msxml.dll
regsvr32 /s msxml3.dll
regsvr32 /s msxml6.dll
regsvr32 /s actxprxy.dll
regsvr32 /s softpub.dll
regsvr32 /s wintrust.dll
regsvr32 /s dssenh.dll
regsvr32 /s rsaenh.dll
regsvr32 /s gpkcsp.dll
regsvr32 /s sccbase.dll
regsvr32 /s slbcsp.dll
regsvr32 /s cryptdlg.dll
regsvr32 /s oleaut32.dll
regsvr32 /s ole32.dll
regsvr32 /s shell32.dll
regsvr32 /s initpki.dll
regsvr32 /s wuapi.dll
regsvr32 /s wuaueng.dll
regsvr32 /s wuaueng1.dll
regsvr32 /s wucltui.dll
regsvr32 /s wups.dll
regsvr32 /s wups2.dll
regsvr32 /s wuweb.dll
regsvr32 /s qmgr.dll
regsvr32 /s qmgrprxy.dll
regsvr32 /s wucltux.dll
regsvr32 /s muweb.dll
regsvr32 /s wuwebv.dll
netsh winsock reset
net start bits
net start wuauserv
net start cryptsvc
pause
goto inicio

:admin
cls
echo.
echo --- Script para Manutencao do Windows ---
echo.
echo Execute o script como administrador para que as tarefas funcionem corretamente.
echo.
pause
