**WeWork Notify**

Forward Unraid system notifications to WeWork (企业微信) group chats via webhook.

**Setup:**

1. In WeWork group chat, add a webhook robot and copy the webhook URL
2. Go to **Settings -> Notification Settings -> Notification Agents -> WeWork**
3. Set Agent function to **Enabled**
4. Fill in your **WebHook URL** and **Application Name**
5. Configure **Notification Title** and **Notification Message** field selections
6. Click **Apply**, then **Test** to verify

**Features:**
- All Unraid notifications (array, disks, Docker, VMs, system events)
- Markdown_v2 format with importance emoji
- Configurable title/message fields
- Zero external dependencies
