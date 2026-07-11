# WeWork Notify for Unraid

将 Unraid 系统通知转发到企业微信群聊。

## 安装

在 Unraid Web UI 中：
1. **Plugins → Install Plugin**
2. 粘贴以下 URL：
   ```
   https://raw.githubusercontent.com/Turbolento/wework-notify-unraid/master/wework-notify.plg
   ```
3. 点击 **Install**

## 配置

1. **Settings → Notification Settings → Notification Agents → WeWork**
2. 设置 **Agent function** 为 `Enabled`
3. 填入 **WebHook URL**（从企业微信群机器人获取）
4. 填入 **Application name**（如 `Unraid Server`）
5. 配置 **Notification Title** 和 **Notification Message** 的字段选择
6. 点击 **Apply**，然后点击 **Test** 验证

## 获取 Webhook URL

1. 打开企业微信群聊
2. 点击 `...` → **群机器人**
3. 添加机器人，复制 webhook 地址
4. 格式：`https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=YOUR_KEY`

## 消息格式

使用 markdown_v2 格式，重要性用 emoji 区分：

| 级别 | emoji | 说明 |
|------|-------|------|
| normal | 🔵 | 普通信息 |
| warning | ⚠️ | 需关注的问题 |
| alert | 🚨 | 严重错误 |

支持在标题和正文中自由选择显示哪些字段（事件、主题、时间戳、说明、重要性、内容、链接）。

## 卸载

**Settings → Notification Settings → Notification Agents → WeWork → Delete**

或命令行：
```bash
plugin remove wework-notify.plg
```

## 手动安装

```bash
plugin install https://raw.githubusercontent.com/Turbolento/wework-notify-unraid/master/wework-notify.plg
```

## 要求

- Unraid 6.12.0+
- 企业微信群机器人 webhook
