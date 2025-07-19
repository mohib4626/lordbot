#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
پنل وب لوکس برای ربات ادممبر جدید - Luxurious Web Panel
پنل مدیریتی پیشرفته با رابط کاربری مدرن
"""

from flask import Flask, render_template, jsonify, request, redirect, url_for, session
from flask_socketio import SocketIO, emit
import json
import os
import logging
import threading
import time
from datetime import datetime, timedelta
import sqlite3
import hashlib
import secrets

# تنظیمات لاگینگ
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('web_panel_new.log', encoding='utf-8'),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger(__name__)

app = Flask(__name__)
app.secret_key = 'lord_special_ad_member_2024'
socketio = SocketIO(app, cors_allowed_origins="*")

class LuxuriousWebPanel:
    """پنل وب لوکس برای ربات ادممبر"""
    
    def __init__(self):
        self.config = self.load_config()
        self.port = self.config.get('monitoring', {}).get('web_port', 8080)
        self.admin_users = self.config.get('monitoring', {}).get('admin_users', [])
        self.creator_id = self.config.get('monitoring', {}).get('creator_id', '')
        self.setup_database()
        
    def setup_database(self):
        """راه‌اندازی دیتابیس"""
        try:
            conn = sqlite3.connect('web_panel_new.db')
            cursor = conn.cursor()
            
            # جدول کاربران
            cursor.execute('''
                CREATE TABLE IF NOT EXISTS users (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    username TEXT UNIQUE,
                    password_hash TEXT,
                    role TEXT,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                )
            ''')
            
            # جدول لاگ‌ها
            cursor.execute('''
                CREATE TABLE IF NOT EXISTS activity_logs (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    user_id INTEGER,
                    action TEXT,
                    details TEXT,
                    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                )
            ''')
            
            # جدول آمار
            cursor.execute('''
                CREATE TABLE IF NOT EXISTS statistics (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    date DATE,
                    added_users INTEGER DEFAULT 0,
                    failed_users INTEGER DEFAULT 0,
                    active_accounts INTEGER DEFAULT 0,
                    total_runtime INTEGER DEFAULT 0
                )
            ''')
            
            conn.commit()
            conn.close()
            
            # ایجاد کاربر پیش‌فرض
            self.create_default_admin()
            
        except Exception as e:
            logger.error(f"خطا در راه‌اندازی دیتابیس: {e}")
    
    def create_default_admin(self):
        """ایجاد ادمین پیش‌فرض"""
        try:
            conn = sqlite3.connect('web_panel_new.db')
            cursor = conn.cursor()
            
            # بررسی وجود کاربر
            cursor.execute('SELECT * FROM users WHERE username = ?', ('lord',))
            if not cursor.fetchone():
                password_hash = hashlib.sha256('lord2024'.encode()).hexdigest()
                cursor.execute('''
                    INSERT INTO users (username, password_hash, role) 
                    VALUES (?, ?, ?)
                ''', ('lord', password_hash, 'creator'))
                
                conn.commit()
                logger.info("کاربر پیش‌فرض ایجاد شد")
            
            conn.close()
        except Exception as e:
            logger.error(f"خطا در ایجاد کاربر پیش‌فرض: {e}")
    
    def load_config(self):
        """بارگذاری تنظیمات"""
        try:
            with open('config_new.json', 'r', encoding='utf-8') as f:
                return json.load(f)
        except Exception as e:
            logger.error(f"خطا در بارگذاری تنظیمات: {e}")
            return {}
    
    def get_bot_status(self):
        """دریافت وضعیت ربات"""
        try:
            if os.path.exists('bot_status_new.json'):
                with open('bot_status_new.json', 'r', encoding='utf-8') as f:
                    return json.load(f)
            return {'is_running': False, 'error': 'فایل وضعیت یافت نشد'}
        except Exception as e:
            return {'is_running': False, 'error': str(e)}
    
    def get_bot_stats(self):
        """دریافت آمار ربات"""
        try:
            if os.path.exists('progress_new.json'):
                with open('progress_new.json', 'r', encoding='utf-8') as f:
                    return json.load(f)
            return {'stats': {}, 'error': 'فایل آمار یافت نشد'}
        except Exception as e:
            return {'stats': {}, 'error': str(e)}
    
    def get_accounts_info(self):
        """دریافت اطلاعات اکانت‌ها"""
        try:
            with open('accounts_new.json', 'r', encoding='utf-8') as f:
                return json.load(f)
        except Exception as e:
            return {'accounts': [], 'error': str(e)}
    
    def send_command(self, command):
        """ارسال دستور به ربات"""
        try:
            if command == 'stop':
                with open('stop_signal_new.txt', 'w') as f:
                    f.write('stop')
            elif command == 'restart':
                with open('restart_signal_new.txt', 'w') as f:
                    f.write('restart')
            elif command == 'pause':
                with open('pause_signal_new.txt', 'w') as f:
                    f.write('pause')
            elif command == 'resume':
                with open('resume_signal_new.txt', 'w') as f:
                    f.write('resume')
            return True
        except Exception as e:
            logger.error(f"خطا در ارسال دستور: {e}")
            return False
    
    def log_activity(self, user_id, action, details):
        """ثبت فعالیت کاربر"""
        try:
            conn = sqlite3.connect('web_panel_new.db')
            cursor = conn.cursor()
            cursor.execute('''
                INSERT INTO activity_logs (user_id, action, details)
                VALUES (?, ?, ?)
            ''', (user_id, action, details))
            conn.commit()
            conn.close()
        except Exception as e:
            logger.error(f"خطا در ثبت فعالیت: {e}")

# ایجاد نمونه از کلاس پنل
panel = LuxuriousWebPanel()

# Routes
@app.route('/')
def index():
    """صفحه اصلی"""
    if 'user_id' not in session:
        return redirect(url_for('login'))
    return render_template('dashboard.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    """صفحه ورود"""
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        
        try:
            conn = sqlite3.connect('web_panel_new.db')
            cursor = conn.cursor()
            cursor.execute('SELECT * FROM users WHERE username = ?', (username,))
            user = cursor.fetchone()
            conn.close()
            
            if user and user[2] == hashlib.sha256(password.encode()).hexdigest():
                session['user_id'] = user[0]
                session['username'] = user[1]
                session['role'] = user[3]
                panel.log_activity(user[0], 'login', f'ورود کاربر {username}')
                return redirect(url_for('index'))
            else:
                return render_template('login.html', error='نام کاربری یا رمز عبور اشتباه است')
        except Exception as e:
            return render_template('login.html', error='خطا در ورود')
    
    return render_template('login.html')

@app.route('/logout')
def logout():
    """خروج از سیستم"""
    if 'user_id' in session:
        panel.log_activity(session['user_id'], 'logout', f'خروج کاربر {session.get("username")}')
    session.clear()
    return redirect(url_for('login'))

@app.route('/api/status')
def api_status():
    """API وضعیت ربات"""
    status = panel.get_bot_status()
    return jsonify(status)

@app.route('/api/stats')
def api_stats():
    """API آمار ربات"""
    stats = panel.get_bot_stats()
    return jsonify(stats)

@app.route('/api/accounts')
def api_accounts():
    """API اطلاعات اکانت‌ها"""
    accounts = panel.get_accounts_info()
    return jsonify(accounts)

@app.route('/api/command', methods=['POST'])
def api_command():
    """API ارسال دستور"""
    if 'user_id' not in session:
        return jsonify({'success': False, 'error': 'لطفا وارد شوید'})
    
    data = request.get_json()
    command = data.get('command')
    
    if command in ['stop', 'restart', 'pause', 'resume']:
        success = panel.send_command(command)
        panel.log_activity(session['user_id'], 'command', f'دستور {command} ارسال شد')
        return jsonify({'success': success})
    else:
        return jsonify({'success': False, 'error': 'دستور نامعتبر'})

@app.route('/api/config')
def api_config():
    """API تنظیمات"""
    return jsonify(panel.config)

@app.route('/api/logs')
def api_logs():
    """API لاگ‌های اخیر"""
    try:
        conn = sqlite3.connect('web_panel_new.db')
        cursor = conn.cursor()
        cursor.execute('''
            SELECT al.action, al.details, al.timestamp, u.username
            FROM activity_logs al
            JOIN users u ON al.user_id = u.id
            ORDER BY al.timestamp DESC
            LIMIT 50
        ''')
        logs = cursor.fetchall()
        conn.close()
        
        formatted_logs = []
        for log in logs:
            formatted_logs.append({
                'action': log[0],
                'details': log[1],
                'timestamp': log[2],
                'username': log[3]
            })
        
        return jsonify({'logs': formatted_logs})
    except Exception as e:
        return jsonify({'logs': [], 'error': str(e)})

# Socket.IO events
@socketio.on('connect')
def handle_connect():
    """اتصال کاربر"""
    emit('status', {'message': 'متصل شدید'})

@socketio.on('disconnect')
def handle_disconnect():
    """قطع اتصال کاربر"""
    print('کاربر قطع شد')

def create_templates():
    """ایجاد فایل‌های HTML"""
    templates_dir = 'templates'
    if not os.path.exists(templates_dir):
        os.makedirs(templates_dir)
    
    # فایل login.html
    login_html = '''<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ورود به پنل مدیریت</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Tahoma', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .login-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        
        .logo {
            font-size: 3em;
            color: #667eea;
            margin-bottom: 20px;
        }
        
        .title {
            font-size: 1.5em;
            color: #333;
            margin-bottom: 30px;
            font-weight: bold;
        }
        
        .form-group {
            margin-bottom: 20px;
            text-align: right;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: bold;
        }
        
        .form-group input {
            width: 100%;
            padding: 15px;
            border: 2px solid #e1e5e9;
            border-radius: 10px;
            font-size: 16px;
            transition: border-color 0.3s;
        }
        
        .form-group input:focus {
            outline: none;
            border-color: #667eea;
        }
        
        .login-btn {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.2s;
        }
        
        .login-btn:hover {
            transform: translateY(-2px);
        }
        
        .error {
            color: #e74c3c;
            margin-top: 10px;
            font-size: 14px;
        }
        
        .footer {
            margin-top: 30px;
            color: #666;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="logo">
            <i class="fas fa-robot"></i>
        </div>
        <h1 class="title">پنل مدیریت ربات ادممبر</h1>
        
        <form method="POST">
            <div class="form-group">
                <label for="username">نام کاربری:</label>
                <input type="text" id="username" name="username" required>
            </div>
            
            <div class="form-group">
                <label for="password">رمز عبور:</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <button type="submit" class="login-btn">
                <i class="fas fa-sign-in-alt"></i> ورود
            </button>
        </form>
        
        {% if error %}
        <div class="error">{{ error }}</div>
        {% endif %}
        
        <div class="footer">
            <p>👑 Special Ad Member Bot</p>
            <p>ساخته شده توسط Lord</p>
        </div>
    </div>
</body>
</html>'''
    
    # فایل dashboard.html
    dashboard_html = '''<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>پنل مدیریت ربات ادممبر</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.0.1/socket.io.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Tahoma', sans-serif;
            background: #f5f7fa;
            color: #333;
        }
        
        .sidebar {
            position: fixed;
            right: 0;
            top: 0;
            width: 250px;
            height: 100vh;
            background: linear-gradient(180deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            overflow-y: auto;
        }
        
        .sidebar-header {
            text-align: center;
            padding: 20px 0;
            border-bottom: 1px solid rgba(255,255,255,0.2);
            margin-bottom: 20px;
        }
        
        .sidebar-header h2 {
            font-size: 1.2em;
            margin-bottom: 10px;
        }
        
        .sidebar-menu {
            list-style: none;
        }
        
        .sidebar-menu li {
            margin-bottom: 10px;
        }
        
        .sidebar-menu a {
            display: block;
            padding: 12px 15px;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            transition: background 0.3s;
        }
        
        .sidebar-menu a:hover,
        .sidebar-menu a.active {
            background: rgba(255,255,255,0.2);
        }
        
        .sidebar-menu i {
            margin-left: 10px;
            width: 20px;
        }
        
        .main-content {
            margin-right: 250px;
            padding: 20px;
        }
        
        .header {
            background: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .header h1 {
            color: #667eea;
            font-size: 1.8em;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .user-avatar {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
        }
        
        .logout-btn {
            background: #e74c3c;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        
        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 20px;
        }
        
        .card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.2s;
        }
        
        .card:hover {
            transform: translateY(-5px);
        }
        
        .card-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .card-icon {
            width: 50px;
            height: 50px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-left: 15px;
            font-size: 1.5em;
            color: white;
        }
        
        .card-title {
            font-size: 1.2em;
            font-weight: bold;
            color: #333;
        }
        
        .stat-number {
            font-size: 2.5em;
            font-weight: bold;
            color: #667eea;
            margin-bottom: 10px;
        }
        
        .stat-label {
            color: #666;
            font-size: 0.9em;
        }
        
        .control-buttons {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }
        
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            transition: transform 0.2s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
        
        .btn:hover {
            transform: translateY(-2px);
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        .btn-success {
            background: linear-gradient(135deg, #51cf66 0%, #40c057 100%);
            color: white;
        }
        
        .btn-danger {
            background: linear-gradient(135deg, #ff6b6b 0%, #ee5a52 100%);
            color: white;
        }
        
        .btn-warning {
            background: linear-gradient(135deg, #ffd43b 0%, #fcc419 100%);
            color: #333;
        }
        
        .status-indicator {
            display: inline-block;
            width: 12px;
            height: 12px;
            border-radius: 50%;
            margin-left: 8px;
        }
        
        .status-online {
            background: #51cf66;
            box-shadow: 0 0 10px #51cf66;
        }
        
        .status-offline {
            background: #e74c3c;
            box-shadow: 0 0 10px #e74c3c;
        }
        
        .chart-container {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            margin-top: 20px;
        }
        
        .logs-container {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            margin-top: 20px;
            max-height: 400px;
            overflow-y: auto;
        }
        
        .log-item {
            padding: 10px;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .log-time {
            color: #666;
            font-size: 0.8em;
        }
        
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(100%);
                transition: transform 0.3s;
            }
            
            .sidebar.open {
                transform: translateX(0);
            }
            
            .main-content {
                margin-right: 0;
            }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="sidebar-header">
            <h2><i class="fas fa-robot"></i></h2>
            <h3>Special Ad Member</h3>
            <p>پنل مدیریتی</p>
        </div>
        
        <ul class="sidebar-menu">
            <li><a href="#dashboard" class="active"><i class="fas fa-tachometer-alt"></i> داشبورد</a></li>
            <li><a href="#accounts"><i class="fas fa-users"></i> اکانت‌ها</a></li>
            <li><a href="#groups"><i class="fas fa-layer-group"></i> گروه‌ها</a></li>
            <li><a href="#stats"><i class="fas fa-chart-bar"></i> آمار</a></li>
            <li><a href="#logs"><i class="fas fa-list"></i> لاگ‌ها</a></li>
            <li><a href="#settings"><i class="fas fa-cog"></i> تنظیمات</a></li>
        </ul>
    </div>
    
    <div class="main-content">
        <div class="header">
            <h1>داشبورد مدیریتی</h1>
            <div class="user-info">
                <div class="user-avatar">
                    {{ session.username[0].upper() }}
                </div>
                <span>{{ session.username }}</span>
                <a href="/logout" class="logout-btn">
                    <i class="fas fa-sign-out-alt"></i> خروج
                </a>
            </div>
        </div>
        
        <div class="dashboard-grid">
            <div class="card">
                <div class="card-header">
                    <div class="card-icon" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                        <i class="fas fa-robot"></i>
                    </div>
                    <div>
                        <div class="card-title">وضعیت ربات</div>
                        <div id="bot-status">در حال بارگذاری...</div>
                    </div>
                </div>
                <div class="control-buttons">
                    <button class="btn btn-success" onclick="sendCommand('restart')">
                        <i class="fas fa-play"></i> شروع
                    </button>
                    <button class="btn btn-danger" onclick="sendCommand('stop')">
                        <i class="fas fa-stop"></i> توقف
                    </button>
                    <button class="btn btn-warning" onclick="sendCommand('pause')">
                        <i class="fas fa-pause"></i> مکث
                    </button>
                </div>
            </div>
            
            <div class="card">
                <div class="card-header">
                    <div class="card-icon" style="background: linear-gradient(135deg, #51cf66 0%, #40c057 100%);">
                        <i class="fas fa-user-plus"></i>
                    </div>
                    <div>
                        <div class="card-title">کاربران اضافه شده</div>
                        <div class="stat-number" id="added-users">0</div>
                        <div class="stat-label">امروز</div>
                    </div>
                </div>
            </div>
            
            <div class="card">
                <div class="card-header">
                    <div class="card-icon" style="background: linear-gradient(135deg, #ff6b6b 0%, #ee5a52 100%);">
                        <i class="fas fa-times-circle"></i>
                    </div>
                    <div>
                        <div class="card-title">خطاها</div>
                        <div class="stat-number" id="failed-users">0</div>
                        <div class="stat-label">امروز</div>
                    </div>
                </div>
            </div>
            
            <div class="card">
                <div class="card-header">
                    <div class="card-icon" style="background: linear-gradient(135deg, #ffd43b 0%, #fcc419 100%);">
                        <i class="fas fa-users"></i>
                    </div>
                    <div>
                        <div class="card-title">اکانت‌های فعال</div>
                        <div class="stat-number" id="active-accounts">0</div>
                        <div class="stat-label">از کل اکانت‌ها</div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="chart-container">
            <h3><i class="fas fa-chart-line"></i> نمودار فعالیت</h3>
            <canvas id="activityChart" width="400" height="200"></canvas>
        </div>
        
        <div class="logs-container">
            <h3><i class="fas fa-list"></i> لاگ‌های اخیر</h3>
            <div id="recent-logs">
                <div class="log-item">
                    <span>در حال بارگذاری...</span>
                    <span class="log-time">-</span>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        // Socket.IO connection
        const socket = io();
        
        // Global variables
        let activityChart;
        
        // Initialize dashboard
        document.addEventListener('DOMContentLoaded', function() {
            loadDashboard();
            setInterval(loadDashboard, 30000); // Update every 30 seconds
        });
        
        // Load dashboard data
        async function loadDashboard() {
            try {
                const [statusResponse, statsResponse, accountsResponse, logsResponse] = await Promise.all([
                    fetch('/api/status'),
                    fetch('/api/stats'),
                    fetch('/api/accounts'),
                    fetch('/api/logs')
                ]);
                
                const status = await statusResponse.json();
                const stats = await statsResponse.json();
                const accounts = await accountsResponse.json();
                const logs = await logsResponse.json();
                
                updateStatus(status);
                updateStats(stats);
                updateAccounts(accounts);
                updateLogs(logs);
                updateChart(stats);
                
            } catch (error) {
                console.error('Error loading dashboard:', error);
            }
        }
        
        // Update bot status
        function updateStatus(status) {
            const statusElement = document.getElementById('bot-status');
            const isRunning = status.is_running;
            
            statusElement.innerHTML = `
                ${isRunning ? 'فعال' : 'غیرفعال'}
                <span class="status-indicator ${isRunning ? 'status-online' : 'status-offline'}"></span>
            `;
        }
        
        // Update statistics
        function updateStats(stats) {
            const addedUsers = document.getElementById('added-users');
            const failedUsers = document.getElementById('failed-users');
            
            if (stats.stats) {
                addedUsers.textContent = stats.stats.total_added || 0;
                failedUsers.textContent = stats.stats.total_failed || 0;
            }
        }
        
        // Update accounts info
        function updateAccounts(accounts) {
            const activeAccounts = document.getElementById('active-accounts');
            
            if (accounts.accounts) {
                const activeCount = accounts.accounts.filter(acc => acc.is_active).length;
                const totalCount = accounts.accounts.length;
                activeAccounts.textContent = `${activeCount}/${totalCount}`;
            }
        }
        
        // Update logs
        function updateLogs(logs) {
            const logsContainer = document.getElementById('recent-logs');
            
            if (logs.logs && logs.logs.length > 0) {
                logsContainer.innerHTML = logs.logs.map(log => `
                    <div class="log-item">
                        <span>${log.details}</span>
                        <span class="log-time">${new Date(log.timestamp).toLocaleString('fa-IR')}</span>
                    </div>
                `).join('');
            } else {
                logsContainer.innerHTML = '<div class="log-item"><span>هیچ لاگی یافت نشد</span></div>';
            }
        }
        
        // Update chart
        function updateChart(stats) {
            const ctx = document.getElementById('activityChart').getContext('2d');
            
            if (activityChart) {
                activityChart.destroy();
            }
            
            const data = {
                labels: ['کاربران اضافه شده', 'خطاها', 'رد شده'],
                datasets: [{
                    label: 'آمار امروز',
                    data: [
                        stats.stats?.total_added || 0,
                        stats.stats?.total_failed || 0,
                        stats.stats?.total_skipped || 0
                    ],
                    backgroundColor: [
                        'rgba(102, 126, 234, 0.8)',
                        'rgba(231, 76, 60, 0.8)',
                        'rgba(255, 212, 59, 0.8)'
                    ],
                    borderColor: [
                        'rgba(102, 126, 234, 1)',
                        'rgba(231, 76, 60, 1)',
                        'rgba(255, 212, 59, 1)'
                    ],
                    borderWidth: 2
                }]
            };
            
            activityChart = new Chart(ctx, {
                type: 'doughnut',
                data: data,
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'bottom'
                        }
                    }
                }
            });
        }
        
        // Send command to bot
        async function sendCommand(command) {
            try {
                const response = await fetch('/api/command', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ command: command })
                });
                
                const result = await response.json();
                
                if (result.success) {
                    alert(`دستور ${command} با موفقیت ارسال شد`);
                    loadDashboard();
                } else {
                    alert(`خطا در ارسال دستور: ${result.error}`);
                }
            } catch (error) {
                console.error('Error sending command:', error);
                alert('خطا در ارسال دستور');
            }
        }
        
        // Socket.IO events
        socket.on('status', function(data) {
            console.log('Status update:', data);
        });
        
        socket.on('stats_update', function(data) {
            updateStats(data);
        });
        
        socket.on('log_update', function(data) {
            updateLogs(data);
        });
    </script>
</body>
</html>'''
    
    # ذخیره فایل‌ها
    with open(os.path.join(templates_dir, 'login.html'), 'w', encoding='utf-8') as f:
        f.write(login_html)
    
    with open(os.path.join(templates_dir, 'dashboard.html'), 'w', encoding='utf-8') as f:
        f.write(dashboard_html)
    
    logger.info("فایل‌های HTML ایجاد شدند")

def main():
    """تابع اصلی"""
    try:
        # ایجاد فایل‌های HTML
        create_templates()
        
        # شروع سرور
        logger.info(f"پنل وب در حال شروع روی پورت {panel.port}...")
        socketio.run(app, host='0.0.0.0', port=panel.port, debug=False)
        
    except Exception as e:
        logger.error(f"خطا در شروع پنل وب: {e}")

if __name__ == '__main__':
    main() 