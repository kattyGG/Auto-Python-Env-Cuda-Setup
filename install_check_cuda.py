import sys

# 获取并打印当前 Python 解释器的位置
python_executable = sys.executable
print('Python Executable:', python_executable)

# 获取并打印 Python 版本
python_version = sys.version
print('Python Version:', python_version)

try:
    import torch
    
    # 检查并打印 PyTorch 和 CUDA 相关信息
    cuda_version = torch.version.cuda if torch.version.cuda is not None else "Not Available"
    pytorch_version = torch.__version__
    cuda_available = torch.cuda.is_available()
    print(f'cuda--{cuda_version} pytorch {pytorch_version} cuda is {cuda_available}')

except ImportError:
    print("PyTorch is not installed.")
