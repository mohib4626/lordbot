@echo off
chcp 65001 >nul
title Instant Deploy - Special Ad Member Bot

echo.
echo ========================================
echo    Instant Deploy - Special Ad Member Bot
echo ========================================
echo.

echo 🚀 استقرار فوری ربات ادممبر
echo.

echo 📋 **مراحل استقرار:**
echo.
echo 1️⃣ **ایجاد Repository در GitHub**
echo 2️⃣ **آپلود فایل‌ها**
echo 3️⃣ **استقرار روی Railway**
echo 4️⃣ **تنظیم متغیرها**
echo 5️⃣ **تست ربات**
echo.

echo 🎯 **آیا آماده شروع هستید؟**
echo.
set /p choice="برای شروع، Y را فشار دهید: "

if /i "%choice%"=="Y" (
    echo.
    echo 🚀 شروع استقرار فوری...
    echo.
    
    echo 📝 **مرحله 1: ایجاد Repository در GitHub**
    echo در حال باز کردن GitHub...
    start https://github.com/new
    
    echo.
    echo ⚠️ **دستورالعمل:**
    echo 1. نام Repository: special-ad-member-bot
    echo 2. Description: Special Ad Member Bot
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
        echo در حال باز کردن Command Prompt...
        start cmd /k "cd /d %cd% && echo در حال آماده‌سازی Git... && echo. && echo دستورات زیر را اجرا کنید: && echo. && echo git init && echo git add . && echo git commit -m \"Initial commit\" && echo git branch -M main && echo git remote add origin https://github.com/YOUR_USERNAME/special-ad-member-bot.git && echo git push -u origin main && echo. && echo لطفا YOUR_USERNAME را با نام کاربری GitHub خود جایگزین کنید"
        
        echo.
        echo ⚠️ **دستورات Git:**
        echo git init
        echo git add .
        echo git commit -m "Initial commit"
        echo git branch -M main
        echo git remote add origin https://github.com/YOUR_USERNAME/special-ad-member-bot.git
        echo git push -u origin main
        echo.
        echo لطفا YOUR_USERNAME را با نام کاربری GitHub خود جایگزین کنید
        echo.
        
        set /p git_done="آیا فایل‌ها آپلود شدند؟ (Y/N): "
        
        if /i "%git_done%"=="Y" (
            echo.
            echo ✅ فایل‌ها آپلود شدند
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
                    echo 3. اکانت‌ها را تنظیم کنید
                    echo 4. گروه‌ها را تنظیم کنید
                    echo.
                    
                ) else (
                    echo ❌ متغیرها تنظیم نشدند
                )
                
            ) else (
                echo ❌ Railway استقرار نشد
            )
            
        ) else (
            echo ❌ فایل‌ها آپلود نشدند
        )
        
    ) else (
        echo ❌ Repository ایجاد نشد
    )
    
) else (
    echo ❌ استقرار لغو شد
)

echo.
echo 🚀 **مرحله بعدی:**
echo برای راهنمای کامل، فایل RAILWAY_DEPLOYMENT.md را مطالعه کنید
echo.
echo 📚 **فایل‌های مفید:**
echo - RAILWAY_DEPLOYMENT.md (راهنمای کامل)
echo - DEPLOYMENT_GUIDE.md (راهنمای عمومی)
echo - SYSTEM_ANALYSIS.md (تحلیل سیستم)
echo.

pause 