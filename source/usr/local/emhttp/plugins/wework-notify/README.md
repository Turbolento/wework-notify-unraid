**WeWork Notify**

Forward Unraid system notifications to WeWork (企业微信) group chats via webhook.

**Setup:**

1. In WeWork group chat, add a webhook robot and copy the webhook URL
2. Go to **Settings → WeWork Notify** and paste the webhook URL
3. Click **Test Notification** to verify the connection
4. Enable the agent in **Settings → Notification Settings**

**Webhook URL format:**
`https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=YOUR_KEY`

**Features:**
- Forwards all Unraid notifications (array status, disk health, Docker events, etc.)
- Markdown formatting with importance-based emoji indicators (🔵 normal / ⚠️ warning / 🚨 alert)
- Zero dependencies (uses built-in curl)
- Supports notification links for one-click navigation to the relevant Unraid page
