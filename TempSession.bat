curl -L https://github.com/cli/cli/releases/download/v2.97.0/gh_2.97.0_windows_386.zip -o gh.zip
pause
mkdir gh
powershell -Command "Expand-Archive -LiteralPath '%CD%\gh.zip' -DestinationPath '%CD%\gh'"
del gh.zip
set PATH=%PATH%;%CD%\gh\bin\

curl -L https://github.com/ip7z/7zip/releases/download/26.02/7zr.exe -o 7z.exe
pause
mkdir 7z
move 7z.exe 7z\
set PATH=%PATH%;%CD%\7z\

curl -L https://github.com/git-for-windows/git/releases/download/v2.55.0.windows.4/PortableGit-2.55.0.4-64-bit.7z.exe -o Installgit.exe 
pause
Installgit.exe -y
del Installgit.exe
set PATH=%PATH%;%CD%\PortableGit\cmd\

curl https://builds.dotnet.microsoft.com/dotnet/Sdk/10.0.400/dotnet-sdk-10.0.400-win-x64.zip -o dnet.zip
pause
mkdir Dotnet10
powershell -Command "Expand-Archive -LiteralPath '%CD%\dnet.zip' -DestinationPath '%CD%\Dotnet10'"
del dnet.zip
set PATH=%PATH%;%CD%\Dotnet10\

dotnet workload install maui

cmd.exe
pause
