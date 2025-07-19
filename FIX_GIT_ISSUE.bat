@echo off
chcp 65001 >nul
title Fix Git Issue - Special Ad Member Bot

echo.
echo ========================================
echo    Fix Git Issue - Special Ad Member Bot
echo ========================================
echo.

echo 🔧 حل مشکل Git
echo.

echo 📋 **مشکل:**
echo - تنظیمات Git ناقص است
echo - نام کاربری GitHub خالی است
echo - ایمیل تنظیم نشده است
echo.

echo 🎯 **راه حل:**
echo.

echo 1️⃣ **تنظیم Git:**
echo.
set /p git_username="نام کاربری Git خود را وارد کنید: "
set /p git_email="ایمیل Git خود را وارد کنید: "

git config --global user.name "%git_username%"
git config --global user.email "%git_email%"

echo ✅ تنظیمات Git انجام شد
echo.

echo 2️⃣ **ایجاد Repository در GitHub:**
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
    
    echo 3️⃣ **آپلود فایل‌ها:**
    echo.
    echo لطفا نام کاربری GitHub خود را وارد کنید:
    set /p github_username="نام کاربری GitHub: "
    
    echo در حال آماده‌سازی Git...
    git init
    git add .
    git commit -m "Initial commit - Special Ad Member Bot"
    
    echo در حال تنظیم remote...
    git remote add origin https://github.com/%github_username%/special-ad-member-bot.git
    git branch -M main
    git push -u origin main
    
    if errorlevel 1 (
        echo ❌ خطا در آپلود فایل‌ها
        echo لطفا نام کاربری را بررسی کنید
        pause
        exit /b 1
    )
    
    echo ✅ فایل‌ها با موفقیت آپلود شدند
    echo.
    
    echo 4️⃣ **استقرار روی Railway:**
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
        
        echo 5️⃣ **تنظیم متغیرهای محیطی:**
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
            
            echo 🧪 **تست ربات:**
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
echo - RAILWAY_DEPLOYMENT.md (راهنمای Railway)
echo - DEPLOYMENT_GUIDE.md (راهنمای عمومی)
echo - SYSTEM_ANALYSIS.md (تحلیل سیستم)
echo.

echo 🎯 **برای شروع مجدد، این فایل را دوباره اجرا کنید**
echo.

pause 