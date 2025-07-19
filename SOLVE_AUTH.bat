@echo off
chcp 65001 >nul
title Solve GitHub Auth - Special Ad Member Bot

echo.
echo ========================================
echo    Solve GitHub Auth - Special Ad Member Bot
echo ========================================
echo.

echo 🔐 حل مشکل احراز هویت GitHub
echo.

echo 📋 **مشکل:**
echo - GitHub دیگر از رمز عبور پشتیبانی نمی‌کند
echo - نیاز به Personal Access Token است
echo - خطای 401 Unauthorized
echo.

echo 🎯 **راه حل:**
echo.

echo 1️⃣ **حذف remote موجود:**
echo.
cd "ربات ادممبر جدید"
echo مسیر فعلی:
cd
echo.

echo در حال حذف remote موجود...
git remote remove origin
echo ✅ remote حذف شد
echo.

echo 2️⃣ **ایجاد Personal Access Token:**
echo در حال باز کردن GitHub Settings...
start https://github.com/settings/tokens/new

echo.
echo ⚠️ **دستورالعمل ایجاد Token:**
echo.
echo 📝 **تنظیمات Token:**
echo Note: special-ad-member-bot-token
echo Expiration: 90 days
echo Scopes: repo (full control of private repositories)
echo.
echo ✅ **مراحل:**
echo 1. "Generate new token (classic)" کلیک کنید
echo 2. Note را وارد کنید: special-ad-member-bot-token
echo 3. Expiration: 90 days انتخاب کنید
echo 4. Scopes: repo ✓ تیک بزنید
echo 5. "Generate token" کلیک کنید
echo 6. Token را کپی کنید (مهم!)
echo.

set /p token_created="آیا Token ایجاد و کپی شد؟ (Y/N): "

if /i "%token_created%"=="Y" (
    echo.
    echo ✅ Token ایجاد شد
    echo.
    
    echo 3️⃣ **تنظیم remote با Token:**
    echo.
    echo نام کاربری: mohib4626
    echo Repository: special-ad-member-bot
    echo آدرس: https://github.com/mohib4626/special-ad-member-bot
    echo.
    
    echo در حال تنظیم remote جدید...
    git remote add origin https://github.com/mohib4626/special-ad-member-bot.git
    echo ✅ remote تنظیم شد
    echo.
    
    echo 4️⃣ **آپلود فایل‌ها:**
    echo.
    echo در حال آماده‌سازی Git...
    git add .
    git commit -m "Update - Special Ad Member Bot"
    
    echo در حال آپلود...
    echo ⚠️ **هنگام درخواست رمز عبور، Token را وارد کنید**
    echo.
    git push -u origin main
    
    if errorlevel 1 (
        echo ❌ خطا در آپلود فایل‌ها
        echo لطفا Token را بررسی کنید
        pause
        exit /b 1
    )
    
    echo ✅ فایل‌ها با موفقیت آپلود شدند
    echo.
    
    echo 5️⃣ **استقرار روی Railway:**
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
        
        echo 6️⃣ **تنظیم متغیرها:**
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
    echo ❌ Token ایجاد نشد
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