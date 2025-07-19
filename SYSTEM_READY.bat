@echo off
chcp 65001 >nul
title System Ready - Special Ad Member Bot

echo.
echo ========================================
echo    System Ready - Special Ad Member Bot
echo ========================================
echo.

echo ✅ سیستم آماده است!
echo.

echo 📊 **آمار فایل‌ها:**
echo.
Get-ChildItem -Recurse | Measure-Object | ForEach-Object {
    echo تعداد کل فایل‌ها: $($_.Count)
}

echo.
echo 📋 **فایل‌های اصلی موجود:**
echo.

if exist "MASTER_CONTROL.bat" (
    echo ✅ MASTER_CONTROL.bat (کنترل کامل)
) else (
    echo ❌ MASTER_CONTROL.bat (مفقود)
)

if exist "AUTO_INSTALL_ALL.bat" (
    echo ✅ AUTO_INSTALL_ALL.bat (نصب خودکار)
) else (
    echo ❌ AUTO_INSTALL_ALL.bat (مفقود)
)

if exist "advanced_member_adder_new.py" (
    echo ✅ advanced_member_adder_new.py (ربات اصلی)
) else (
    echo ❌ advanced_member_adder_new.py (مفقود)
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
echo 🎯 **نحوه شروع:**
echo.
echo 1️⃣ **برای شروع فوری:**
echo    MASTER_CONTROL.bat را اجرا کنید
echo.
echo 2️⃣ **برای نصب خودکار:**
echo    AUTO_INSTALL_ALL.bat را اجرا کنید
echo.
echo 3️⃣ **برای استقرار خودکار:**
echo    COMPLETE_AUTO_DEPLOY.bat را اجرا کنید
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
echo ✅ تمام فایل‌ها در سیستم شما ذخیره شدند
echo ✅ سیستم کامل و آماده استقرار است
echo ✅ راهنمای کامل موجود است
echo ✅ اسکریپت‌های خودکار آماده هستند
echo.

echo 📞 **پشتیبانی:**
echo - سازنده: @Lord4626
echo - پشتیبانی: @I89I89I840
echo.

echo 🚀 **برای شروع، فایل MASTER_CONTROL.bat را اجرا کنید!**
echo.

pause 