@echo off
chcp 65001 >nul
title Auto Deploy - Special Ad Member Bot

echo.
echo ========================================
echo    Auto Deploy - Special Ad Member Bot
echo ========================================
echo.

echo 🚀 در حال آماده‌سازی برای استقرار خودکار...
echo.

REM بررسی وجود Git
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Git نصب نشده است!
    echo لطفا Git را از https://git-scm.com دانلود و نصب کنید
    pause
    exit /b 1
)

REM بررسی وجود Python
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python نصب نشده است!
    echo لطفا Python را از https://python.org دانلود و نصب کنید
    pause
    exit /b 1
)

echo ✅ Git و Python موجود هستند
echo.

REM بررسی فایل‌های ضروری
echo 📋 در حال بررسی فایل‌های ضروری...

set missing_files=0

if not exist "advanced_member_adder_new.py" (
    echo ❌ فایل advanced_member_adder_new.py یافت نشد!
    set /a missing_files+=1
)

if not exist "web_panel_new.py" (
    echo ❌ فایل web_panel_new.py یافت نشد!
    set /a missing_files+=1
)

if not exist "config_new.json" (
    echo ❌ فایل config_new.json یافت نشد!
    set /a missing_files+=1
)

if not exist "accounts_new.json" (
    echo ❌ فایل accounts_new.json یافت نشد!
    set /a missing_files+=1
)

if not exist "requirements_new.txt" (
    echo ❌ فایل requirements_new.txt یافت نشد!
    set /a missing_files+=1
)

if not exist "requirements_web.txt" (
    echo ❌ فایل requirements_web.txt یافت نشد!
    set /a missing_files+=1
)

if not exist "Procfile" (
    echo ❌ فایل Procfile یافت نشد!
    set /a missing_files+=1
)

if not exist "runtime.txt" (
    echo ❌ فایل runtime.txt یافت نشد!
    set /a missing_files+=1
)

if %missing_files% gtr 0 (
    echo.
    echo ❌ %missing_files% فایل ضروری یافت نشد!
    echo لطفا تمام فایل‌ها را بررسی کنید
    pause
    exit /b 1
)

echo ✅ تمام فایل‌های ضروری موجود هستند
echo.

REM ایجاد .gitignore
echo 📝 در حال ایجاد فایل .gitignore...
(
echo # Python
echo __pycache__/
echo *.py[cod]
echo *$py.class
echo *.so
echo .Python
echo build/
echo develop-eggs/
echo dist/
echo downloads/
echo eggs/
echo .eggs/
echo lib/
echo lib64/
echo parts/
echo sdist/
echo var/
echo wheels/
echo *.egg-info/
echo .installed.cfg
echo *.egg
echo MANIFEST
echo.
echo # Virtual Environment
echo venv/
echo ENV/
echo env/
echo .venv/
echo.
echo # IDE
echo .vscode/
echo .idea/
echo *.swp
echo *.swo
echo.
echo # Logs
echo *.log
echo logs/
echo.
echo # Database
echo *.db
echo *.sqlite
echo *.sqlite3
echo.
echo # Sessions
echo *.session
echo sessions/
echo.
echo # Temporary files
echo temp/
echo tmp/
echo.
echo # OS
echo .DS_Store
echo Thumbs.db
) > .gitignore

echo ✅ فایل .gitignore ایجاد شد
echo.

REM ایجاد README.md
echo 📝 در حال ایجاد فایل README.md...
(
echo # Special Ad Member Bot
echo.
echo ## 🤖 ربات ادممبر پیشرفته
echo.
echo ### ویژگی‌ها:
echo - ✅ ربات ادممبر پیشرفته
echo - ✅ ربات تلگرام مدیریتی
echo - ✅ پنل وب لوکس
echo - ✅ سیستم امنیتی قوی
echo.
echo ### نحوه استفاده:
echo 1. فایل‌ها را در GitHub آپلود کنید
echo 2. روی Railway.app استقرار دهید
echo 3. متغیرهای محیطی را تنظیم کنید
echo.
echo ### دسترسی‌ها:
echo - **پنل وب:** https://your-app.railway.app
echo - **ربات تلگرام:** @special_ad_member_bot
echo.
echo ### اطلاعات ورود:
echo - نام کاربری: lord
echo - رمز عبور: lord2024
echo.
echo ### پشتیبانی:
echo - **سازنده:** @Lord4626
echo - **پشتیبانی:** @I89I89I840
) > README.md

echo ✅ فایل README.md ایجاد شد
echo.

REM راهنمای استقرار
echo 📚 راهنمای استقرار:
echo.
echo 🎯 **مرحله 1: ایجاد Repository در GitHub**
echo 1. به https://github.com بروید
echo 2. روی "New repository" کلیک کنید
echo 3. نام: special-ad-member-bot
echo 4. Public را انتخاب کنید
echo 5. "Create repository" کلیک کنید
echo.
echo 🚀 **مرحله 2: آپلود فایل‌ها**
echo دستورات زیر را در Command Prompt اجرا کنید:
echo.
echo git init
echo git add .
echo git commit -m "Initial commit - Special Ad Member Bot"
echo git branch -M main
echo git remote add origin https://github.com/YOUR_USERNAME/special-ad-member-bot.git
echo git push -u origin main
echo.
echo 🌐 **مرحله 3: استقرار روی Railway**
echo 1. به https://railway.app بروید
echo 2. با GitHub حساب کاربری ایجاد کنید
echo 3. "New Project" کلیک کنید
echo 4. "Deploy from GitHub repo" انتخاب کنید
echo 5. Repository خود را انتخاب کنید
echo 6. متغیرهای محیطی را تنظیم کنید:
echo.
echo TELEGRAM_API_ID=29003653
echo TELEGRAM_API_HASH=522d9793d72a6829e34fed2a35cd46f6
echo BOT_TOKEN=7861826109:AAF4ZOLn5UpGmxlsh0grbQ6STbGs5g2YL2E
echo WEB_PORT=8080
echo PYTHON_VERSION=3.11.7
echo.
echo 7. Start Command: python web_panel_new.py
echo 8. "Deploy" کلیک کنید
echo.
echo 📊 **مرحله 4: تست**
echo - پنل وب: https://your-app.railway.app
echo - ربات تلگرام: @special_ad_member_bot
echo.
echo 🎉 **نتیجه:**
echo ربات شما 24/7 فعال خواهد بود!
echo.

echo ✅ آماده‌سازی کامل شد!
echo.
echo 📋 **فایل‌های ایجاد شده:**
echo - .gitignore
echo - README.md
echo - RAILWAY_DEPLOYMENT.md
echo.
echo 🚀 **مرحله بعدی:**
echo 1. فایل‌ها را در GitHub آپلود کنید
echo 2. روی Railway.app استقرار دهید
echo 3. متغیرهای محیطی را تنظیم کنید
echo.
echo 📞 **پشتیبانی:**
echo - سازنده: @Lord4626
echo - پشتیبانی: @I89I89I840
echo.

pause 