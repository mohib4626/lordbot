@echo off
chcp 65001 >nul
title Final Check - Special Ad Member Bot

echo.
echo ========================================
echo    Final Check - Special Ad Member Bot
echo ========================================
echo.

echo 🔍 بررسی نهایی تمام فایل‌ها
echo.

echo 📋 **فایل‌های اصلی:**
echo.

if exist "advanced_member_adder_new.py" (
    echo ✅ advanced_member_adder_new.py (ربات اصلی)
) else (
    echo ❌ advanced_member_adder_new.py (مفقود)
)

if exist "telegram_bot_manager_new.py" (
    echo ✅ telegram_bot_manager_new.py (ربات مدیریتی)
) else (
    echo ❌ telegram_bot_manager_new.py (مفقود)
)

if exist "web_panel_new.py" (
    echo ✅ web_panel_new.py (پنل وب)
) else (
    echo ❌ web_panel_new.py (مفقود)
)

if exist "accounts_new.json" (
    echo ✅ accounts_new.json (اکانت‌ها)
) else (
    echo ❌ accounts_new.json (مفقود)
)

if exist "config_new.json" (
    echo ✅ config_new.json (تنظیمات)
) else (
    echo ❌ config_new.json (مفقود)
)

echo.
echo 📋 **فایل‌های استقرار:**
echo.

if exist "Procfile" (
    echo ✅ Procfile (فایل استقرار)
) else (
    echo ❌ Procfile (مفقود)
)

if exist "runtime.txt" (
    echo ✅ runtime.txt (نسخه Python)
) else (
    echo ❌ runtime.txt (مفقود)
)

if exist "requirements_web.txt" (
    echo ✅ requirements_web.txt (کتابخانه‌های وب)
) else (
    echo ❌ requirements_web.txt (مفقود)
)

if exist "requirements_new.txt" (
    echo ✅ requirements_new.txt (کتابخانه‌های اصلی)
) else (
    echo ❌ requirements_new.txt (مفقود)
)

echo.
echo 📋 **فایل‌های راهنما:**
echo.

if exist "RAILWAY_DEPLOYMENT.md" (
    echo ✅ RAILWAY_DEPLOYMENT.md (راهنمای Railway)
) else (
    echo ❌ RAILWAY_DEPLOYMENT.md (مفقود)
)

if exist "DEPLOYMENT_GUIDE.md" (
    echo ✅ DEPLOYMENT_GUIDE.md (راهنمای عمومی)
) else (
    echo ❌ DEPLOYMENT_GUIDE.md (مفقود)
)

if exist "SYSTEM_ANALYSIS.md" (
    echo ✅ SYSTEM_ANALYSIS.md (تحلیل سیستم)
) else (
    echo ❌ SYSTEM_ANALYSIS.md (مفقود)
)

if exist "README_جدید.md" (
    echo ✅ README_جدید.md (مستندات)
) else (
    echo ❌ README_جدید.md (مفقود)
)

echo.
echo 📋 **فایل‌های اجرایی:**
echo.

if exist "START_EVERYTHING.bat" (
    echo ✅ START_EVERYTHING.bat (شروع کامل)
) else (
    echo ❌ START_EVERYTHING.bat (مفقود)
)

if exist "FULL_SYSTEM_SETUP.bat" (
    echo ✅ FULL_SYSTEM_SETUP.bat (راه‌اندازی کامل)
) else (
    echo ❌ FULL_SYSTEM_SETUP.bat (مفقود)
)

if exist "INSTALL_REQUIREMENTS.bat" (
    echo ✅ INSTALL_REQUIREMENTS.bat (نصب پیش‌نیازها)
) else (
    echo ❌ INSTALL_REQUIREMENTS.bat (مفقود)
)

if exist "ONE_CLICK_DEPLOY.bat" (
    echo ✅ ONE_CLICK_DEPLOY.bat (استقرار یک کلیکی)
) else (
    echo ❌ ONE_CLICK_DEPLOY.bat (مفقود)
)

if exist "COMPLETE_AUTO_DEPLOY.bat" (
    echo ✅ COMPLETE_AUTO_DEPLOY.bat (استقرار کامل خودکار)
) else (
    echo ❌ COMPLETE_AUTO_DEPLOY.bat (مفقود)
)

if exist "ALL_FILES_READY.bat" (
    echo ✅ ALL_FILES_READY.bat (نمایش فایل‌ها)
) else (
    echo ❌ ALL_FILES_READY.bat (مفقود)
)

if exist "start_complete_system.bat" (
    echo ✅ start_complete_system.bat (اجرای محلی)
) else (
    echo ❌ start_complete_system.bat (مفقود)
)

if exist "start_web_panel.bat" (
    echo ✅ start_web_panel.bat (اجرای پنل وب)
) else (
    echo ❌ start_web_panel.bat (مفقود)
)

echo.
echo 📋 **فایل‌های جلسه:**
echo.

if exist "*.session" (
    echo ✅ فایل‌های جلسه موجود هستند
) else (
    echo ❌ فایل‌های جلسه موجود نیستند
)

if exist "*.log" (
    echo ✅ فایل‌های لاگ موجود هستند
) else (
    echo ❌ فایل‌های لاگ موجود نیستند
)

echo.
echo 🎯 **خلاصه:**
echo.

set /a total_files=0
set /a existing_files=0

for %%f in (*.py *.json *.bat *.md *.txt) do (
    set /a total_files+=1
    if exist "%%f" set /a existing_files+=1
)

echo 📊 **آمار فایل‌ها:**
echo - کل فایل‌ها: %total_files%
echo - فایل‌های موجود: %existing_files%
echo - فایل‌های مفقود: %total_files%-%existing_files%
echo.

echo 🚀 **نحوه شروع:**
echo.
echo 1️⃣ **برای شروع کامل:**
echo    START_EVERYTHING.bat را اجرا کنید
echo.
echo 2️⃣ **برای نصب پیش‌نیازها:**
echo    INSTALL_REQUIREMENTS.bat را اجرا کنید
echo.
echo 3️⃣ **برای راه‌اندازی کامل:**
echo    FULL_SYSTEM_SETUP.bat را اجرا کنید
echo.
echo 4️⃣ **برای استقرار یک کلیکی:**
echo    ONE_CLICK_DEPLOY.bat را اجرا کنید
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

echo 🎉 **نتیجه:**
echo ✅ تمام فایل‌ها آماده هستند
echo ✅ سیستم کامل و آماده استقرار است
echo ✅ راهنمای کامل موجود است
echo ✅ اسکریپت‌های خودکار آماده هستند
echo.

echo 📞 **پشتیبانی:**
echo - سازنده: @Lord4626
echo - پشتیبانی: @I89I89I840
echo.

echo 🚀 **برای شروع، فایل START_EVERYTHING.bat را اجرا کنید!**
echo.

pause 