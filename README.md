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
