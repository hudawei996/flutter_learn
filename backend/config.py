# 配置文件
import os
from dotenv import load_dotenv

# 加载环境变量
load_dotenv()

# 原API基础URL
ORIGINAL_BASE_URL = "https://meikou-api.itheima.net"

# 数据库配置
DATABASE_URL = "sqlite:///./meikou.db"

# 服务器配置
HOST = "0.0.0.0"
PORT = 8000