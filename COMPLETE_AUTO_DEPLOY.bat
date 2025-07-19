@echo off
chcp 65001 >nul
title Complete Auto Deploy - Special Ad Member Bot

echo.
echo ========================================
echo    Complete Auto Deploy - Special Ad Member Bot
echo ========================================
echo.

echo 🚀 استقرار کامل خودکار ربات ادممبر
echo.

REM بررسی وجود Git
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Git نصب نشده است!
    echo در حال باز کردن سایت Git...
    start https://git-scm.com/download/win
    echo لطفا Git را نصب کنید و دوباره اجرا کنید
    pause
    exit /b 1
)

REM بررسی وجود Python
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python نصب نشده است!
    echo در حال باز کردن سایت Python...
    start https://www.python.org/downloads/
    echo لطفا Python را نصب کنید و دوباره اجرا کنید
    pause
    exit /b 1
)

echo ✅ Git و Python موجود هستند
echo.

REM ایجاد فایل‌های ضروری
echo 📝 در حال ایجاد فایل‌های ضروری...

REM ایجاد .gitignore
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

REM ایجاد README.md
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

echo ✅ فایل‌های ضروری ایجاد شدند
echo.

REM آماده‌سازی Git
echo 🔧 در حال آماده‌سازی Git...
if not exist ".git" (
    git init
    echo ✅ Git repository ایجاد شد
) else (
    echo ✅ Git repository موجود است
)

git add .
git commit -m "Initial commit - Special Ad Member Bot"
echo ✅ فایل‌ها commit شدند

echo.
echo 🚀 **شروع استقرار خودکار...**
echo.

echo 📝 **مرحله 1: ایجاد Repository در GitHub**
echo در حال باز کردن GitHub...
start https://github.com/new

echo.
echo ⚠️ **دستورالعمل GitHub:**
echo 1. نام Repository: special-ad-member-bot
echo 2. Description: Special Ad Member Bot - Advanced Telegram Member Adder
echo 3. Public را انتخاب کنید
echo 4. "Create repository" کلیک کنید
echo.

set /p github_done="آیا Repository ایجاد شد؟ (Y/N): "

if /i "%github_done%"=="Y" (
    echo.
    echo ✅ Repository ایجاد شد
    echo.
    
    echo 📤 **مرحله 2: آپلود فایل‌ها**
    echo.
    echo لطفا نام کاربری GitHub خود را وارد کنید:
    set /p github_username="نام کاربری GitHub: "
    
    echo در حال تنظیم remote...
    git remote add origin https://github.com/%github_username%/special-ad-member-bot.git
    
    echo در حال آپلود فایل‌ها...
    git push -u origin main
    
    if errorlevel 1 (
        echo ❌ خطا در آپلود فایل‌ها
        echo لطفا نام کاربری را بررسی کنید
        pause
        exit /b 1
    )
    
    echo ✅ فایل‌ها با موفقیت آپلود شدند
    echo.
    
    echo 🌐 **مرحله 3: استقرار روی Railway**
    echo در حال باز کردن Railway...
    start https://railway.app
    
    echo.
    echo ⚠️ **دستورالعمل Railway:**
    echo 1. با GitHub وارد شوید
    echo 2. "New Project" کلیک کنید
    echo 3. "Deploy from GitHub repo" انتخاب کنید
    echo 4. Repository special-ad-member-bot را انتخاب کنید
    echo 5. Branch: main
    echo 6. "Deploy Now" کلیک کنید
    echo.
    
    set /p railway_done="آیا Railway استقرار شد؟ (Y/N): "
    
    if /i "%railway_done%"=="Y" (
        echo.
        echo ✅ Railway استقرار شد
        echo.
        
        echo ⚙️ **مرحله 4: تنظیم متغیرهای محیطی**
        echo.
        echo در Railway، به بخش "Variables" بروید و این متغیرها را اضافه کنید:
        echo.
        echo TELEGRAM_API_ID=29003653
        echo TELEGRAM_API_HASH=522d9793d72a6829e34fed2a35cd46f6
        echo BOT_TOKEN=7861826109:AAF4ZOLn5UpGmxlsh0grbQ6STbGs5g2YL2E
        echo WEB_PORT=8080
        echo PYTHON_VERSION=3.11.7
        echo.
        echo Start Command: python web_panel_new.py
        echo.
        
        set /p vars_done="آیا متغیرها تنظیم شدند؟ (Y/N): "
        
        if /i "%vars_done%"=="Y" (
            echo.
            echo ✅ متغیرها تنظیم شدند
            echo.
            
            echo 🧪 **مرحله 5: تست ربات**
            echo.
            echo 📊 **اطلاعات دسترسی:**
            echo.
            echo 🌐 **پنل وب:**
            echo آدرس: https://your-app-name.railway.app
            echo نام کاربری: lord
            echo رمز عبور: lord2024
            echo.
            echo 📱 **ربات تلگرام:**
            echo Username: @special_ad_member_bot
            echo دستورات: /start, /status, /stats, /admin
            echo.
            
            echo 🎉 **تبریک! ربات شما آماده است!**
            echo.
            echo ✅ ربات 24/7 فعال خواهد بود
            echo ✅ از طریق پنل وب قابل مدیریت است
            echo ✅ از طریق ربات تلگرام قابل کنترل است
            echo ✅ آمار کامل و لاگ‌های دقیق دارد
            echo.
            
            echo 📞 **پشتیبانی:**
            echo - سازنده: @Lord4626
            echo - پشتیبانی: @I89I89I840
            echo.
            
            echo 🚀 **مرحله بعدی:**
            echo 1. پنل وب را تست کنید
            echo 2. ربات تلگرام را تست کنید
            echo 3. اکانت‌ها را در accounts_new.json تنظیم کنید
            echo 4. گروه‌ها را در config_new.json تنظیم کنید
            echo.
            
        ) else (
            echo ❌ متغیرها تنظیم نشدند
        )
        
    ) else (
        echo ❌ Railway استقرار نشد
    )
    
) else (
    echo ❌ Repository ایجاد نشد
)

echo.
echo 📚 **فایل‌های مفید:**
echo - RAILWAY_DEPLOYMENT.md (راهنمای کامل)
echo - DEPLOYMENT_GUIDE.md (راهنمای عمومی)
echo - SYSTEM_ANALYSIS.md (تحلیل سیستم)
echo.

echo 🎯 **برای شروع مجدد، این فایل را دوباره اجرا کنید**
echo.

pause 