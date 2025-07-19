@echo off
chcp 65001 >nul
title Start Everything - Special Ad Member Bot

echo.
echo ========================================
echo    Start Everything - Special Ad Member Bot
echo ========================================
echo.

echo 🚀 راه‌اندازی کامل سیستم ربات ادممبر
echo.

echo 📋 **مراحل راه‌اندازی:**
echo.
echo 1️⃣ نصب پیش‌نیازها
echo 2️⃣ راه‌اندازی کامل سیستم
echo 3️⃣ استقرار خودکار
echo.

echo 🎯 **انتخاب کنید:**
echo.
echo 1. نصب پیش‌نیازها (INSTALL_REQUIREMENTS.bat)
echo 2. راه‌اندازی کامل سیستم (FULL_SYSTEM_SETUP.bat)
echo 3. استقرار یک کلیکی (ONE_CLICK_DEPLOY.bat)
echo 4. استقرار کامل خودکار (COMPLETE_AUTO_DEPLOY.bat)
echo 5. نمایش تمام فایل‌ها (ALL_FILES_READY.bat)
echo 6. اجرای محلی (start_complete_system.bat)
echo 7. اجرای پنل وب (start_web_panel.bat)
echo 8. بررسی نهایی (FINAL_CHECK.bat)
echo.

set /p choice="لطفا عدد مورد نظر را وارد کنید (1-8): "

if "%choice%"=="1" (
    echo.
    echo 🚀 اجرای نصب پیش‌نیازها...
    call INSTALL_REQUIREMENTS.bat
) else if "%choice%"=="2" (
    echo.
    echo 🚀 اجرای راه‌اندازی کامل سیستم...
    call FULL_SYSTEM_SETUP.bat
) else if "%choice%"=="3" (
    echo.
    echo 🚀 اجرای استقرار یک کلیکی...
    call ONE_CLICK_DEPLOY.bat
) else if "%choice%"=="4" (
    echo.
    echo 🚀 اجرای استقرار کامل خودکار...
    call COMPLETE_AUTO_DEPLOY.bat
) else if "%choice%"=="5" (
    echo.
    echo 🚀 نمایش تمام فایل‌ها...
    call ALL_FILES_READY.bat
) else if "%choice%"=="6" (
    echo.
    echo 🚀 اجرای محلی...
    call start_complete_system.bat
) else if "%choice%"=="7" (
    echo.
    echo 🚀 اجرای پنل وب...
    call start_web_panel.bat
) else if "%choice%"=="8" (
    echo.
    echo 🚀 بررسی نهایی...
    call FINAL_CHECK.bat
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