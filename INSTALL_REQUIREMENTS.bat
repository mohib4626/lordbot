@echo off
chcp 65001 >nul
title Install Requirements - Special Ad Member Bot

echo.
echo ========================================
echo    Install Requirements - Special Ad Member Bot
echo ========================================
echo.

echo 🚀 نصب تمام پیش‌نیازها
echo.

echo 📋 **بررسی نرم‌افزارهای موجود...**
echo.

REM بررسی Python
echo 📦 بررسی Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python نصب نشده است!
    echo در حال باز کردن سایت Python...
    start https://www.python.org/downloads/
    echo.
    echo ⚠️ لطفا Python را نصب کنید و دوباره اجرا کنید
    echo.
    pause
    exit /b 1
) else (
    echo ✅ Python موجود است
    python --version
)

REM بررسی Git
echo 📦 بررسی Git...
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Git نصب نشده است!
    echo در حال باز کردن سایت Git...
    start https://git-scm.com/download/win
    echo.
    echo ⚠️ لطفا Git را نصب کنید و دوباره اجرا کنید
    echo.
    pause
    exit /b 1
) else (
    echo ✅ Git موجود است
    git --version
)

echo.
echo ✅ تمام نرم‌افزارهای اصلی موجود هستند
echo.

echo 📦 **نصب کتابخانه‌های Python...**
echo.

echo نصب telethon...
pip install telethon

echo نصب flask...
pip install flask

echo نصب flask-socketio...
pip install flask-socketio

echo نصب requests...
pip install requests

echo نصب python-dotenv...
pip install python-dotenv

echo نصب asyncio...
pip install asyncio

echo نصب aiohttp...
pip install aiohttp

echo نصب sqlite3...
pip install sqlite3

echo.
echo ✅ تمام کتابخانه‌ها نصب شدند
echo.

echo 🎯 **بررسی نصب کتابخانه‌ها...**
echo.

python -c "import telethon; print('✅ telethon نصب شد')" 2>nul
python -c "import flask; print('✅ flask نصب شد')" 2>nul
python -c "import flask_socketio; print('✅ flask-socketio نصب شد')" 2>nul
python -c "import requests; print('✅ requests نصب شد')" 2>nul
python -c "import dotenv; print('✅ python-dotenv نصب شد')" 2>nul
python -c "import asyncio; print('✅ asyncio نصب شد')" 2>nul
python -c "import aiohttp; print('✅ aiohttp نصب شد')" 2>nul

echo.
echo ✅ تمام کتابخانه‌ها با موفقیت نصب شدند
echo.

echo 🚀 **آماده برای استقرار!**
echo.

echo 📋 **مراحل بعدی:**
echo 1. فایل FULL_SYSTEM_SETUP.bat را اجرا کنید
echo 2. یا فایل ONE_CLICK_DEPLOY.bat را اجرا کنید
echo 3. یا فایل COMPLETE_AUTO_DEPLOY.bat را اجرا کنید
echo.

echo 🎯 **برای شروع، فایل FULL_SYSTEM_SETUP.bat را اجرا کنید**
echo.

pause 