@echo off && title schizo.agency Installer && goto ff

:ff

set name=ClientSettings && set jsonName=ClientAppSettings.json && set Path=%UserProfile%\AppData\Local\Roblox\Versions

FOR /F " tokens=*" %%i IN ('dir %path% /b /ad-h /od') DO (SET new=%%i)

echo [schizo.agency]: Found latest roblox version %path%\%new%
echo [schizo.agency]: Moving into  %path%\%new% && cd %path%\%new%

echo [schizo.agency]: mkdir  %name% && cd %path%\%new% && mkdir %path%\%new%\ClientSettings
echo [schizo.agency]: Moving into  %name% && cd %name%
echo [schizo.agency]: Adding FFlag && echo {"FFlagRenderHighlightPass3": "true", "RenderHighlightPass": "true"} >> %jsonName%

echo Successfully installed press enter to EXIT && set /p input=