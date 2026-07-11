<?php
/**
 * Test endpoint for WeWork Notify plugin.
 * Receives a webhook URL via POST, sends a test notification, returns the result as JSON.
 */

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['errcode' => -1, 'errmsg' => 'POST required']);
    exit;
}

$url = $_POST['url'] ?? '';
if (empty($url)) {
    echo json_encode(['errcode' => -1, 'errmsg' => 'No webhook URL provided']);
    exit;
}

// Validate URL format (basic)
if (!preg_match('#^https?://qyapi\.weixin\.qq\.com/cgi-bin/webhook/send\?key=#', $url)) {
    echo json_encode(['errcode' => -1, 'errmsg' => 'Invalid webhook URL format']);
    exit;
}

$payload = json_encode([
    'msgtype' => 'markdown_v2',
    'markdown_v2' => [
        'content' => "## 🔵 Test Notification\n> **来源**: WeWork Notify Plugin\n> **状态**: 连接测试成功 ✅\n> \n> 如果你看到这条消息，说明 Unraid → 企业微信 通知通道已正常连通。"
    ]
], JSON_UNESCAPED_UNICODE);

$ch = curl_init();
curl_setopt_array($ch, [
    CURLOPT_URL => $url,
    CURLOPT_POST => true,
    CURLOPT_POSTFIELDS => $payload,
    CURLOPT_HTTPHEADER => ['Content-Type: application/json'],
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_CONNECTTIMEOUT => 5,
    CURLOPT_TIMEOUT => 10,
]);

$response = curl_exec($ch);
$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$curlError = curl_error($ch);
curl_close($ch);

if ($curlError) {
    echo json_encode(['errcode' => -1, 'errmsg' => "Connection failed: $curlError"]);
    exit;
}

if ($httpCode !== 200) {
    echo json_encode(['errcode' => -1, 'errmsg' => "HTTP $httpCode"]);
    exit;
}

// Pass through WeWork's response
echo $response;
