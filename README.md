# hf-pull-model
# pull-model

A tiny, mirror-friendly wrapper around `huggingface-cli` to download large models/datasets reliably in mainland networks.  
**No sudo required.** Supports **default directory** management and partial file selection.

> 中文为主 / English brief below.

## ✨ Features
- 一条命令：`pull-model <repo>`（默认下到你设置的目录）
- 支持设置 / 查看 / 清除 **默认存储目录**
- 兼容 `huggingface-cli download` 和旧版 `snapshot-download`
- 支持国内镜像（`HF_ENDPOINT=https://hf-mirror.com`）
- 支持 `--include/--exclude` 精准拉取文件
- 自动回退到 Python API（极端环境下也能下）

## 🧩 Requirements
- Python 3.8+
- `huggingface_hub` (CLI) + `hf_transfer`  
  安装脚本会自动安装；也可手动：
  ```bash
  pip install -U huggingface_hub hf_transfer
