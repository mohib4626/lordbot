# راهنمای کامل استقرار ربات ادممبر

## 🚀 سرورهای رایگان پیشنهادی

### 1. **Railway.app** (پیشنهاد اول)
- **مزایا:** رایگان، بدون محدودیت زمانی، پشتیبانی از Python
- **آدرس:** https://railway.app
- **محدودیت:** 500 ساعت در ماه رایگان
- **نحوه استفاده:** اتصال مستقیم به GitHub

### 2. **Render.com** (پیشنهاد دوم)
- **مزایا:** رایگان، پشتیبانی از Web Services
- **آدرس:** https://render.com
- **محدودیت:** 750 ساعت در ماه رایگان
- **نحوه استفاده:** اتصال به GitHub Repository

### 3. **Heroku** (پیشنهاد سوم)
- **مزایا:** پلتفرم معتبر، پشتیبانی کامل
- **آدرس:** https://heroku.com
- **محدودیت:** 550 ساعت در ماه رایگان
- **نحوه استفاده:** Heroku CLI یا GitHub Integration

### 4. **PythonAnywhere** (پیشنهاد چهارم)
- **مزایا:** مخصوص Python، رایگان
- **آدرس:** https://www.pythonanywhere.com
- **محدودیت:** 512MB RAM، 1GB Storage
- **نحوه استفاده:** آپلود فایل‌ها

## 📋 مراحل استقرار

### مرحله 1: آماده‌سازی فایل‌ها

```bash
# ساختار فایل‌های مورد نیاز
ربات ادممبر جدید/
├── advanced_member_adder_new.py
├── telegram_bot_manager_new.py
├── web_panel_new.py
├── config_new.json
├── accounts_new.json
├── requirements_new.txt
├── requirements_web.txt
├── Procfile
├── runtime.txt
└── README_جدید.md
```

### مرحله 2: ایجاد فایل‌های استقرار

#### Procfile (برای Heroku/Railway)
```
worker: python advanced_member_adder_new.py
web: python web_panel_new.py
bot: python telegram_bot_manager_new.py
```

#### runtime.txt
```
python-3.11.7
```

### مرحله 3: تنظیم متغیرهای محیطی

```bash
# متغیرهای مورد نیاز
TELEGRAM_API_ID=29003653
TELEGRAM_API_HASH=522d9793d72a6829e34fed2a35cd46f6
BOT_TOKEN=7861826109:AAF4ZOLn5UpGmxlsh0grbQ6STbGs5g2YL2E
WEB_PORT=8080
```

## 🎯 راهنمای استقرار روی Railway

### مرحله 1: ایجاد حساب کاربری
1. به https://railway.app بروید
2. با GitHub حساب کاربری ایجاد کنید
3. روی "New Project" کلیک کنید

### مرحله 2: اتصال Repository
1. "Deploy from GitHub repo" را انتخاب کنید
2. Repository خود را انتخاب کنید
3. Branch اصلی را انتخاب کنید

### مرحله 3: تنظیم متغیرها
1. به بخش "Variables" بروید
2. متغیرهای زیر را اضافه کنید:

```env
TELEGRAM_API_ID=29003653
TELEGRAM_API_HASH=522d9793d72a6829e34fed2a35cd46f6
BOT_TOKEN=7861826109:AAF4ZOLn5UpGmxlsh0grbQ6STbGs5g2YL2E
WEB_PORT=8080
PYTHON_VERSION=3.11.7
```

### مرحله 4: تنظیم Commands
1. به بخش "Settings" بروید
2. "Start Command" را تنظیم کنید:

```bash
python web_panel_new.py
```

## 🌐 راهنمای استقرار روی Render

### مرحله 1: ایجاد حساب کاربری
1. به https://render.com بروید
2. با GitHub حساب کاربری ایجاد کنید
3. "New Web Service" را انتخاب کنید

### مرحله 2: اتصال Repository
1. Repository خود را انتخاب کنید
2. Branch اصلی را انتخاب کنید
3. "Python 3" را به عنوان Runtime انتخاب کنید

