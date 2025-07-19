#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
ربات تلگرام مدیریتی جدید - New Telegram Bot Manager
پنل مدیریتی برای Lord و ادمین‌های دیگر
"""

import asyncio
import json
import logging
import os
from datetime import datetime
from telethon import TelegramClient, events
from telethon.tl.functions.messages import SendMessageRequest

# تنظیمات لاگینگ
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('telegram_bot_new.log', encoding='utf-8'),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger(__name__)

class NewTelegramBotManager:
    """مدیریت ربات تلگرام جدید"""
    
    def __init__(self):
        self.config = self.load_config()
        self.bot_client = None
        self.admin_users = self.config.get('monitoring', {}).get('admin_users', [])
        self.creator_id = self.config.get('monitoring', {}).get('creator_id', '')
        self.bot_token = self.config.get('monitoring', {}).get('bot_token', '')
        
        # اضافه کردن آیدی‌های مجاز
        self.allowed_users = [
            "Lord4626",
            "I89I89I840", 
            "7936340030",
            "7936340030"  # برای اطمینان
        ]
        self.admins = {
            'Lord4626': {
                'name': 'Lord',
                'role': 'creator',
                'permissions': ['all']
            },
            'I89I89I840': {
                'name': 'Support Admin',
                'role': 'support',
                'permissions': ['view', 'stats', 'logs']
            },
            '7936340030': {
                'name': 'User',
                'role': 'admin',
                'permissions': ['view', 'stats', 'logs', 'admin']
            }
        }
        
    def load_config(self):
        """بارگذاری تنظیمات"""
        try:
            with open('config_new.json', 'r', encoding='utf-8') as f:
                return json.load(f)
        except Exception as e:
            logger.error(f"خطا در بارگذاری تنظیمات: {e}")
            return {}
    
    async def start_bot(self):
        """شروع ربات تلگرام"""
        if not self.bot_token:
            logger.error("توکن ربات تنظیم نشده است!")
            return False
        
        try:
            self.bot_client = TelegramClient('bot_session_new', 29003653, '522d9793d72a6829e34fed2a35cd46f6')
            await self.bot_client.start(bot_token=self.bot_token)
            
            # تنظیم event handlers
            self.setup_handlers()
            
            logger.info("ربات تلگرام جدید شروع شد")
            return True
            
        except Exception as e:
            logger.error(f"خطا در شروع ربات تلگرام: {e}")
            return False
    
    def setup_handlers(self):
        """تنظیم event handlers"""
        
        @self.bot_client.on(events.NewMessage(pattern='/start'))
        async def start_handler(event):
            """دستور شروع"""
            user_id = str(event.sender_id)
            logger.info(f"User {user_id} trying to access bot")
            logger.info(f"Admin users: {self.admin_users}")
            logger.info(f"Creator ID: {self.creator_id}")
            if user_id in self.admin_users or user_id == self.creator_id:
                welcome_message = """🎯 **Special Ad Member Bot** فعال است!

🤖 **ربات ادممبر پیشرفته**
📊 **مدیریت و مانیتورینگ کامل**

**دستورات موجود:**
📈 `/status` - وضعیت ربات
📊 `/stats` - آمار کامل
⚙️ `/admin` - پنل مدیریتی
❓ `/help` - راهنما

**👑 سازنده:** @Lord4626
**🛠️ پشتیبانی:** @I89I89I840"""
                await event.respond(welcome_message)
            else:
                await event.respond("❌ شما مجاز به استفاده از این ربات نیستید!")
        
        @self.bot_client.on(events.NewMessage(pattern='/admin'))
        async def admin_handler(event):
            """دستور پنل مدیریتی"""
            user_id = str(event.sender_id)
            if user_id == self.creator_id:
                admin_panel = """👑 **پنل مدیریتی سازنده**

**🔧 مدیریت کامل:**
📱 `/accounts` - مدیریت اکانت‌ها
👥 `/admins` - مدیریت ادمین‌ها
📋 `/groups` - مدیریت گروه‌ها
⚙️ `/settings` - تنظیمات ربات
📝 `/logs` - لاگ‌های سیستم

**🎯 کنترل کامل ربات**"""
                await event.respond(admin_panel)
            elif user_id == "I89I89I840":
                support_panel = """🛠️ **پنل پشتیبانی**

