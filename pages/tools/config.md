---
title: SCP-079-CONFIG
---

<button onmouseover="PlaySound('totop1')" onmouseout="StopSound('totop1')" onclick="window.location.href = '/config-zh/';" class="zh">点此转至中文页面</button>

---

<link rel="stylesheet" href="/css/chinese.css">

**Item #：**SCP-079-CONFIG

**Object Class：**Safe

**Special Containment Procedures：**SCP-079-CONFIG is recommended to operate in a Linux environment. The program is available for Python 3.6 and above. Required third-party modules are listed in the `requirements.txt`. It should be the administrator of channel SCP-079-CRITICAL, SCP-079-EXCHANGE, SCP-079-CONFIG, SCP-079-HIDE and join the SCP-079-TEST group.

**Description：**SCP-079-CONFIG is a bot for configuring how other bots perform. The project is located in Gitlab, with mirrored source codes on <a href="https://github.com/scp-079/scp-079-config" target="_blank">GitHub</a> . The bot is presented as <a href="https://t.me/SCP_079_CONFIG_BOT" class="079" target="_blank">SCP-079-CONFIG</a> , but its real identity is hidden and does not accept any direct management. It joined SCP-079-TEST to test basic functions usage. ███ takes charge of this project. Bots based on this project have similar functions: open a configuration session with buttons in channel SCP-079-CONFIG in response to other bots’ requests, with a five-minute valid period for each session. Please refer to the instructions in the appendix for details.

---

**Appendix：**Operation instructions

For administrators in certain group：

Send command to request configuration for certain bots in group, like：`/config warn`

Jump to channel SCP-079-CONFIG using links given by certain bot, and configure settings to it in 5 minutes. When finished, click submit for updates to take effect.

For members of SCP-079-TEST：

- `/version`：Check the version of the bot.

---

**Appendix：**Steps to run a bot on your own

See <a href="/how/">Self Hosting Instructions</a> for general how-tos building a bot.

Clone Project：

```bash
git clone https://github.com/scp-079/scp-079-config.git ~/scp-079/config
```

---

**Document#config.ini：**

Modify the configuration file：

You will need to modify all the key values with `[DATA EXPUNGED]` in `config.ini`. API ID and API Hash are available on the <a href="https://my.telegram.org" target="_blank">official site</a> .

```ini
[pyrogram]
api_id = [DATA EXPUNGED]
api_hash = [DATA EXPUNGED]
; Obtain information above from the official site

[plugins]
root = plugins
include =
    handlers.callback
    handlers.command
    handlers.message

[proxy]
enabled = False
; Use a SOCKS5 proxy at your own demand
hostname = 127.0.0.1
port = 1080

[basic]
bot_token = [DATA EXPUNGED]
; Fill in the token obtained from @BotFather
prefix = /!
; Fill in available characters before the command ONLY if you want to use a NON-conventional command prefix in group. Bots will need the permission to get ordinary messages handling this.

[channels]
config_channel_id = [DATA EXPUNGED]
; Fill in the ID of SCP-079-CONFIG
critical_channel_id = [DATA EXPUNGED]
; Fill in. The ID of SCP-079-CRITICAL
debug_channel_id = [DATA EXPUNGED]
; Fill in the ID of SCP-079-DEBUG
exchange_channel_id = [DATA EXPUNGED]
; Fill in the ID of SCP-079-EXCHANGE
; Go to https://scp-079.org/exchange/ for more details on Data Exchange
hide_channel_id = [DATA EXPUNGED]
; Fill in the ID of SCP-079-HIDE 
test_group_id = [DATA EXPUNGED]
; Fill in the ID of SCP-079-TEST

[custom]
backup = [DATA EXPUNGED]
; Fill in True or False to indicate whether this program is a backup
date_reset = [DATA EXPUNGED]
; Fill in the date of monthly data reset, e.g., 1st Mon, represents the first Monday of each month 
project_link = https://scp-079.org/config/
; Fill in the project URL
project_name = SCP-079-CONFIG
; Fill in the project name
zh_cn = [DATA EXPUNGED]
; Fill in True or False to indicate whether this program enables Simplified Chinese mode

[encrypt]
password = [DATA EXPUNGED]
; Fill in the password used to encrypt files
```

---

**Appendix：**Development Notes

1. Wait for configuration requests from other bots in SCP-079-EXCHANGE
2. Open a session in CONFIG upon receipt, valid for 5 minutes
3. Deliver updated data to certain bot after new settings was submitted

CONFIG is allowed to send data to BACKUP、CAPTCHA、CLEAN、LANG、LONG、NOFLOOD、NOPORN、NOSPAM、RECHECK、TIP、USER、WARN. 对所有这些接收者的数据, 其操作仅可为 `config` , 操作类型可为 `commit` 、`reply`

Scene 1：Send daily backup files to BACKUP at UTC 20:00. `exchange_text` is its `caption`

```python
exchange_text = format_data(
    sender="CONFIG",
    receivers=[
        "BACKUP"
    ],
    action="backup",
    action_type="pickle",
    data="configs"
)
```

Scene 2：Report online status to BACKUP, during each startup

```python
exchange_text = format_data(
    sender="CONFIG",
    receivers=[
        "BACKUP"
    ],
    action="backup",
    action_type="status",
    data={
        "type": "online",
        "backup": false
    }
)
```

Scene 3：Report online status to BACKUP, at the 30th minute of each hour

```python
exchange_text = format_data(
    sender="CONFIG",
    receivers=[
        "BACKUP"
    ],
    action="backup",
    action_type="status",
    data="awake"
)
```

Scene 4：Reply links to configuration session for other Bots（CAPTCHA、CLEAN、LANG、LONG、NOFLOOD、NOPORN、NOSPAM、RECHECK、TIP、USER）. Take WARN as an example：

```python
exchange_text = format_data(
    sender="CONFIG",
    receivers=[
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

Scene 5：Apply updated settings for other Bots（CAPTCHA、CLEAN、LANG、LONG、NOFLOOD、NOPORN、NOSPAM、RECHECK、TIP、USER）. Take WARN as an example：

```python
exchange_text = format_data(
    sender="CONFIG",
    receivers=[
        "WARN"
    ],
    action="config",
    action_type="reply",
    data={
        "group_id": -10012345678,
        "config": {
            "default": False,
            "lock": 1512345678,
            "delete": True,
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

Special Case：Send location migration command for Data Exchange Channel to all other bots

```python
exchange_text = format_data(
    sender="CONFIG",
    receivers=[
        "EMERGENCY"
    ],
    action="backup",
    action_type="hide",
    data=True
)
```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
<audio id="dooropen079" src="/audio/door/dooropen079.ogg"/>
