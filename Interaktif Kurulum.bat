@echo off
color 08
mode con cols=80 lines=25
title Vortex Turkce Yama Kurulum Scripti                                                                                                                                   
echo Vortex Turkce Yama Kurulum Scripti
echo.
echo Script Yazari: Ilker BINZET
echo.
echo https://www.nexusmods.com/site/mods/811
echo.
echo ==============================
echo.
if exist tr (
goto B
) else (
goto HATA2
)
:B
if "%APPDATA%" == "" (
        goto HATA
    )
set vortexpath=%APPDATA%\Vortex
:F
tasklist | find /i "vortex.exe" >nul
if "%errorlevel%"=="1" (goto A) else (goto G)
:A
echo Turkce yama kurulumuna baslamak icin herhangi bir tusa basin...
pause >nul
cls
md "%vortexpath%\locales\tr" >nul 2>nul
copy /y tr %vortexpath%\locales\tr
timeout /nobreak /t 1 >nul
if %errorlevel% geq 1 (
goto HATA3
) else (
goto E
)
:E
echo.
echo ==============================
echo.
echo Komut basariyla calistirildi!
echo.
echo Kurulum tamamlandiktan sonra, Vortex'i acin ve SETTINGS-INTERFACE-LANGUAGE bolumunden Turkceyi secin.
echo.
echo Scriptinizde bir sorun varsa veya ceviriyle ilgili daha iyi bir oneriniz varsa, github projesi ilker-binzet/Vortex-Mod-Manager-Turkish-Localization uzerinden, issues ya da pr gonderebilirsiniz, tesekkurler!
echo.
echo Scriptten cikmak icin herhangi bir tusa basin...
pause >nul
exit
:HATA
echo Otomatik dizin alma basarisiz oldu, bazi parametreleri manuel girmeniz gerekecek. Her parametre icin varsayilan degerler belirlenmistir, varsayilani kullanmak icin bos birakin.
echo.
echo Devam etmek icin anladim ve devam et tusuna basin...
pause >nul
:D
cls
set name=Administrator
set /p name=Bilgisayar kullanicinizi girin - Buyuk ve kucuk harf duyarlidir. (varsayilan: Administrator):
set drive=C
echo.
set /p drive=Sistem diskinizi girin (harf olarak. Varsayilan: C):
set vortexpath=%drive%:\Users\%name%\AppData\Roaming\vortex
echo.
if exist %vortexpath% (
echo Ayarlar tamamlandi!
echo.
goto A
) else (
echo Parametre hatasi, dizin bulunamadi! Parametreleri tekrar girmek icin herhangi bir tusa basin. Eger basarisiz olursa lutfen manuel kurulum yapin.
pause >nul
goto D
)
:HATA2
echo Lutfen "tr" ceviri klasorunu ve bu scripti ayni dizine koydugunuzda tekrar deneyin!
echo.
echo Scriptten cikmak icin herhangi bir tusa basin...
pause >nul
exit
:HATA3
echo.
echo ==============================
echo.
echo Komut calistirilirken bir hata olustu! Lutfen yukaridaki bilgileri kontrol edin.
echo.
echo Sorun cozulemezse lutfen manuel kurulum yapmayi deneyin, manuel kurulum talimatlari hem sikistirilmis dosyada hem de nexus mod web sitesinde mevcuttur!
echo.
echo Sorun devam ederse, github projesi ilker-binzet/Vortex-Mod-Manager-Turkish-Localization uzerinden issues ile bana ulasabilirsiniz, cok tesekkur ederim!
echo.
echo Scriptten cikmak icin herhangi bir tusa basin...
pause >nul
exit
:G
if "%off%" == "1" (
        goto HATA4
    )
echo Vortex calisiyor, tespit edildi...
echo Script, Vortex'i otomatik olarak kapatacak
echo Devam etmek icin herhangi bir tusa basin
pause >nul
cls
echo Kapatiliyor...
taskkill /f /im vortex.exe >nul
set off=1
timeout /nobreak /t 3 >nul
cls
echo Vortex Turkce Yama Kurulum Scripti
echo.
echo Script Yazari: Ilker BINZET
echo.
echo ==============================
echo.
goto F
:HATA4
echo Vortex kapatilamadi, lutfen manuel olarak kapatip bu scripti tekrar calistirin!
echo.
echo Scriptten cikmak icin herhangi bir tusa basin...
pause >nul
exit