**📊 مشاهده اطلاعات:**
📱 `/accounts` - مشاهده اکانت‌ها
📈 `/stats` - آمار ربات
📊 `/status` - وضعیت سیستم
📝 `/logs` - لاگ‌های اخیر

**🎯 دسترسی محدود برای پشتیبانی**"""
                await event.respond(support_panel)
            elif user_id in self.admin_users:
                await event.respond("⚙️ پنل مدیریتی ادمین:\n\n/accounts - مشاهده اکانت‌ها\n/stats - آمار\n/status - وضعیت\n/logs - لاگ‌ها")
            else:
                await event.respond("❌ شما مجاز به دسترسی به پنل مدیریتی نیستید!")
        
        @self.bot_client.on(events.NewMessage(pattern='/status'))
        async def status_handler(event):
            """دستور وضعیت"""
            user_id = str(event.sender_id)
            if user_id in self.admin_users or user_id == self.creator_id:
                status = self.get_bot_status()
                await event.respond(f"📊 وضعیت ربات:\n\n{status}")
            else:
                await event.respond("❌ شما مجاز به استفاده از این ربات نیستید!")
        
        @self.bot_client.on(events.NewMessage(pattern='/stats'))
        async def stats_handler(event):
            """دستور آمار"""
            user_id = str(event.sender_id)
            if user_id in self.admin_users or user_id == self.creator_id:
                stats = self.get_bot_stats()
                await event.respond(f"📈 آمار ربات:\n\n{stats}")
            else:
                await event.respond("❌ شما مجاز به استفاده از این ربات نیستید!")
        
        @self.bot_client.on(events.NewMessage(pattern='/accounts'))
        async def accounts_handler(event):
            """دستور مدیریت اکانت‌ها"""
            user_id = str(event.sender_id)
            if user_id == self.creator_id:
                accounts = self.get_accounts_info()
                await event.respond(f"📱 اطلاعات اکانت‌ها:\n\n{accounts}")
            elif user_id in self.admin_users:
                accounts_count = self.get_accounts_count()
                await event.respond(f"📱 تعداد اکانت‌های فعال: {accounts_count}")
            else:
                await event.respond("❌ شما مجاز به دسترسی به این بخش نیستید!")
        
        @self.bot_client.on(events.NewMessage(pattern='/admins'))
        async def admins_handler(event):
            """دستور مدیریت ادمین‌ها"""
            user_id = str(event.sender_id)
            if user_id == self.creator_id:
                admins = self.get_admins_info()
                await event.respond(f"👥 اطلاعات ادمین‌ها:\n\n{admins}")
            else:
                await event.respond("❌ فقط سازنده می‌تواند ادمین‌ها را مدیریت کند!")
        
        @self.bot_client.on(events.NewMessage(pattern='/groups'))
        async def groups_handler(event):
            """دستور مدیریت گروه‌ها"""
            user_id = str(event.sender_id)
            if user_id == self.creator_id:
                groups = self.get_groups_info()
                await event.respond(f"📋 اطلاعات گروه‌ها:\n\n{groups}")
            else:
                await event.respond("❌ فقط سازنده می‌تواند گروه‌ها را مدیریت کند!")
        
        @self.bot_client.on(events.NewMessage(pattern='/settings'))
        async def settings_handler(event):
            """دستور تنظیمات"""
            user_id = str(event.sender_id)
            if user_id == self.creator_id:
                settings = self.get_settings_info()
                await event.respond(f"⚙️ تنظیمات ربات:\n\n{settings}")
            else:
                await event.respond("❌ فقط سازنده می‌تواند تنظیمات را مشاهده کند!")
        
        @self.bot_client.on(events.NewMessage(pattern='/logs'))
        async def logs_handler(event):
            """دستور لاگ‌ها"""
            user_id = str(event.sender_id)
            if user_id in self.admin_users or user_id == self.creator_id:
                logs = self.get_recent_logs()
                await event.respond(f"📝 لاگ‌های اخیر:\n\n{logs}")
            else:
                await event.respond("❌ شما مجاز به مشاهده لاگ‌ها نیستید!")
        
        @self.bot_client.on(events.NewMessage(pattern='/help'))
        async def help_handler(event):
            """دستور راهنما"""
            help_text = self.get_help_text()
            await event.respond(help_text)
    
    def get_bot_status(self):
        """دریافت وضعیت ربات"""
        try:
            if os.path.exists('bot_status_new.json'):
                with open('bot_status_new.json', 'r', encoding='utf-8') as f:
                    status = json.load(f)
                    
                status_text = f"""🤖 **وضعیت ربات:**

