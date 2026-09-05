@echo off
REM ZEUS TOP GAMER PANEL - APK Build Script for Windows
REM This script builds a release APK with proper naming

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║     ZEUS TOP GAMER PANEL - APK BUILD SCRIPT               ║
echo ║                    Windows Version                         ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

REM Check if Flutter is installed
flutter --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Flutter is not installed or not in PATH
    pause
    exit /b 1
)

echo 📱 Building APK...
echo.

REM Clean previous builds
echo 🧹 Cleaning previous builds...
call flutter clean

REM Get dependencies
echo 📦 Getting dependencies...
call flutter pub get

REM Build release APK
echo 🔨 Building release APK...
call flutter build apk --release

REM Check if build was successful
if exist "build\app\outputs\apk\release\app-release.apk" (
    echo.
    echo ✅ APK Build Successful!
    echo.
    echo 📍 APK Location:
    echo    build\app\outputs\apk\release\ZEUS_TOP_GAMER_PANEL_v1.0.0_release.apk
    echo.
    echo 🚀 To install on device:
    echo    flutter install
    echo    or
    echo    adb install build\app\outputs\apk\release\ZEUS_TOP_GAMER_PANEL_v1.0.0_release.apk
    echo.
) else (
    echo.
    echo ❌ APK Build Failed!
    echo    Check the error messages above.
    pause
    exit /b 1
)

pause
