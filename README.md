# WeWork Notify for Unraid

将 Unraid 系统通知转发到企业微信群聊。

![IMG_5903(20260714-160157)](./README.assets/IMG_5903(20260714-160157).PNG)

## 安装

在 Unraid Web UI 中：**Plugins → Install Plugin** → 粘贴：

```
https://raw.githubusercontent.com/Turbolento/wework-notify-unraid/master/wework-notify.plg
```

### 手动CLI安装

进入unraid命令行，执行如下命令：

```bash
plugin remove wework-notify.plg 2>/dev/null
rm -f /var/log/plugins/wework-notify.*

curl -s "https://raw.githubusercontent.com/Turbolento/wework-notify-unraid/master/wework-notify.plg" \
  -o /boot/config/plugins/wework-notify.plg

curl -s "https://raw.githubusercontent.com/Turbolento/wework-notify-unraid/master/release/wework-notify.txz" \
  -o /boot/config/plugins/wework-notify/wework-notify.txz

plugin install /boot/config/plugins/wework-notify.plg
```

## 配置

1. **Settings → Notification Settings → Notification Agents → WeWork**
2. 设置 **Agent function** 为 `Enabled`
3. 填入 **WebHook URL**（从企业微信群机器人获取）
4. 填入 **Application name**（如 `Unraid Server`）
5. 配置 **Notification Title** 和 **Notification Message** 的字段选择
6. 点击 **Apply**，然后点击 **Test** 验证

## 获取 Webhook URL

1. 打开企业微信群聊 → `...` → **群机器人** → 添加机器人
2. 复制 webhook 地址，格式：`https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=YOUR_KEY`

## 消息格式

markdown_v2，各字段带标签前缀，重要性 emoji 区分：

| 级别 | emoji |
|------|-------|
| normal | 🔵 |
| warning | ⚠️ |
| alert | 🚨 |

示例输出：

```markdown
## 🔵 [normal] Unraid Server
> Array started successfully
> **事件**: Array Start
> **时间**: 2026-07-11 18:30:00
> **说明**: Array has been started
> **级别**: normal
> [查看详情](http://tower.local/Main)
```

> 标签前缀自动跟随你在 UI 中的字段选择。

## 更新

```bash
plugin remove wework-notify.plg
rm -f /var/log/plugins/wework-notify.*
# 用上面的 SOCKS5 方式重新下载安装，或直接 Web UI 粘贴 PLG URL
```

更新后需在 Notification Agents 页面点击 **Apply** 使最新脚本生效。

## 卸载

**Settings → Notification Settings → Notification Agents → WeWork → Delete**，或：

```bash
plugin remove wework-notify.plg
```

## 要求

- Unraid 6.12.0+
- 企业微信群机器人 webhook
