# CUDA 安装与环境检测工具

本项目提供了一系列批处理（`.bat`）脚本和 Python 脚本，帮助用户在 Windows 系统上快速安装 CUDA、激活 Python 环境，并检测 PyTorch 与 CUDA 兼容性。
cuda--11.8 pytorch 2.0.1+cu118 cuda is True 这里可以自行修改脚本，安装不用版本适应不同的AI程式

## 📂 项目文件介绍

| 文件名称 | 作用 |
|----------|--------------------------------|
| `install-cuda.bat` | 直接从官方渠道安装 CUDA |
| `install-cuda-local.bat` | 通过本地安装包安装 CUDA |
| `activate_env_v2_check_cuda.bat` | 激活 Python 环境并检查 CUDA |
| `install_check_cuda.py` | 检测 Python 版本、PyTorch 版本及 CUDA 兼容性 |

---

## 🚀 使用方法

### 1️⃣ 安装 CUDA
**方法 1：在线安装（推荐）**
在终端（`cmd`）中执行：
```sh
install-cuda.bat
```

**方法 2：本地安装（适用于已有安装包）**
如果你已经下载了 CUDA 安装包，可以使用：
```sh
install-cuda-local.bat
```

---

### 2️⃣ 检查 CUDA 和 PyTorch 版本
安装完成后，可以运行 Python 脚本来检测环境：
```sh
python install_check_cuda.py
```
执行后，该脚本将输出以下信息：
- Python 解释器路径
- Python 版本号
- PyTorch 版本
- CUDA 版本及可用性

示例输出：
```
Python Executable: C:\Python39\python.exe
Python Version: 3.9.12
cuda--11.8 pytorch 1.12.1 cuda is True
```
如果 CUDA **不可用**，请检查：
1. 是否正确安装了 CUDA 及对应版本的驱动程序。
2. 是否安装了支持 CUDA 的 PyTorch 版本（可参考 PyTorch 官网安装指南）。

---

### 3️⃣ 激活环境并检查 CUDA
如果你使用的是虚拟环境（如 `conda`），可以运行：
```sh
activate_env_v2_check_cuda.bat
```
该脚本会自动激活环境，并检查 CUDA 是否正常运行。

---

## 🔧 运行环境要求

- **操作系统**：Windows 10 或更高版本
- **Python 版本**：推荐 3.8 及以上
- **CUDA 版本**：根据 PyTorch 版本选择对应的 CUDA
- **管理员权限**：部分安装步骤可能需要管理员权限

---

## 📜 许可证

本项目基于 MIT 许可证开源，欢迎贡献与改进！

---

## ✨ 贡献指南

如果你希望改进此工具，可以：
1. Fork 本项目
2. 提交 Pull Request
3. 提出 Issues 反馈问题

---

## 📌 参考资源

- [PyTorch 官方网站](https://pytorch.org/)
- [CUDA 官网](https://developer.nvidia.com/cuda-zone)

---

**💡 欢迎使用本工具，并期待你的反馈！🚀**
```

---


