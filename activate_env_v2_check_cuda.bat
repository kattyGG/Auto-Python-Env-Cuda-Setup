@echo off
cd /D "%~dp0"

@rem 激活 micromamba 环境
call pytorch_env\Scripts\activate

@rem 设置 SOCKS5 代理
set "http_proxy=socks5://127.0.0.1:10601"
set "https_proxy=socks5://127.0.0.1:10601"

@rem 运行 install_check_cuda.py 脚本
python ".\install_check_cuda.py"

@rem 保持命令行窗口打开
cmd /k
