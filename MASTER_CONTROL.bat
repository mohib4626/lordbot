@echo off
chcp 65001 >nul
title Master Control - Special Ad Member Bot

echo.
echo ========================================
echo    Master Control - Special Ad Member Bot
echo ========================================
echo.

echo 🚀 کنترل کامل سیستم ربات ادممبر
echo.

echo 📋 **عملیات موجود:**
echo.
echo 1️⃣ نصب خودکار تمام پیش‌نیازها
echo 2️⃣ راه‌اندازی کامل سیستم
echo 3️⃣ استقرار خودکار روی سرور
echo 4️⃣ اجرای محلی ربات
echo 5️⃣ اجرای پنل وب
echo 6️⃣ بررسی نهایی سیستم
echo 7️⃣ نمایش تمام فایل‌ها
echo 8️⃣ راهنمای کامل
echo.

echo 🎯 **انتخاب کنید:**
echo.
echo 1. نصب خودکار (AUTO_INSTALL_ALL.bat)
echo 2. راه‌اندازی کامل (FULL_SYSTEM_SETUP.bat)
echo 3. استقرار خودکار (COMPLETE_AUTO_DEPLOY.bat)
echo 4. اجرای محلی (start_complete_system.bat)
echo 5. اجرای پنل وب (start_web_panel.bat)
echo 6. بررسی نهایی (FINAL_CHECK.bat)
echo 7. نمایش فایل‌ها (ALL_FILES_READY.bat)
echo 8. راهنمای کامل (RAILWAY_DEPLOYMENT.md)
echo.

set /p choice="لطفا عدد مورد نظر را وارد کنید (1-8): "

if "%choice%"=="1" (
    echo.
    echo 🚀 اجرای نصب خودکار...
    call AUTO_INSTALL_ALL.bat
) else if "%choice%"=="2" (
    echo.
    echo 🚀 اجرای راه‌اندازی کامل...
    call FULL_SYSTEM_SETUP.bat
) else if "%choice%"=="3" (
    echo.
    echo 🚀 اجرای استقرار خودکار...
    call COMPLETE_AUTO_DEPLOY.bat
) else if "%choice%"=="4" (
    echo.
    echo 🚀 اجرای محلی...
    call start_complete_system.bat
) else if "%choice%"=="5" (
    echo.
    echo 🚀 اجرای پنل وب...
    call start_web_panel.bat
) else if "%choice%"=="6" (
    echo.
    echo 🚀 بررسی نهایی...
    call FINAL_CHECK.bat
) else if "%choice%"=="7" (
    echo.
    echo 🚀 نمایش فایل‌ها...
    call ALL_FILES_READY.bat
) else if "%choice%"=="8" (
    echo.
    echo 🚀 باز کردن راهنمای کامل...
    start RAILWAY_DEPLOYMENT.md
) else (
    echo.
    echo ❌ انتخاب نامعتبر
    echo لطفا عدد 1 تا 8 را وارد کنید
    echo.
    pause
    exit /b 1
)

echo.
echo ✅ عملیات با موفقیت انجام شد
echo.

echo 📚 **فایل‌های مفید:**
echo - RAILWAY_DEPLOYMENT.md (راهنمای Railway)
echo - DEPLOYMENT_GUIDE.md (راهنمای عمومی)
echo - SYSTEM_ANALYSIS.md (تحلیل سیستم)
echo.

echo 🎯 **برای شروع مجدد، این فایل را دوباره اجرا کنید**
echo.

pause 