#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
ربات ادممبر پیشرفته جدید - New Advanced Member Adder Bot
ربات ادممبر با قابلیت‌های پیشرفته برای Lord
"""

import asyncio
import json
import logging
import os
import random
import time
from datetime import datetime, timedelta
from telethon import TelegramClient, errors
from telethon.tl.functions.channels import InviteToChannelRequest
from telethon.tl.types import InputPeerUser, InputPeerChannel
from telethon.errors import FloodWaitError, UserPrivacyRestrictedError, UserNotMutualContactError

# تنظیمات لاگینگ
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('member_adder_new.log', encoding='utf-8'),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger(__name__)

class NewAdvancedMemberAdder:
    """ربات ادممبر پیشرفته جدید"""
    
    def __init__(self):
        self.config = self.load_config()
        self.accounts = self.load_accounts()
        self.progress = self.load_progress()
        self.is_running = False
        self.clients = {}
        self.current_account_index = 0
        self.daily_stats = {
            'added': 0,
            'failed': 0,
            'skipped': 0,
            'accounts_used': 0
        }
        
    def load_config(self):
        """بارگذاری تنظیمات"""
        try:
            with open('config_new.json', 'r', encoding='utf-8') as f:
                return json.load(f)
        except Exception as e:
            logger.error(f"خطا در بارگذاری تنظیمات: {e}")
            return {}
    
    def load_accounts(self):
        """بارگذاری اکانت‌ها"""
        try:
            with open('accounts_new.json', 'r', encoding='utf-8') as f:
                return json.load(f)
        except Exception as e:
            logger.error(f"خطا در بارگذاری اکانت‌ها: {e}")
            return {"accounts": []}
    
    def load_progress(self):
        """بارگذاری پیشرفت"""
        try:
            if os.path.exists('progress_new.json'):
                with open('progress_new.json', 'r', encoding='utf-8') as f:
                    return json.load(f)
            else:
                return {
                    'stats': {
                        'total_added': 0,
                        'total_failed': 0,
                        'total_skipped': 0,
                        'accounts_used': 0,
                        'start_time': datetime.now().isoformat()
                    },
                    'last_group': 0,
                    'last_user': 0
                }
        except Exception as e:
            logger.error(f"خطا در بارگذاری پیشرفت: {e}")
            return {}
    
    def save_progress(self):
        """ذخیره پیشرفت"""
        try:
            with open('progress_new.json', 'w', encoding='utf-8') as f:
                json.dump(self.progress, f, ensure_ascii=False, indent=2)
        except Exception as e:
            logger.error(f"خطا در ذخیره پیشرفت: {e}")
    
    def save_bot_status(self):
        """ذخیره وضعیت ربات"""
        try:
            status = {
                'is_running': self.is_running,
                'accounts_count': len(self.accounts.get('accounts', [])),
                'active_accounts': len([acc for acc in self.accounts.get('accounts', []) if acc.get('is_active')]),
                'restart_count': self.progress.get('stats', {}).get('restart_count', 0),
                'last_update': datetime.now().isoformat()
            }
            with open('bot_status_new.json', 'w', encoding='utf-8') as f:
                json.dump(status, f, ensure_ascii=False, indent=2)
        except Exception as e:
            logger.error(f"خطا در ذخیره وضعیت: {e}")
    
    async def initialize_accounts(self):
        """راه‌اندازی اکانت‌ها"""
        logger.info("در حال راه‌اندازی اکانت‌ها...")
        
        accounts = self.accounts.get('accounts', [])
        active_accounts = []
        
        for i, account in enumerate(accounts):
            if not account.get('is_active', True):
                continue
                
            try:
                session_name = f"session_new_{i}"
                client = TelegramClient(
                    session_name,
                    account.get('api_id'),
                    account.get('api_hash')
                )
                
                await client.start(phone=account.get('phone'))
                self.clients[i] = client
                active_accounts.append(i)
                
                logger.info(f"اکانت {i+1} ({account.get('name', 'نامشخص')}) راه‌اندازی شد")
                
                # تاخیر بین راه‌اندازی اکانت‌ها
                await asyncio.sleep(random.uniform(2, 5))
                
            except Exception as e:
                logger.error(f"خطا در راه‌اندازی اکانت {i+1}: {e}")
                account['is_active'] = False
        
        logger.info(f"تعداد {len(active_accounts)} اکانت فعال شد")
        return active_accounts
    
    async def get_users_from_source_group(self, client, source_group):
        """دریافت کاربران از گروه منبع"""
        try:
            entity = await client.get_entity(source_group)
            participants = await client.get_participants(entity, limit=200)
            
            users = []
            for participant in participants:
                if not participant.bot and not participant.deleted:
                    users.append(participant)
            
            logger.info(f"تعداد {len(users)} کاربر از گروه {source_group} دریافت شد")
            return users
            
        except Exception as e:
            logger.error(f"خطا در دریافت کاربران از گروه {source_group}: {e}")
            return []
    
    async def add_user_to_target_group(self, client, user, target_group):
        """اضافه کردن کاربر به گروه هدف"""
        try:
            target_entity = await client.get_entity(target_group)
            user_entity = InputPeerUser(user.id, user.access_hash)
            
            await client(InviteToChannelRequest(
                channel=target_entity,
                users=[user_entity]
            ))
            
            logger.info(f"کاربر {user.first_name} به گروه {target_group} اضافه شد")
            return True
            
        except FloodWaitError as e:
            wait_time = e.seconds
            logger.warning(f"FloodWait: {wait_time} ثانیه صبر کنید")
            await asyncio.sleep(wait_time)
            return False
            
        except UserPrivacyRestrictedError:
            logger.info(f"کاربر {user.first_name} حریم خصوصی محدود دارد")
            return False
            
        except UserNotMutualContactError:
            logger.info(f"کاربر {user.first_name} تماس متقابل نیست")
            return False
            
        except Exception as e:
            logger.error(f"خطا در اضافه کردن کاربر {user.first_name}: {e}")
            return False
    
    async def process_group_pair(self, source_group, target_group):
        """پردازش جفت گروه"""
        logger.info(f"شروع پردازش: {source_group} -> {target_group}")
        
        # انتخاب اکانت تصادفی
        active_accounts = list(self.clients.keys())
        if not active_accounts:
            logger.error("هیچ اکانت فعالی وجود ندارد!")
            return
        
        account_index = random.choice(active_accounts)
        client = self.clients[account_index]
        
        # دریافت کاربران از گروه منبع
        users = await self.get_users_from_source_group(client, source_group)
        if not users:
            logger.warning("هیچ کاربری از گروه منبع دریافت نشد")
            return
        
        # اضافه کردن کاربران به گروه هدف
        added_count = 0
        failed_count = 0
        skipped_count = 0
        
        for user in users:
            if not self.is_running:
                break
                
            # بررسی محدودیت‌ها
            if self.daily_stats['added'] >= self.config.get('security', {}).get('daily_limit', 200):
                logger.info("محدودیت روزانه رسیده است")
                break
                
            if self.daily_stats['added'] >= self.config.get('security', {}).get('hourly_limit', 50):
                logger.info("محدودیت ساعتی رسیده است")
                await asyncio.sleep(3600)  # 1 ساعت صبر
                self.daily_stats['added'] = 0
            
            # اضافه کردن کاربر
            success = await self.add_user_to_target_group(client, user, target_group)
            
            if success:
                added_count += 1
                self.daily_stats['added'] += 1
                self.progress['stats']['total_added'] += 1
            else:
                failed_count += 1
                self.progress['stats']['total_failed'] += 1
            
            # تاخیر بین اضافه کردن
            delay = random.uniform(
                self.config.get('delay_between_adds', [30, 60])[0],
                self.config.get('delay_between_adds', [30, 60])[1]
            )
            await asyncio.sleep(delay)
        
        logger.info(f"پردازش کامل: {added_count} اضافه شد, {failed_count} ناموفق")
        self.save_progress()
    
    async def run_adder(self):
        """اجرای اصلی ربات ادممبر"""
        logger.info("شروع ربات ادممبر جدید...")
        self.is_running = True
        self.save_bot_status()
        
        # راه‌اندازی اکانت‌ها
        active_accounts = await self.initialize_accounts()
        if not active_accounts:
            logger.error("هیچ اکانت فعالی وجود ندارد!")
            return
        
        # دریافت گروه‌ها
        groups = self.config.get('groups', {})
        source_groups = groups.get('source_groups', [])
        target_groups = groups.get('target_groups', [])
        
        if not source_groups or not target_groups:
            logger.error("گروه‌های منبع یا هدف تنظیم نشده‌اند!")
            return
        
        logger.info(f"تعداد گروه‌های منبع: {len(source_groups)}")
        logger.info(f"تعداد گروه‌های هدف: {len(target_groups)}")
        
        # حلقه اصلی
        while self.is_running:
            try:
                for source_group in source_groups:
                    if not self.is_running:
                        break
                        
                    for target_group in target_groups:
                        if not self.is_running:
                            break
                            
                        await self.process_group_pair(source_group, target_group)
                        
                        # تاخیر بین گروه‌ها
                        delay = random.uniform(
                            self.config.get('delay_between_groups', [300, 600])[0],
                            self.config.get('delay_between_groups', [300, 600])[1]
                        )
                        await asyncio.sleep(delay)
                
                # تاخیر قبل از شروع مجدد چرخه
                await asyncio.sleep(3600)  # 1 ساعت
                
            except Exception as e:
                logger.error(f"خطا در حلقه اصلی: {e}")
                await asyncio.sleep(300)  # 5 دقیقه صبر
    
    def stop(self):
        """توقف ربات"""
        logger.info("در حال توقف ربات...")
        self.is_running = False
        self.save_bot_status()
        
        # بستن اکانت‌ها
        for client in self.clients.values():
            try:
                client.disconnect()
            except:
                pass
    
    async def get_stats(self):
        """دریافت آمار"""
        return {
            'is_running': self.is_running,
            'daily_stats': self.daily_stats,
            'total_stats': self.progress.get('stats', {}),
            'active_accounts': len(self.clients),
            'total_accounts': len(self.accounts.get('accounts', []))
        }

async def main():
    """تابع اصلی"""
    adder = NewAdvancedMemberAdder()
    
    try:
        await adder.run_adder()
    except KeyboardInterrupt:
        logger.info("دریافت سیگنال توقف...")
        adder.stop()
    except Exception as e:
        logger.error(f"خطای غیرمنتظره: {e}")
        adder.stop()

if __name__ == "__main__":
    asyncio.run(main()) 