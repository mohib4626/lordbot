#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
تست دسترسی ساده ربات
"""

import json

def test_access():
    """تست دسترسی"""
    
    # آیدی‌های مجاز
    allowed_users = [
        "Lord4626",
        "I89I89I840", 
        "7936340030"
    ]
    
    # آیدی شما
    your_id = "7936340030"
    
    print(f"آیدی شما: {your_id}")
    print(f"آیدی‌های مجاز: {allowed_users}")
    print(f"آیا مجاز هستید: {your_id in allowed_users}")
    
    # تست با اعداد
    allowed_numbers = [
        7936340030,
        "7936340030"
    ]
    
    print(f"آیا 7936340030 در لیست است: {7936340030 in allowed_numbers}")
    print(f"آیا '7936340030' در لیست است: {'7936340030' in allowed_numbers}")

if __name__ == "__main__":
    test_access() 