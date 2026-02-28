# GitHub Copilot CLI shortcuts (externalized)

typeset -ga COPILOT_BIN
COPILOT_BIN=(copilot)

# 共通実行関数
_copilot_run() {
  "${COPILOT_BIN[@]}" "$@"
}

# ノイズ除去 + oldへ移動（Autopilot）
# 使い方:
#   cc-noise-clean
#   cc-noise-clean "別の指示文..."
cc-noise-clean() {
  local prompt

  if [[ $# -gt 0 ]]; then
    prompt="$*"
  else
    prompt='soundsInputフォルダ直下にある音声ファイルのノイズを除去して。完了したら同階層のoldフォルダに移して。'
  fi

  _copilot_run \
    --model gpt-5-mini \
    --autopilot \
    --allow-tool 'shell' \
    --allow-tool 'write' \
    --allow-tool 'noise_removal' \
    --deny-tool 'shell(rm)' \
    -p "$prompt"
}

