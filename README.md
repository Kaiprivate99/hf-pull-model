# pull-model

A tiny, mirror-friendly wrapper around `huggingface-cli` to download large models/datasets reliably in mainland networks.  
**No sudo required.** Supports **default directory** management and partial file selection.

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

⚡ Install

git clone https://github.com/<yourname>/hf-pull-model.git
cd hf-pull-model
bash install.sh

（可选）写入加速环境变量（放到 ~/.bashrc 或 ~/.zshrc）：

export HF_ENDPOINT="https://hf-mirror.com"
export HF_HUB_ENABLE_HF_TRANSFER=1
export HF_HUB_DISABLE_TELEMETRY=1

🚀 Quick Start

第一次设置默认目录（只做一次）：

pull-model --set-default-dir ~/models

日常拉取（无需写路径）：

pull-model Qwen/Qwen2.5-7B-Instruct

指定分支/标签：

pull-model meta-llama/Llama-3.1-8B --revision main

需要 token（gated/私有）：

pull-model meta-llama/Llama-3.1-8B --token <HF_TOKEN>

仅拉必要文件（省带宽/磁盘）：

pull-model meta-llama/Llama-3.1-8B \
  --include "*.safetensors config.json tokenizer.* generation_config.json" \
  --exclude "*.bin"

临时改存储路径（不影响默认）：

pull-model Qwen/Qwen2.5-72B --local-dir /mnt/ssd/models/Qwen72B

查看 / 修改 / 清除默认路径：

pull-model --show-default
pull-model --set-default-dir /data/my_models
pull-model --clear-default

🛠 Options
	•	--repo-type model|dataset 默认 model
	•	--cache-dir <path> 指定 HF 缓存（复用已下载内容）
	•	--include / --exclude 传入空格分隔的模式串，示例见上

❓ FAQ
	•	下载很慢/断流？
确保设了 HF_ENDPOINT=https://hf-mirror.com 和 HF_HUB_ENABLE_HF_TRANSFER=1。低峰时段更稳，或在中转机拉完 rsync/scp。
	•	报错找不到 snapshot-download？
脚本会自动用 download；都没有就回退 Python API。建议升级：

pip install -U "huggingface_hub>=0.24.0"


	•	权限问题（如 /data/models 写不进去）？
用 pull-model --set-default-dir ~/models 或改到你有权限的路径。

🔐 Security
	•	需要 token 时可用 --token，或 huggingface-cli login。避免把 token 写进公开脚本/README。

📜 License

MIT – see LICENSE.
