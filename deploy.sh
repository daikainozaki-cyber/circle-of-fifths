#!/bin/bash

# 五度圏アプリ デプロイスクリプト
# 使い方: ./deploy.sh

set -euo pipefail

# スクリプトのディレクトリを取得
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# 設定ファイル読み込み
CONFIG_FILE="${SCRIPT_DIR}/config.sh"
if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "エラー: 設定ファイルが見つかりません: $CONFIG_FILE"
    exit 1
fi
source "$CONFIG_FILE"

# 色設定
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

LOCAL_PATH="${SCRIPT_DIR}/"

echo -e "${BLUE}=== 五度圏アプリ デプロイ ===${NC}"
echo ""

# デプロイ実行
echo -e "${BLUE}📤 デプロイ中...${NC}"
rsync -avz --exclude='.git' --exclude='.netlify' --exclude='deploy.sh' --exclude='config.sh' --exclude='README.md' \
    -e "ssh -i ${SSH_KEY} -p ${SSH_PORT}" \
    "${LOCAL_PATH}" \
    "${SSH_USER}@${SSH_HOST}:${REMOTE_PATH}"

echo ""
echo -e "${GREEN}✅ デプロイ完了${NC}"
echo -e "${GREEN}🌐 URL: ${PUBLIC_URL}${NC}"
