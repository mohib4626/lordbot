@echo off
chcp 65001 >nul
title Create Repository First - Special Ad Member Bot

echo.
echo ========================================
echo    Create Repository First - Special Ad Member Bot
echo ========================================
echo.

echo 🚨 **مشکل:** Repository هنوز ایجاد نشده است
echo.

echo 📋 **اطلاعات:**
echo نام کاربری GitHub: mohib4626
echo ایمیل: mohibaddinsaife@gmail.com
echo Repository: special-ad-member-bot
echo.

echo 🎯 **مراحل ایجاد Repository:**
echo.

echo 1️⃣ **ورود به GitHub:**
echo در حال باز کردن GitHub...
start https://github.com/login

echo.
echo ⚠️ **دستورالعمل ورود:**
echo 1. نام کاربری: mohib4626
echo 2. رمز عبور: [رمز عبور خود را وارد کنید]
echo 3. "Sign in" کلیک کنید
echo.

set /p login_done="آیا وارد شدید؟ (Y/N): "

if /i "%login_done%"=="Y" (
    echo.
    echo ✅ ورود موفق
    echo.
    
    echo 2️⃣ **ایجاد Repository جدید:**
    echo در حال باز کردن صفحه ایجاد Repository...
    start https://github.com/new
    
    echo.
    echo ⚠️ **دستورالعمل ایجاد Repository:**
    echo.
    echo 📝 **اطلاعات Repository:**
    echo Repository name: special-ad-member-bot
    echo Description: Special Ad Member Bot - Advanced Telegram Member Adder
    echo Visibility: Public
    echo.
    echo ✅ **تنظیمات اضافی:**
    echo - Add a README file: ✓
    echo - Add .gitignore: Python
    echo - Choose a license: MIT License
    echo.
    echo 4. "Create repository" کلیک کنید
    echo.
    
    set /p repo_done="آیا Repository ایجاد شد؟ (Y/N): "
    
    if /i "%repo_done%"=="Y" (
        echo.
        echo ✅ Repository ایجاد شد
        echo.
        
        echo 3️⃣ **تأیید Repository:**
        echo در حال باز کردن Repository...
        start https://github.com/mohib4626/special-ad-member-bot
        
        echo.
        echo ⚠️ **بررسی کنید:**
        echo 1. Repository باز شد؟
        echo 2. نام صحیح است؟
        echo 3. Public است؟
        echo.
        
        set /p confirm_repo="آیا Repository صحیح است؟ (Y/N): "
        
        if /i "%confirm_repo%"=="Y" (
            echo.
            echo ✅ Repository تأیید شد
            echo.
            
            echo 4️⃣ **آپلود فایل‌ها:**
            echo.
            echo نام کاربری: mohib4626
            echo ایمیل: mohibaddinsaife@gmail.com
            echo Repository: special-ad-member-bot
            echo آدرس: https://github.com/mohib4626/special-ad-member-bot
            echo.
            
            echo در حال انتقال به پوشه پروژه...
            cd "ربات ادممبر جدید"
            echo مسیر فعلی:
            cd
            echo.
            
            echo در حال تنظیم Git...
            git config --global user.name "mohib4626"
            git config --global user.email "mohibaddinsaife@gmail.com"
            echo ✅ تنظیمات Git انجام شد
            echo.
            
            echo در حال آماده‌سازی Git...
            git init
            git add .
            git commit -m "Initial commit - Special Ad Member Bot"
            
            echo در حال تنظیم remote...
            git remote add origin https://github.com/mohib4626/special-ad-member-bot.git
            git branch -M main
            git push -u origin main
            
            if errorlevel 1 (
                echo ❌ خطا در آپلود فایل‌ها
                echo لطفا نام کاربری و رمز عبور را بررسی کنید
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
            echo ❌ Repository تأیید نشد
        )
        
    ) else (
        echo ❌ Repository ایجاد نشد
    )
    
) else (
    echo ❌ ورود ناموفق
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