#!/usr/bin/env bash
set -euo pipefail

# 1) 安装依赖
python3 -m pip install -U huggingface_hub hf_transfer -i https://pypi.tuna.tsinghua.edu.cn/simple || {
  echo "[WARN] pip install via mirror failed, retrying default index..."
  python3 -m pip install -U huggingface_hub hf_transfer
}

# 2) 安装脚本到 ~/bin
mkdir -p "$HOME/bin"
cp -f ./pull-model "$HOME/bin/pull-model"
chmod +x "$HOME/bin/pull-model"

# 3) 确保 ~/bin 在 PATH
SHELL_RC=""
if [[ -n "${ZSH_VERSION:-}" ]]; then SHELL_RC="$HOME/.zshrc"; else SHELL_RC="$HOME/.bashrc"; fi
if ! echo "$PATH" | grep -q "$HOME/bin" ; then
  echo 'export PATH="$HOME/bin:$PATH"' >> "$SHELL_RC"
  echo "[INFO] Added ~/bin to PATH in $SHELL_RC. Please 'source' or re-open shell."
fi

cat <<'EOF'

[OK] Installed 'pull-model'.

Quick start:
  pull-model --set-default-dir ~/models
  pull-model Qwen/Qwen2.5-7B-Instruct

Optional speedups (put in your shell rc):
  export HF_ENDPOINT="https://hf-mirror.com"
  export HF_HUB_ENABLE_HF_TRANSFER=1
EOF
