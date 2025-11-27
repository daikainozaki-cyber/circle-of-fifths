#!/bin/bash

# 五度圏アプリ デプロイスクリプト
# 使い方: ./deploy.sh

set -euo pipefail

# 色設定
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

# 設定
SSH_KEY="$HOME/.ssh/xserver.key"
SSH_PORT="10022"
SSH_USER="xs071284"
SSH_HOST="xs071284.xsrv.jp"
REMOTE_PATH="~/murinaikurashi.com/public_html/apps/circle-of-fifths/"
LOCAL_PATH="$(dirname "$0")/"

echo -e "${BLUE}=== 五度圏アプリ デプロイ ===${NC}"
echo ""

# デプロイ実行
echo -e "${BLUE}📤 デプロイ中...${NC}"
rsync -avz --exclude='.git' --exclude='.netlify' --exclude='deploy.sh' --exclude='README.md' \
    -e "ssh -i ${SSH_KEY} -p ${SSH_PORT}" \
    "${LOCAL_PATH}" \
    "${SSH_USER}@${SSH_HOST}:${REMOTE_PATH}"

echo ""
echo -e "${GREEN}✅ デプロイ完了${NC}"
echo -e "${GREEN}🌐 URL: https://murinaikurashi.com/apps/circle-of-fifths/${NC}"
