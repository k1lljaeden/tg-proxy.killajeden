@echo off
title Killjaeden Proxy v1.0
color 0A
cls

echo.
echo   ██╗  ██╗██╗██╗     ██╗     ██╗ █████╗ ███████╗██████╗ ███████╗███╗   ██╗
echo   ██║ ██╔╝██║██║     ██║     ██║██╔══██╗██╔════╝██╔══██╗██╔════╝████╗  ██║
echo   █████╔╝ ██║██║     ██║     ██║███████║█████╗  ██║  ██║█████╗  ██╔██╗ ██║
echo   ██╔═██╗ ██║██║     ██║     ██║██╔══██║██╔══╝  ██║  ██║██╔══╝  ██║╚██╗██║
echo   ██║  ██╗██║███████╗███████╗██║██║  ██║███████╗██████╔╝███████╗██║ ╚████║
echo   ╚═╝  ╚═╝╚═╝╚══════╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚═════╝ ╚══════╝╚═╝  ╚═══╝
echo.
echo               ════════════════════════════════════════════════════
echo                         KILLJAEDEN PROXY v1.0
echo                    Telegram Bypass — работает в РФ
echo               ════════════════════════════════════════════════════
echo.

set LOGFILE=%TEMP%\killjaeden_log.txt

echo [*] Запуск прокси, подождите 5 секунд...
start /b "Killjaeden Proxy" "%~dp0tg-ws-proxy.exe" --host 0.0.0.0 --link-ip 127.0.0.1 --default-domains --danger-accept-invalid-certs > "%LOGFILE%" 2>&1

timeout /t 5 /nobreak >nul

:: ============================================================================
:: Извлекаем ссылку через PowerShell — он вытянет всю строку до конца
:: ============================================================================
for /f "delims=" %%i in ('powershell -command "$content = Get-Content '%LOGFILE%' -Raw; $m = [regex]::Match($content, 'tg://proxy?[^\s]+'); $m.Value"') do set "PROXY_LINK=%%i"

:: Если ссылка пустая — показываем лог и выходим
if "%PROXY_LINK%"=="" (
    echo [!] Не удалось найти ссылку.
    echo [*] Проверьте файл: %LOGFILE%
    pause
    exit /b
)

:: Копируем в буфер через PowerShell (безопасно для &)
powershell -command "Set-Clipboard -Value '%PROXY_LINK%'"

echo.
echo [✓] Ссылка скопирована в буфер обмена:
echo     %PROXY_LINK%
echo.

:: Открываем Telegram
echo [*] Открываю Telegram...
start "" "%PROXY_LINK%"

echo.
echo ============================================================
echo   Если Telegram не открылся — просто вставьте ссылку Ctrl+V
echo   (она уже в буфере обмена).
echo.
echo   Закройте это окно, чтобы остановить прокси.
echo ============================================================
echo.

pause >nul

:: Остановка прокси
taskkill /f /im tg-ws-proxy.exe >nul 2>&1
echo [*] Прокси остановлен.