🟢 **وضعیت:** {'فعال' if status.get('is_running') else 'غیرفعال'}
📱 **اکانت‌ها:** {status.get('accounts_count', 0)} کل
✅ **فعال:** {status.get('active_accounts', 0)} اکانت
🔄 **رستارت:** {status.get('restart_count', 0)} بار
⏰ **آخرین بروزرسانی:** {status.get('last_update', 'نامشخص')}"""
                
                return status_text
            else:
                return "❌ فایل وضعیت یافت نشد"
        except Exception as e:
            return f"❌ خطا در دریافت وضعیت: {str(e)}"
    
    def get_bot_stats(self):
        """دریافت آمار ربات"""
        try:
            if os.path.exists('progress_new.json'):
                with open('progress_new.json', 'r', encoding='utf-8') as f:
                    progress = json.load(f)
                
                stats = progress.get('stats', {})
                stats_text = f"""📊 **آمار ربات:**

✅ **اضافه شده:** {stats.get('total_added', 0)} کاربر
❌ **ناموفق:** {stats.get('total_failed', 0)} کاربر
⏭️ **رد شده:** {stats.get('total_skipped', 0)} کاربر
📱 **اکانت استفاده شده:** {stats.get('accounts_used', 0)} اکانت
⏰ **شروع:** {stats.get('start_time', 'نامشخص')}"""
                
                return stats_text
            else:
                return "❌ فایل آمار یافت نشد"
        except Exception as e:
            return f"❌ خطا در دریافت آمار: {str(e)}"
    
    def get_accounts_info(self):
        """دریافت اطلاعات اکانت‌ها"""
        try:
            with open('accounts_new.json', 'r', encoding='utf-8') as f:
                accounts_data = json.load(f)
            
            accounts = accounts_data.get('accounts', [])
            active_count = sum(1 for acc in accounts if acc.get('is_active', True))
            
            accounts_text = f"""📱 **اطلاعات اکانت‌ها:**

📊 **کل اکانت‌ها:** {len(accounts)}
✅ **فعال:** {active_count}
❌ **غیرفعال:** {len(accounts) - active_count}

**اکانت‌های فعال:**"""
            
            for i, account in enumerate(accounts, 1):
                if account.get('is_active', True):
                    accounts_text += f"\n{i}. {account.get('name', 'نامشخص')} - {account.get('phone', 'نامشخص')}"
            
            return accounts_text
        except Exception as e:
            return f"❌ خطا در دریافت اطلاعات اکانت‌ها: {str(e)}"
    
    def get_accounts_count(self):
        """دریافت تعداد اکانت‌های فعال"""
        try:
            with open('accounts_new.json', 'r', encoding='utf-8') as f:
                accounts_data = json.load(f)
            
            accounts = accounts_data.get('accounts', [])
            active_count = sum(1 for acc in accounts if acc.get('is_active', True))
            return f"{active_count}/{len(accounts)}"
        except Exception as e:
            return "خطا"
    
    def get_admins_info(self):
        """دریافت اطلاعات ادمین‌ها"""
        admins_text = """👥 **اطلاعات ادمین‌ها:**

👑 **سازنده:** @Lord4626
🛠️ **پشتیبانی:** @I89I89I840
👤 **ادمین:** 7936340030

**دسترسی‌ها:**
- سازنده: تمام دسترسی‌ها
- پشتیبانی: مشاهده و آمار
- ادمین: مدیریت محدود"""
        
        return admins_text
    
    def get_groups_info(self):
        """دریافت اطلاعات گروه‌ها"""
        try:
            with open('config_new.json', 'r', encoding='utf-8') as f:
                config = json.load(f)
            
            groups = config.get('groups', {})
            source_groups = groups.get('source_groups', [])
            target_groups = groups.get('target_groups', [])
            
            groups_text = f"""📋 **اطلاعات گروه‌ها:**

📤 **گروه‌های منبع:** {len(source_groups)}
📥 **گروه‌های هدف:** {len(target_groups)}

