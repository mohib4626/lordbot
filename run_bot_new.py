#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
اسکریپت اجرای ربات جدید - New Bot Run Script
اجرای مداوم ربات با قابلیت راه‌اندازی مجدد خودکار
"""

import asyncio
import json
import logging
import os
import sys
import time
from datetime import datetime
from advanced_member_adder_new import NewAdvancedMemberAdder

# تنظیمات لاگینگ
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('run_bot_new.log', encoding='utf-8'),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger(__name__)

class NewBotRunner:
    """اجرای ربات جدید"""
    
    def __init__(self):
        self.adder = None
        self.restart_count = 0
        self.max_restarts = 10
        self.restart_delay = 60  # ثانیه
        
    def load_status(self):
        """بارگذاری وضعیت"""
        try:
            if os.path.exists('run_status_new.json'):
                with open('run_status_new.json', 'r', encoding='utf-8') as f:
                    return json.load(f)
            else:
                return {
                    'restart_count': 0,
                    'last_restart': None,
                    'total_runtime': 0,
                    'start_time': datetime.now().isoformat()
                }
        except Exception as e:
            logger.error(f"خطا در بارگذاری وضعیت: {e}")
            return {}
    
    def save_status(self):
        """ذخیره وضعیت"""
        try:
            status = {
                'restart_count': self.restart_count,
                'last_restart': datetime.now().isoformat(),
                'total_runtime': time.time() - self.start_time,
                'start_time': self.start_time.isoformat()
            }
            with open('run_status_new.json', 'w', encoding='utf-8') as f:
                json.dump(status, f, ensure_ascii=False, indent=2)
        except Exception as e:
            logger.error(f"خطا در ذخیره وضعیت: {e}")
    
    async def run_bot(self):
        """اجرای ربات"""
        logger.info("🚀 شروع ربات ادممبر جدید...")
        
        try:
            self.adder = NewAdvancedMemberAdder()
            await self.adder.run_adder()
            
        except KeyboardInterrupt:
            logger.info("📴 دریافت سیگنال توقف...")
            if self.adder:
                self.adder.stop()
                
        except Exception as e:
            logger.error(f"❌ خطا در اجرای ربات: {e}")
            if self.adder:
                self.adder.stop()
            raise
    
    async def run_with_restart(self):
        """اجرای ربات با راه‌اندازی مجدد خودکار"""
        self.start_time = datetime.now()
        
        while self.restart_count < self.max_restarts:
            try:
                logger.info(f"🔄 شروع ربات (تلاش {self.restart_count + 1}/{self.max_restarts})")
                
                await self.run_bot()
                
                # اگر ربات به طور عادی متوقف شد
                logger.info("✅ ربات به طور عادی متوقف شد")
                break
                
            except Exception as e:
                self.restart_count += 1
                logger.error(f"❌ خطا در اجرای ربات (تلاش {self.restart_count}): {e}")
                
                if self.restart_count >= self.max_restarts:
                    logger.error("❌ حداکثر تعداد راه‌اندازی مجدد رسیده است!")
                    break
                
                logger.info(f"⏳ {self.restart_delay} ثانیه صبر قبل از راه‌اندازی مجدد...")
                self.save_status()
                await asyncio.sleep(self.restart_delay)
        
        logger.info("🏁 پایان اجرای ربات")

async def main():
    """تابع اصلی"""
    runner = NewBotRunner()
    await runner.run_with_restart()

if __name__ == "__main__":
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        logger.info("📴 برنامه توسط کاربر متوقف شد")
    except Exception as e:
        logger.error(f"❌ خطای غیرمنتظره: {e}")
        sys.exit(1) 