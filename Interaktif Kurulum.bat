@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: Script Versiyonu ve Tarih
set "VERSION=2.1.0"
set "SCRIPT_DATE=2026-03-26"

:: Konsol ayarları
color 0B
mode con cols=100 lines=30
title Vortex Türkçe Yama Kurulum Scripti v%VERSION%

:: Banner
echo ╔════════════════════════════════════════════════════════════════════════════════╗
echo ║                    Vortex Türkçe Yama Kurulum Scripti v%VERSION%               ║
echo ╠════════════════════════════════════════════════════════════════════════════════╣
echo ║ Script Yazarı: Ilker Binzet                                                    ║
echo ║ https://www.nexusmods.com/site/mods/811                                        ║
echo ╚════════════════════════════════════════════════════════════════════════════════╝
echo.

:: Gerekli dizin kontrolü
if not exist tr (
    color 0C
    echo [HATA] "tr" çeviri klasörü bulunamadı!
    echo.
    echo Lütfen "tr" çeviri klasörünü ve bu scripti aynı dizine koyun.
    echo.
    echo Çıkmak için herhangi bir tuşa basın...
    pause >nul
    exit /b 1
)

:: Vortex yolu kontrolü
if "%APPDATA%"=="" (
    goto MANUEL_KURULUM
)

set "vortexpath=%APPDATA%\Vortex"

if not exist "%vortexpath%" (
    color 0E
    echo [UYARI] '%vortexpath%' dizini bulunamadı!
    echo Lütfen yamayı kurmadan önce Vortex'i en az bir kez çalıştırdığınızdan emin olun.
    echo.
    echo Yine de manuel kuruluma geçmek için bir tuşa basın veya pencereyi kapatın.
    pause >nul
    goto MANUEL_KURULUM
)

:: Vortex process kontrolü
tasklist /FI "IMAGENAME eq vortex.exe" 2>NUL | find /I /N "vortex.exe">NUL
if "%ERRORLEVEL%"=="0" (
    color 0E
    echo [UYARI] Vortex çalışıyor. Kuruluma devam etmek için kapatılması gerekiyor.
    echo.
    echo Devam etmek için herhangi bir tuşa basın...
    pause >nul
    taskkill /IM "vortex.exe" /F >nul 2>&1
)

:: Kurulum işlemi
echo [BİLGİ] Kurulum başlatılıyor...
echo.

:: İlerleme çubuğu
set "progress="
for /L %%i in (1,1,20) do (
    set "progress=!progress!█"
    cls
    echo ╔════════════════════════════════════════════════════════════════════════════════╗
    echo ║                    Vortex Türkçe Yama Kurulum Scripti v%VERSION%               ║
    echo ╚════════════════════════════════════════════════════════════════════════════════╝
    echo.
    echo Kurulum ilerlemesi:
    echo [!progress!%====================%]
    ping localhost -n 1 >nul
)

md "%vortexpath%\locales\tr" >nul 2>&1
robocopy "tr" "%vortexpath%\locales\tr" /E /IS /IT >nul 2>&1

if !ERRORLEVEL! geq 8 (
    color 0C
    echo [HATA] Kurulum sırasında bir hata oluştu!
    echo.
    echo Hata detayları:
    echo - Hedef dizine yazma izni kontrol edin
    echo - Disk alanı yeterliliğini kontrol edin
    echo - Anti-virüs yazılımının engellemediğinden emin olun
    echo.
    echo Manuel kurulum için talimatlar:
    echo 1. %vortexpath%\locales\ dizinine gidin
    echo 2. "tr" klasörünü manuel olarak kopyalayın
    echo.
    pause
    color
    exit /b 1
) else (
    color 0A
    echo.
    echo ╔════════════════════════════════════════════════════════════════════════════════╗
    echo ║                           Kurulum Başarıyla Tamamlandı!                        ║
    echo ╠════════════════════════════════════════════════════════════════════════════════╣
    echo ║ Yapılacaklar:                                                                  ║
    echo ║ 1. Vortex'i açın                                                               ║
    echo ║ 2. SETTINGS → INTERFACE → LANGUAGE bölümünden Türkçe'yi seçin                  ║
    echo ╚════════════════════════════════════════════════════════════════════════════════╝
    echo.
    echo GitHub: https://github.com/ilker-binzet/Vortex-Mod-Manager-Turkish-Localization
    echo.
    pause
    color
    exit /b 0
)

:MANUEL_KURULUM
color 0E
echo [UYARI] Otomatik kurulum başarısız oldu. Manuel kurulum başlatılıyor...
echo.
set /p "username=Bilgisayar kullanıcı adınızı girin: "
set /p "drive=Sistem diskinizi girin (örn: C): "

set "vortexpath=%drive%:\Users\%username%\AppData\Roaming\Vortex"

if exist "%vortexpath%" (
    goto KURULUM
) else (
    color 0C
    echo [HATA] Belirtilen dizin bulunamadı: %vortexpath%
    echo.
    echo Tekrar denemek için herhangi bir tuşa basın...
    pause >nul
    goto MANUEL_KURULUM
)

:KURULUM
echo [BİLGİ] Manuel kurulum başlatılıyor...
echo.
md "%vortexpath%\locales\tr" >nul 2>&1
robocopy "tr" "%vortexpath%\locales\tr" /E /IS /IT >nul 2>&1

if !ERRORLEVEL! geq 8 (
    color 0C
    echo [HATA] Manuel kurulum sırasında bir hata oluştu!
    echo.
    echo Hata detayları:
    echo - Hedef dizine yazma izni kontrol edin
    echo - Disk alanı yeterliliğini kontrol edin
    echo - Anti-virüs yazılımının engellemediğinden emin olun
    echo.
    pause
    color
    exit /b 1
) else (
    color 0A
    echo.
    echo ╔════════════════════════════════════════════════════════════════════════════════╗
    echo ║                           Kurulum Başarıyla Tamamlandı!                        ║
    echo ╠════════════════════════════════════════════════════════════════════════════════╣
    echo ║ Yapılacaklar:                                                                  ║
    echo ║ 1. Vortex'i açın                                                               ║
    echo ║ 2. SETTINGS → INTERFACE → LANGUAGE bölümünden Türkçe'yi seçin                  ║
    echo ╚════════════════════════════════════════════════════════════════════════════════╝
    echo.
    echo GitHub: https://github.com/ilker-binzet/Vortex-Mod-Manager-Turkish-Localization
    echo.
    pause
    color
    exit /b 0
)
