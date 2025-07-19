# راهنمای استقرار خودکار روی Railway

## 🚀 مرحله 1: آماده‌سازی فایل‌ها

### فایل‌های موجود در پروژه شما:
✅ `advanced_member_adder_new.py` - ربات اصلی
✅ `telegram_bot_manager_new.py` - ربات مدیریتی
✅ `web_panel_new.py` - پنل وب
✅ `config_new.json` - تنظیمات
✅ `accounts_new.json` - اکانت‌ها
✅ `requirements_new.txt` - کتابخانه‌ها
✅ `requirements_web.txt` - کتابخانه‌های وب
✅ `Procfile` - فایل استقرار
✅ `runtime.txt` - نسخه Python

## 🎯 مرحله 2: ایجاد Repository در GitHub

### مرحله 1: ایجاد Repository جدید
1. به https://github.com بروید
2. روی "New repository" کلیک کنید
3. نام Repository: `special-ad-member-bot`
4. Public را انتخاب کنید
5. "Create repository" کلیک کنید

### مرحله 2: آپلود فایل‌ها
```bash
# در پوشه پروژه شما
git init
git add .
git commit -m "Initial commit - Special Ad Member Bot"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/special-ad-member-bot.git
git push -u origin main
```

## 🌐 مرحله 3: استقرار روی Railway

### مرحله 1: ورود به Railway
1. به https://railway.app بروید
2. با GitHub حساب کاربری ایجاد کنید
3. روی "New Project" کلیک کنید

### مرحله 2: اتصال Repository
1. "Deploy from GitHub repo" را انتخاب کنید
2. Repository `special-ad-member-bot` را انتخاب کنید
3. Branch `main` را انتخاب کنید
4. روی "Deploy Now" کلیک کنید

### مرحله 3: تنظیم متغیرهای محیطی
1. به بخش "Variables" بروید
2. متغیرهای زیر را اضافه کنید:

```env
TELEGRAM_API_ID=29003653
TELEGRAM_API_HASH=522d9793d72a6829e34fed2a35cd46f6
BOT_TOKEN=7861826109:AAF4ZOLn5UpGmxlsh0grbQ6STbGs5g2YL2E
WEB_PORT=8080
PYTHON_VERSION=3.11.7
```

### مرحله 4: تنظیم Start Command
1. به بخش "Settings" بروید
2. "Start Command" را پیدا کنید
3. این دستور را وارد کنید:
```bash
python web_panel_new.py
```

### مرحله 5: استقرار
1. روی "Deploy" کلیک کنید
2. منتظر بمانید تا استقرار کامل شود
3. آدرس URL را کپی کنید

## 📊 مرحله 4: تست و بررسی

### بررسی لاگ‌ها
1. در Railway به بخش "Deployments" بروید
2. روی آخرین deployment کلیک کنید
3. لاگ‌ها را بررسی کنید

### تست پنل وب
1. آدرس URL را در مرورگر باز کنید
2. با اطلاعات زیر وارد شوید:
   - نام کاربری: `lord`
   - رمز عبور: `lord2024`

### تست ربات تلگرام
1. ربات @special_ad_member_bot را پیدا کنید
2. دستور `/start` را ارسال کنید
3. دستور `/status` را برای بررسی وضعیت ارسال کنید

## 🔧 عیب‌یابی

### مشکل 1: خطای "Module not found"
**راه حل:**
```bash
# در Railway Variables اضافه کنید:
PIP_TARGET=./packages
```

### مشکل 2: خطای "Port already in use"
**راه حل:**
```bash
# در Start Command تغییر دهید:
python web_panel_new.py --port $PORT
```

### مشکل 3: خطای "Telegram API"
**راه حل:**
1. API_ID و API_HASH را بررسی کنید
2. اکانت‌ها را در `accounts_new.json` تنظیم کنید

## 📱 دسترسی‌ها

### پنل وب
- **آدرس:** https://your-app-name.railway.app
- **نام کاربری:** lord
- **رمز عبور:** lord2024

### ربات تلگرام
- **Username:** @special_ad_member_bot
- **دستورات:** /start, /status, /stats, /admin

## 🎯 دستورات مفید

### در Railway Dashboard:
- **View Logs:** مشاهده لاگ‌ها
- **Redeploy:** استقرار مجدد
- **Variables:** تنظیم متغیرها
- **Settings:** تنظیمات پروژه

### در ربات تلگرام:
- `/start` - شروع ربات
- `/status` - وضعیت ربات
- `/stats` - آمار کامل
- `/admin` - پنل مدیریتی
- `/help` - راهنما

## 🚨 نکات مهم

### امنیت:
1. رمز عبور پیش‌فرض را تغییر دهید
2. API keys را محافظت کنید
3. لاگ‌ها را مرتب بررسی کنید

### عملکرد:
1. محدودیت‌های Railway را در نظر بگیرید
2. لاگ‌ها را مرتب پاک کنید
3. آمار استفاده را بررسی کنید

### پشتیبانی:
- **سازنده:** @Lord4626
- **پشتیبانی:** @I89I89I840
- **ایمیل:** mohibaddindaife@gmail.com

## 🎉 نتیجه‌گیری

پس از تکمیل مراحل بالا:
- ✅ ربات شما 24/7 فعال خواهد بود
- ✅ از طریق پنل وب قابل مدیریت است
- ✅ از طریق ربات تلگرام قابل کنترل است
- ✅ آمار کامل و لاگ‌های دقیق دارد
- ✅ امن و پایدار است

**نکته:** Railway رایگان است اما محدودیت 500 ساعت در ماه دارد. برای استفاده بیشتر، به پلن‌های پولی ارتقا دهید. 