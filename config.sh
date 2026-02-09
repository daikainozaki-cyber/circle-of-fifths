#!/bin/bash
# 五度圏アプリ デプロイ設定
# ハードコード禁止ルールに基づき外部化（2026-01-02）

# Xserver接続情報
SSH_KEY="$HOME/.ssh/xserver.key"
SSH_PORT="10022"
SSH_USER="xs071284"
SSH_HOST="xs071284.xsrv.jp"

# デプロイ先
REMOTE_PATH="~/murinaikurashi.com/public_html/apps/circle-of-fifths/"

# 公開URL
PUBLIC_URL="https://murinaikurashi.com/apps/circle-of-fifths/"
