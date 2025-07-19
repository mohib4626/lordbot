@echo off
chcp 65001 >nul
title Special Ad Member Bot - Web Panel

echo.
echo ========================================
echo    Special Ad Member Bot - Web Panel
echo ========================================
echo.
echo در حال راه‌اندازی پنل وب...
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
pip install -r requirements_web.txt

if errorlevel 1 (
    echo خطا در نصب کتابخانه‌ها!
    pause
    exit /b 1
)

echo.
echo کتابخانه‌ها با موفقیت نصب شدند!
echo.

REM شروع پنل وب
echo در حال شروع پنل وب...
echo.
echo پنل وب در آدرس زیر قابل دسترسی است:
echo http://localhost:8080
echo.
echo نام کاربری: lord
echo رمز عبور: lord2024
echo.
echo برای توقف، Ctrl+C را فشار دهید
echo.

python web_panel_new.py

pause 