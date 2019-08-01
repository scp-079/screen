---
title: SCP-079-CONFIG
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-CONFIG

**项目等级：**Safe

**特殊收容措施：**SCP-079-CONFIG 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-CONFIG 。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。其应该作为频道 SCP-079-EXCHANGE 、频道 SCP-079-CONFIG 、频道 SCP-079-HIDE 的管理员，并加入 SCP-079-TEST 群组。

**描述：**SCP-079-CONFIG 是一个用于管理各机器人设置的机器人，其项目位于 GitLab ，镜像同步并开源于 <a href="https://github.com/scp-079/scp-079-config" target="_blank">GitHub</a> 。机器人本体位于 <a href="https://t.me/SCP_079_CONFIG_BOT" class="079" target="_blank">SCP-079-CONFIG</a> ，并不接受任何直接管理。其加入了 SCP-079-TEST 群组，用于其自身运行状态。该项目由 ███ 主要负责。通过该项目建立的机器人有类似的功能：根据其他机器人的请求，在 SCP-079-CONFIG 频道中提供带按钮的设置会话，每个会话的有效时间为 5 分钟。具体操作详见附录中的使用说明。

---

**附录：**使用说明

发起设置请求的群组管理员：

在群组中发送请求设置某个机器人的命令，例如：`/config warn`

通过某机器人在群组内提供的链接，到达 SCP-079-CONFIG 频道，于 5 分钟内在此对某机器人进行设置，设置完毕后，点击提交按钮更新设置。

SCP-079-TEST 中的成员：

- `/version` ：检查机器人版本

---

**附录：**自建机器人的方法

可先查看<a href="/how/">自建说明书</a>

克隆项目：

```bash
git clone https://github.com/scp-079/scp-079-config.git ~/bots/scp-079/config
```

---

**文件#config.ini：**

修改配置文件：

需要对 `config.ini` 文件中内容为 `[DATA EXPUNGED]` 的全部键值进行修改。 API ID 与 API Hash 在 <a href="https://my.telegram.org" target="_blank">官网</a> 获取

```ini
[pyrogram]
api_id = [DATA EXPUNGED]
api_hash = [DATA EXPUNGED]
; 以上两条信息从官网申请获得

[plugins]
root = plugins
include =
    handlers.callback
    handlers.command
    handlers.message

[proxy]
enabled = False
; 可根据需要自行决定是否使用 SOCKS5 代理
hostname = 127.0.0.1
port = 1080

[basic]
bot_token = [DATA EXPUNGED]
; 此处填写在 @BotFather 处获得的 token
prefix = /!
; 命令前的可用字符，如在群组中使用非常规命令前缀，需要机器人有获取普通消息的权限

[channels]
config_channel_id = [DATA EXPUNGED]
; 此处填写设置频道 SCP-079-CONFIG 的 ID
critical_channel_id = [DATA EXPUNGED]
; 此处填写紧急频道 SCP-079-CRITICAL 的 ID
debug_channel_id = [DATA EXPUNGED]
; 此处填写调试频道 SCP-079-DEBUG 的 ID
exchange_channel_id = [DATA EXPUNGED]
; 此处填写数据交换频道 SCP-079-EXCHANGE 的 ID
; 关于数据交换频道的详情，请查看 https://scp-079.org/exchange/
hide_channel_id = [DATA EXPUNGED]
; 此处填写数据交换备份频道 SCP-079-HIDE 的 ID
test_group_id = [DATA EXPUNGED]
; 此处填写测试群组 SCP-079-TEST 的 ID
```

---

**附录：**开发备忘

1. 在 SCP-079-EXCHANGE 频道中等待来自其他机器人的设置请求
2. 收到请求，在 CONFIG 频道中发送设置会话，有效时间 5 分钟
3. 用户提交新的设置后，把数据传送回给请求的机器人
4. 项目等级为：**Safe**

CONFIG 能够向 BACKUP、CAPTCHA、CLEAN、LANG、LONG、NOFLOOD、NOPORN、NOSPAM、USER、WARN 发送数据。对所有这些接收者的数据，其操作仅可为 `config` ，操作类型可为 `commit` 、`reply`

情形 1：向 BACKUP 汇报在线状态。每个小时的第 30 分钟：

```python
exchange_text = format_data(
    sender="CONFIG",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="status",
    data="awake"
)
```

情形 2：向其他 Bot（CAPTCHA、CLEAN、LANG、LONG、NOFLOOD、NOPORN、NOSPAM、USER）回复设置请求的对话链接。这里以 WARN 为例：

```python
exchange_text = format_data(
    sender="CONFIG",
    receviers=[
        "WARN"
    ],
    action="config",
    action_type="reply",
    data={
        "group_id": -10012345678,
        "user_id": 12345678,
        "config_link": "https://t.me/SCP_079_CONFIG/123"
    }
)
```

情形 3：向其他 Bot（CAPTCHA、CLEAN、LANG、LONG、NOFLOOD、NOPORN、NOSPAM、USER）提交新的设置。这里以 WARN 为例：

```python
exchange_text = format_data(
    sender="CONFIG",
    receviers=[
        "WARN"
    ],
    action="config",
    action_type="reply",
    data={
        "group_id": -10012345678,
        "config": {
            "default": False,
            "lock": 1512345678,
            "limit": 4,
            "mention": True,
            "report": {
                "auto": False,
                "manual": True
            }
        }
    }
)
```

特殊情形：向所有 bot 发送数据交换频道转移指令

```python
exchange_text = format_data(
    sender="CONFIG",
    receviers=[
        "EMERGENCY"
    ],
    action="backup",
    action_type="hide",
    data=True
)
```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
<audio id="dooropen079" src="/audio/door/dooropen079.ogg"/>
