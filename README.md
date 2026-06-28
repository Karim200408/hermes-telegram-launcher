# hermes-telegram-launcher

Configure and launch [Hermes Agent](https://github.com/NousResearch/hermes-agent)
to talk to a specific Telegram chat using a chosen model and API key —
without going through the interactive setup wizard.

## Prerequisites

- [Hermes Agent](https://github.com/NousResearch/hermes-agent) installed
- A Gemini API key from [Google AI Studio](https://aistudio.google.com/apikey)
- A Telegram bot token from [@BotFather](https://t.me/BotFather)
- Your Telegram chat ID (message [@userinfobot](https://t.me/userinfobot) to get yours)

## Option A — bash script

```bash
./configure.sh <model> <api_key> <telegram_bot_token> <telegram_chat_id>
```

Example:
```bash
./configure.sh gemini-2.5-flash AIzaSy... 123456:ABC... 987654321
```

This writes `~/.hermes/config.yaml` and `~/.hermes/.env`, then starts the gateway.

## License

MIT

## Option B — config file

Copy `config/config.yaml` and `config/.env.example` (renamed to `.env`, filled in)
into `~/.hermes/`, then run `hermes gateway run`.

## Option C — Docker (recommended for isolation)

Build:
\`\`\`
docker build -t hermes:latest .
\`\`\`

Run (env vars passed at run time configure model/key/chat automatically):
\`\`\`
docker run -it \
  -v ~/hermes-data:/opt/data \
  -e HERMES_MODEL="gemini-2.5-flash" \
  -e GOOGLE_API_KEY="your_key" \
  -e TELEGRAM_BOT_TOKEN="your_bot_token" \
  -e TELEGRAM_ALLOWED_USERS="your_chat_id" \
  hermes:latest
\`\`\`

State persists on the host under `~/hermes-data` (mounted to `/opt/data`),
so the image stays stateless and can be rebuilt or updated without losing config.
