@echo off
chcp 65001 >nul
title ربات ادممبر جدید - New Member Adder Bot

echo.
echo ========================================
echo    ربات ادممبر پیشرفته جدید
echo    New Advanced Member Adder Bot
echo ========================================
echo.

echo 🚀 در حال شروع ربات...
echo.

REM بررسی وجود فایل‌های ضروری
if not exist "config_new.json" (
    echo ❌ فایل config_new.json یافت نشد!
    echo لطفاً تنظیمات ربات را تکمیل کنید.
    pause
    exit /b 1
)

if not exist "accounts_new.json" (
    echo ❌ فایل accounts_new.json یافت نشد!
    echo لطفاً اکانت‌های تلگرام را اضافه کنید.
    pause
    exit /b 1
)

echo ✅ فایل‌های ضروری یافت شد
echo.

REM نصب وابستگی‌ها
echo 📦 در حال بررسی وابستگی‌ها...
python -c "import telethon" 2>nul
if errorlevel 1 (
    echo 📥 در حال نصب telethon...
    pip install telethon
)

python -c "import asyncio" 2>nul
if errorlevel 1 (
    echo 📥 در حال نصب asyncio...
    pip install asyncio
)

echo ✅ وابستگی‌ها بررسی شد
echo.

REM شروع ربات اصلی
echo 🤖 در حال شروع ربات ادممبر...
start "ربات ادممبر جدید" python run_bot_new.py

REM صبر برای راه‌اندازی ربات
timeout /t 5 /nobreak >nul

REM شروع ربات تلگرام مدیریتی
echo 📱 در حال شروع ربات تلگرام مدیریتی...
start "ربات تلگرام مدیریتی" python telegram_bot_manager_new.py

REM صبر برای راه‌اندازی ربات تلگرام
timeout /t 3 /nobreak >nul

echo.
echo ========================================
echo    ✅ ربات‌ها با موفقیت شروع شدند
echo ========================================
echo.
echo 📊 ربات ادممبر: در حال اجرا
echo 📱 ربات تلگرام: در حال اجرا
echo.
echo 💡 برای دسترسی به ربات تلگرام:
echo    - ربات را در تلگرام جستجو کنید
echo    - دستور /start را ارسال کنید
echo.
echo 🛑 برای توقف ربات‌ها این پنجره را ببندید
echo.
pause 