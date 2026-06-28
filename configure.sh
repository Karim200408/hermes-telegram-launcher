#!/usr/bin/env bash
set -euo pipefail

MODEL="${1:?Usage: configure.sh <model> <api_key> <telegram_token> <chat_id>}"
API_KEY="${2:?missing api key}"
TG_TOKEN="${3:?missing telegram bot token}"
CHAT_ID="${4:-}"

mkdir -p ~/.hermes

cat > ~/.hermes/config.yaml <<CFG
model:
  default: ${MODEL}
  provider: gemini
CFG

cat > ~/.hermes/.env <<ENV
GOOGLE_API_KEY=${API_KEY}
TELEGRAM_BOT_TOKEN=${TG_TOKEN}
TELEGRAM_ALLOWED_USERS=${CHAT_ID}
ENV

echo "Hermes configured. Starting gateway..."
hermes gateway start