# WeWork Notify Plugin — Installation Guide

## Prerequisites

- Unraid 6.12.0 or later
- A WeWork (企业微信) group chat with a webhook robot

## Quick Install

### Method 1: Plugin File URL (Recommended)

1. Go to **Plugins → Install Plugin** in Unraid web UI
2. Paste the plugin URL:
   `https://raw.githubusercontent.com/jaln1/wework-notify-unraid/main/wework-notify.plg`
3. Click **Install**

### Method 2: Manual Install

1. Download `wework-notify.plg` and `release/wework-notify.txz`
2. Copy both to `/boot/config/plugins/` on your Unraid USB drive
3. Run: `plugin install /boot/config/plugins/wework-notify.plg`

## Configuration

1. Go to **Settings → WeWork Notify**
2. Paste your WeWork webhook URL (format: `https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=YOUR_KEY`)
3. Click **Apply**
4. Click **Test Notification** — you should receive a test message in your WeWork group

## Getting a WeWork Webhook URL

1. Open your WeWork (企业微信) group chat
2. Click the `...` menu → **Group Robot** (群机器人)
3. Add a new robot or select an existing one
4. Copy the webhook URL

## Troubleshooting

| Problem | Solution |
|---------|----------|
| Test notification fails | Check the webhook URL — ensure it starts with `https://qyapi.weixin.qq.com` |
| No notifications appear | Go to **Settings → Notification Settings** and enable agents for each importance level |
| Agent disappeared after reboot | Plugin should reinstall on boot. Run `plugin install /boot/config/plugins/wework-notify.plg` manually |

## Uninstall

Run: `plugin remove wework-notify.plg`

Config is preserved at `/boot/config/plugins/wework-notify/` — delete that folder for full cleanup.