**گروه‌های منبع:**
"""
            for i, group in enumerate(source_groups, 1):
                groups_text += f"{i}. {group}\n"
            
            groups_text += "\n**گروه‌های هدف:**\n"
            for i, group in enumerate(target_groups, 1):
                groups_text += f"{i}. {group}\n"
            
            return groups_text
        except Exception as e:
            return f"❌ خطا در دریافت اطلاعات گروه‌ها: {str(e)}"
    
    def get_groups_count(self):
        """دریافت تعداد گروه‌ها"""
        try:
            with open('config_new.json', 'r', encoding='utf-8') as f:
                config = json.load(f)
            
            groups = config.get('groups', {})
            source_count = len(groups.get('source_groups', []))
            target_count = len(groups.get('target_groups', []))
            return f"{source_count}/{target_count}"
        except Exception as e:
            return "خطا"
    
    def get_settings_info(self):
        """دریافت اطلاعات تنظیمات"""
        try:
            with open('config_new.json', 'r', encoding='utf-8') as f:
                config = json.load(f)
            
            settings_text = f"""⚙️ **تنظیمات ربات:**

⏱️ **تاخیر بین اضافه:** {config.get('delay_between_adds', [30, 60])[0]}-{config.get('delay_between_adds', [30, 60])[1]} ثانیه
⏰ **تاخیر بین گروه‌ها:** {config.get('delay_between_groups', [300, 600])[0]}-{config.get('delay_between_groups', [300, 600])[1]} ثانیه
👥 **حداکثر کاربر:** {config.get('max_users_per_group', 50)} در هر گروه
📊 **حداکثر روزانه:** {config.get('max_daily_adds', 200)} کاربر
🔒 **محدودیت روزانه:** {config.get('security', {}).get('daily_limit', 200)} کاربر
⏰ **محدودیت ساعتی:** {config.get('security', {}).get('hourly_limit', 50)} کاربر"""
            
            return settings_text
        except Exception as e:
            return f"❌ خطا در دریافت تنظیمات: {str(e)}"
    
    def get_recent_logs(self):
        """دریافت لاگ‌های اخیر"""
        try:
            if os.path.exists('member_adder_new.log'):
                with open('member_adder_new.log', 'r', encoding='utf-8') as f:
                    lines = f.readlines()
                
                recent_logs = lines[-10:] if len(lines) > 10 else lines
                logs_text = "📝 **لاگ‌های اخیر:**\n\n"
                
                for log in recent_logs:
                    logs_text += f"• {log.strip()}\n"
                
                return logs_text
            else:
                return "❌ فایل لاگ یافت نشد"
        except Exception as e:
            return f"❌ خطا در دریافت لاگ‌ها: {str(e)}"
    
    def get_help_text(self):
        """دریافت متن راهنما"""
        help_text = """❓ **راهنمای ربات ادممبر:**

**🎯 دستورات اصلی:**
/start - شروع ربات
/status - وضعیت ربات
/stats - آمار کامل
/admin - پنل مدیریتی

**👑 دستورات سازنده:**
/accounts - مدیریت اکانت‌ها
/admins - مدیریت ادمین‌ها
/groups - مدیریت گروه‌ها
/settings - تنظیمات ربات

**📊 دستورات عمومی:**
/logs - لاگ‌های سیستم
/help - راهنما

**🔧 نحوه استفاده:**
1. ابتدا اکانت‌ها را در فایل accounts_new.json تنظیم کنید
2. گروه‌های منبع و هدف را در config_new.json تعریف کنید
3. ربات را با دستور /start شروع کنید
4. وضعیت را با /status بررسی کنید

**👑 سازنده:** @Lord4626
**🛠️ پشتیبانی:** @I89I89I840"""
        
        return help_text
    
    async def send_notification(self, message: str):
        """ارسال اعلان به ادمین‌ها"""
        try:
            for user_id in self.admin_users:
                await self.bot_client.send_message(user_id, message)
        except Exception as e:
            logger.error(f"خطا در ارسال اعلان: {e}")
    
    async def run(self):
        """اجرای ربات"""
        try:
            success = await self.start_bot()
            if success:
                logger.info("ربات تلگرام با موفقیت شروع شد")
                await self.send_notification("🤖 ربات تلگرام مدیریتی شروع شد!")
                
                # نگه داشتن ربات فعال
                await self.bot_client.run_until_disconnected()
            else:
                logger.error("خطا در شروع ربات تلگرام")
                
        except Exception as e:
            logger.error(f"خطا در اجرای ربات: {e}")

async def main():
    """تابع اصلی"""
    bot_manager = NewTelegramBotManager()
    await bot_manager.run()

if __name__ == '__main__':
    asyncio.run(main()) 