### مرحله 3: تنظیم Build Command
```bash
pip install -r requirements_new.txt && pip install -r requirements_web.txt
```

### مرحله 4: تنظیم Start Command
```bash
python web_panel_new.py
```

## 🔧 راهنمای استقرار روی Heroku

### مرحله 1: نصب Heroku CLI
```bash
# Windows
winget install --id=Heroku.HerokuCLI

# یا دانلود از https://devcenter.heroku.com/articles/heroku-cli
```

### مرحله 2: ورود به Heroku
```bash
heroku login
```

### مرحله 3: ایجاد App
```bash
heroku create your-bot-name
```

### مرحله 4: تنظیم متغیرها
```bash
heroku config:set TELEGRAM_API_ID=29003653
heroku config:set TELEGRAM_API_HASH=522d9793d72a6829e34fed2a35cd46f6
heroku config:set BOT_TOKEN=7861826109:AAF4ZOLn5UpGmxlsh0grbQ6STbGs5g2YL2E
heroku config:set WEB_PORT=8080
```

### مرحله 5: استقرار
```bash
git add .
git commit -m "Initial deployment"
git push heroku main
```

## 📊 مانیتورینگ و مدیریت

### دسترسی به پنل وب
- **آدرس:** https://your-app-name.railway.app
- **نام کاربری:** lord
- **رمز عبور:** lord2024

### دسترسی به ربات تلگرام
- **Username:** @special_ad_member_bot
- **دستورات:** /start, /status, /stats, /admin

### لاگ‌ها و مانیتورینگ
```bash
# مشاهده لاگ‌ها در Railway
railway logs

# مشاهده لاگ‌ها در Heroku
heroku logs --tail

# مشاهده لاگ‌ها در Render
# از طریق Dashboard > Logs
```

## 🔒 امنیت و تنظیمات

### تغییر رمز عبور پیش‌فرض
1. فایل `web_panel_new.py` را باز کنید
2. خط 89 را پیدا کنید:
```python
password_hash = hashlib.sha256('lord2024'.encode()).hexdigest()
```
3. رمز عبور جدید را جایگزین کنید

### تنظیم SSL
- Railway: خودکار
- Render: خودکار
- Heroku: خودکار

### محدودیت‌های امنیتی
```json
{
  "security": {
    "daily_limit": 200,
    "hourly_limit": 50,
    "max_concurrent_accounts": 10,
    "cooldown_after_error": 300
  }
}
```

## 🚨 عیب‌یابی

### مشکلات رایج

#### 1. خطای "Module not found"
```bash
pip install -r requirements_new.txt
pip install -r requirements_web.txt
```

#### 2. خطای "Port already in use"
```bash
# تغییر پورت در config_new.json
"web_port": 8080
```

#### 3. خطای "Telegram API"
- بررسی صحت API_ID و API_HASH
- بررسی فعال بودن اکانت‌ها

#### 4. خطای "Database"
```bash
# حذف فایل دیتابیس و ایجاد مجدد
rm web_panel_new.db
```

## 📞 پشتیبانی

### اطلاعات تماس
- **سازنده:** @Lord4626
- **پشتیبانی:** @I89I89I840
- **ایمیل:** mohibaddindaife@gmail.com

### منابع مفید
- **مستندات Railway:** https://docs.railway.app
- **مستندات Render:** https://render.com/docs
- **مستندات Heroku:** https://devcenter.heroku.com

## 🎯 نتیجه‌گیری

پس از استقرار موفق، ربات شما:
- ✅ 24/7 فعال خواهد بود
- ✅ از طریق پنل وب قابل مدیریت است
- ✅ از طریق ربات تلگرام قابل کنترل است
- ✅ آمار کامل و لاگ‌های دقیق دارد
- ✅ امن و پایدار است

**نکته مهم:** حتماً محدودیت‌های سرور رایگان را در نظر بگیرید و در صورت نیاز به استفاده بیشتر، به پلن‌های پولی ارتقا دهید. 