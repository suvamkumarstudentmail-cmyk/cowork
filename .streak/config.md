# Streak Configuration

Global settings for all challenges.

---

## Settings
- **Default cadence:** daily
- **Achievements:** enabled
- **Auto-insights:** enabled

## Preferences
- **Preferred check-in time:** evening

---

## Notifications (Optional)

Push notifications for due/overdue check-ins.

- **Notifications:** disabled
- **Telegram Bot Token:** [your-bot-token]
- **Telegram Chat ID:** [your-chat-id]

### Setup Instructions

1. Create a bot via [@BotFather](https://t.me/BotFather) on Telegram
2. Get your chat ID via [@userinfobot](https://t.me/userinfobot)
3. Fill in the credentials above
4. Run the notification script via cron or GitHub Actions

See `tools/streak-notify.py` for the notification script.
