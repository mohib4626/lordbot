@echo off
title ربات ادممبر جدید - New Member Adder Bot
color 0A

echo ========================================
echo    ربات ادممبر جدید - New Member Adder Bot
echo    راه‌اندازی ربات جدید
echo ========================================
echo.

echo در حال بررسی Python...
python --version
if %errorlevel% neq 0 (
    echo خطا: Python نصب نشده است!
    echo لطفاً Python را از python.org دانلود و نصب کنید
    pause
    exit /b 1
)

echo.
echo در حال نصب نیازمندی‌ها...
pip install -r requirements_new.txt

echo.
echo در حال ایجاد پوشه sessions...
if not exist "sessions" mkdir sessions

echo.
echo در حال بررسی فایل‌های تنظیمات...
echo.
echo توجه: قبل از اجرا، فایل‌های زیر را ویرایش کنید:
echo 1. accounts_new.json - اطلاعات اکانت‌های تلگرام
echo 2. config_new.json - تنظیمات ربات و گروه‌ها
echo.

echo آیا فایل‌های تنظیمات را ویرایش کرده‌اید؟ (Y/N)
set /p choice=
if /i "%choice%"=="Y" (
    echo.
    echo شروع ربات...
    echo.
    echo ربات در حال اجرا است...
    echo برای توقف، Ctrl+C را فشار دهید
    echo.
    
    python advanced_member_adder_new.py
    
) else (
    echo.
    echo لطفاً ابتدا فایل‌های تنظیمات را ویرایش کنید:
    echo.
    echo 1. فایل accounts_new.json را باز کنید
    echo 2. اطلاعات اکانت‌های تلگرام خود را وارد کنید
    echo 3. فایل config_new.json را باز کنید
    echo 4. گروه‌های منبع و هدف را تنظیم کنید
    echo 5. دوباره این فایل را اجرا کنید
    echo.
)

echo.
echo برای خروج، کلید Enter را فشار دهید...
pause 