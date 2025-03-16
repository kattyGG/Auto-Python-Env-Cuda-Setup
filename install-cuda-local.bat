@echo off
REM 设置控制台编码为 UTF-8（避免中文乱码）
chcp 65001

REM --- 设置虚拟环境目录 ---
set "VENV_DIR=%~dp0pytorch_env"

REM 如果目录已存在，建议先删除或重命名旧目录，以避免路径冲突
if exist "%VENV_DIR%" (
    echo 检测到目录 %VENV_DIR% 已存在，请先删除或重命名该目录，然后重新运行脚本。
    pause
    exit /b 1
)

echo 正在创建 Python 虚拟环境...
python -m venv "%VENV_DIR%"
if errorlevel 1 (
    echo 创建虚拟环境失败，请确认 Python 已正确安装且在 PATH 中。
    pause
    exit /b 1
)

echo 正在激活虚拟环境...
call "%VENV_DIR%\Scripts\activate"
if errorlevel 1 (
    echo 激活虚拟环境失败，请检查路径 %VENV_DIR%\Scripts\activate 是否存在。
    pause
    exit /b 1
)

REM --- 配置 pip 代理 ---
REM 先确保 pip 配置目录存在
if not exist "%APPDATA%\pip" (
    mkdir "%APPDATA%\pip"
)

set "PIP_CONFIG=%APPDATA%\pip\pip.ini"
if exist "%PIP_CONFIG%" (
    del "%PIP_CONFIG%"
)

REM 使用代理地址 127.0.0.1:11601，这里采用 HTTP 协议
set "PROXY_URL=http://127.0.0.1:11601"

echo [global] > "%PIP_CONFIG%"
echo proxy=%PROXY_URL% >> "%PIP_CONFIG%"

REM 同时设置环境变量，供 pip 使用
set HTTP_PROXY=%PROXY_URL%
set HTTPS_PROXY=%PROXY_URL%

REM --- 升级 pip ---
echo 正在升级 pip...
pip install --upgrade pip --proxy %PROXY_URL%
if errorlevel 1 (
    echo 升级 pip 失败，请检查网络、代理设置或代理服务器是否正常启动。
    pause
    exit /b 1
)

REM --- 安装 PyTorch 2.0.1 (CUDA 11.8) ---
echo 正在安装 PyTorch 2.0.1 (CUDA 11.8)...
pip install --proxy %PROXY_URL% torch==2.0.1 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
if errorlevel 1 (
    echo 安装 PyTorch 时出现错误，请检查 Python 版本、网络或代理设置。
    pause
    exit /b 1
)

REM --- 运行 CUDA 检查 ---
echo 正在检查 CUDA 是否可用...
python -c "import torch; print('CUDA 可用:', torch.cuda.is_available())"
if errorlevel 1 (
    echo CUDA 检查失败，请确认 CUDA 驱动和硬件支持是否正确安装。
    pause
    exit /b 1
)

echo.
echo 安装完成！
echo 若要激活环境，请运行：
echo     call "%VENV_DIR%\Scripts\activate"
pause
