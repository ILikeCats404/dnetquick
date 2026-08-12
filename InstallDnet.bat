@echo off
setlocal

echo ========================================
echo       Portable .NET 10 SDK Installer
echo ========================================
echo.

set "INSTALL_DIR=%~dp0dotnet10"

if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"

echo Downloading Microsoft dotnet-install.ps1...
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ^
    "$u='https://dot.net/v1/dotnet-install.ps1'; Invoke-WebRequest -Uri $u -OutFile '%TEMP%\dotnet-install.ps1'"

if errorlevel 1 (
    echo.
    echo ERROR: Failed to download dotnet-install.ps1
    pause
    exit /b 1
)

echo.
echo Installing .NET 10 SDK to:
echo %INSTALL_DIR%
echo.

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%TEMP%\dotnet-install.ps1" ^
    -Channel 10.0 ^
    -Quality GA ^
    -InstallDir "%INSTALL_DIR%" ^
    -NoPath

if errorlevel 1 (
    echo.
    echo ERROR: .NET 10 SDK installation failed.
    pause
    exit /b 1
)

set "PATH=%INSTALL_DIR%;%PATH%"

echo.
echo ========================================
echo       Installation Complete
echo ========================================
echo.
echo Portable SDK:
echo %INSTALL_DIR%
echo.

dotnet --version
echo.
dotnet --info

echo.
echo This CMD window has been configured to use
echo the portable .NET 10 installation.
echo.
pause