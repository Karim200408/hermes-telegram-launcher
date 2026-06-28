#!/usr/bin/env bash
set -euo pipefail

mkdir -p /opt/data

: "${GOOGLE_API_KEY:?Set GOOGLE_API_KEY at docker run time}"
: "${HERMES_MODEL:=gemini-2.5-flash}"
: "${TELEGRAM_BOT_TOKEN:?Set TELEGRAM_BOT_TOKEN}"
: "${TELEGRAM_ALLOWED_USERS:?Set TELEGRAM_ALLOWED_USERS}"

cat > /opt/data/config.yaml <<CFG
model:
  default: ${HERMES_MODEL}
  provider: gemini
CFG

cat > /opt/data/.env <<ENV
GOOGLE_API_KEY=${GOOGLE_API_KEY}
TELEGRAM_BOT_TOKEN=${TELEGRAM_BOT_TOKEN}
TELEGRAM_ALLOWED_USERS=${TELEGRAM_ALLOWED_USERS}
ENV

exec "$@"
