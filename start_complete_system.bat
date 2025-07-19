@echo off
chcp 65001 >nul
title Special Ad Member Bot - Complete System

echo.
echo ========================================
echo    Special Ad Member Bot - Complete System
echo ========================================
echo.
echo در حال راه‌اندازی سیستم کامل...
echo.

REM بررسی وجود Python
python --version >nul 2>&1
if errorlevel 1 (
    echo خطا: Python نصب نشده است!
    echo لطفا Python را از سایت رسمی دانلود و نصب کنید
    pause
    exit /b 1
)

REM نصب dependencies
echo در حال نصب کتابخانه‌های مورد نیاز...
pip install -r requirements_new.txt
pip install -r requirements_web.txt

if errorlevel 1 (
    echo خطا در نصب کتابخانه‌ها!
    pause
    exit /b 1
)

echo.
echo کتابخانه‌ها با موفقیت نصب شدند!
echo.

REM بررسی فایل‌های ضروری
echo در حال بررسی فایل‌های ضروری...

if not exist "config_new.json" (
    echo خطا: فایل config_new.json یافت نشد!
    echo لطفا فایل تنظیمات را ایجاد کنید
    pause
    exit /b 1
)

if not exist "accounts_new.json" (
    echo خطا: فایل accounts_new.json یافت نشد!
    echo لطفا فایل اکانت‌ها را ایجاد کنید
    pause
    exit /b 1
)

echo فایل‌های ضروری موجود هستند!
echo.

REM شروع سیستم کامل
echo در حال شروع سیستم کامل...
echo.

echo 🚀 **سیستم در حال راه‌اندازی:**
echo.
echo 📱 **ربات ادممبر:** در حال شروع...
echo 🤖 **ربات تلگرام:** در حال شروع...
echo 🌐 **پنل وب:** در حال شروع...
echo.

REM شروع ربات ادممبر در پس‌زمینه
echo شروع ربات ادممبر...
start "Member Adder Bot" cmd /c "python advanced_member_adder_new.py"

REM صبر کوتاه
timeout /t 3 /nobreak >nul

REM شروع ربات تلگرام در پس‌زمینه
echo شروع ربات تلگرام...
start "Telegram Bot Manager" cmd /c "python telegram_bot_manager_new.py"

REM صبر کوتاه
timeout /t 3 /nobreak >nul

REM شروع پنل وب
echo شروع پنل وب...
echo.
echo 🌐 **پنل وب در آدرس زیر قابل دسترسی است:**
echo http://localhost:8080
echo.
echo 👤 **اطلاعات ورود:**
echo نام کاربری: lord
echo رمز عبور: lord2024
echo.
echo 📱 **ربات تلگرام:**
echo @special_ad_member_bot
echo.
echo 🎯 **دستورات مفید:**
echo /start - شروع ربات
echo /status - وضعیت ربات
echo /stats - آمار کامل
echo /admin - پنل مدیریتی
echo.
echo ⚠️ **نکات مهم:**
echo - برای توقف کامل، تمام پنجره‌ها را ببندید
echo - لاگ‌ها در فایل‌های .log ذخیره می‌شوند
echo - وضعیت در فایل‌های .json ذخیره می‌شود
echo.
echo 🎉 **سیستم با موفقیت راه‌اندازی شد!**
echo.

REM شروع پنل وب
python web_panel_new.py

pause 