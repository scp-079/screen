---
title: SCP-079-WARN
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-WARN

**项目等级：**Euclid

**特殊收容措施：**SCP-079-WARN 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-WARN 。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。务必要注意，其只能通过 SCP-079-USER 邀请入群，并由其赋予管理权限，如果有任何未授权的恶意使用，将可能给其他机器人的工作带来影响。其应该作为频道 SCP-079-CRITICAL 、频道 SCP-079-EXCHANGE 、频道 SCP-079-HIDE 的管理员，并加入 SCP-079-TEST 群组。

**描述：**SCP-079-WARN 是一个用于群组成员管理的机器人，其项目位于 GitLab ，镜像同步并准备（尚未）开源于 <a href="https://github.com/scp-079/scp-079-warn" target="_blank">GitHub</a> 。机器人本体位于 <a href="https://t.me/SCP_079_WARN_BOT" class="079" target="_blank">SCP-079-WARN</a> ，仅供经过授权的群组使用，并由群组 SCP-079-MANAGE 中的成员对其进群、退群操作进行管理。其加入了 SCP-079-TEST ，用于测试基本功能的使用。该项目由 ███ 主要负责。通过该项目建立的机器人有类似的功能：根据管理员命令警告、封禁某用户，接受普通用户的举报，提供普通用户 mention 管理员的便捷方法，提供自动对可疑行为进行举报的功能（需要群组同时使用 SCP-079-NOSPAM），提供群员向管理手动举报的功能。机器人将每月定时清除用户数据（受警告次数，被群组封禁的情况）。对于用户举报、或自动举报的回报消息，请及时处理，不要删除，除非您手动对举报双方执行 `/forgive` 命令，否则举报人由于其举报状态未被解除，一小时内其将无法再次使用举报功能；而被举报用户由于有未被处理的举报，故一小时内也不再接受其新的举报。具体操作详见附录中的使用说明。

---

**附录：**使用说明

群组中的管理员：

- `/config warn`：通过 [SCP-079-CONFIG](/config/) 调整机器人设置，机器人将回报前往设置的链接，5 分钟内设置将被锁定，无法查看和更改设置
- `/ban`：以此命令回复某用户发送的消息或有效的回报消息，封禁该用户
- `/warn`：以此命令回复某用户发送的消息或有效的回报消息，警告该用户
- `/forgive`：以此命令回复某用户发送的消息或有效的回报消息，清除该用户警告，或解禁该用户，或重置该用户的举报状态
- `按钮：解禁`：当某用户被封禁后，点击此按钮解禁该用户
- `按钮：撤销`：当某用户被警告后，点击此按钮撤销该用户的警告
- `按钮：警告`：当某用户被举报时，点击此按钮警告被举报的用户
- `按钮：封禁`：当某用户被举报时，点击此按钮封禁被举报的用户
- `按钮：取消`：当某用户被举报时，点击此按钮取消该举报
- `按钮：滥用`：当某用户被手动举报时，点击此按钮警告举报人
- `/undo`：对应按钮 “解禁” 和 “撤销”，以此命令回复某条由 `/ban` 或 `/warn` 触发的有效汇报消息，解禁某用户或撤销某用户警告
- `/report warn`：对应按钮 “警告”，以此命令回复某条举报汇报消息，警告被举报的用户
- `/report ban`：对应按钮 “封禁”，以此命令回复某条举报汇报消息，封禁被举报的用户
- `/report cancel`：对应按钮 “取消”，以此命令回复某条举报汇报消息，取消该条举报
- `/report spam`：对应按钮 “滥用”，以此命令回复某条举报汇报消息，警告举报者

除使用 `/config warn` 外，管理员也可以通过 `/config_warn` 命令在群组中手动调整设置：

- `/config_warn show`：显示当前设置
- `/config_warn default`：恢复为默认设置
- `/config_warn limit 5`：设置警告上限，上限应介于 2 和 5 之间，默认为 3
- `/config_warn mention off`：关闭呼叫管理功能（默认设置） 
- `/config_warn mention on`：打开呼叫管理功能
- `/config_warn report off`：关闭所有举报功能（默认设置）
- `/config_warn report auto`：仅启用自动举报功能，仅当 SCP-079-NOSPAM 在该群组中时真正有效
- `/config_warn report manual`：仅启用手动举报功能
- `/config_warn report both`：同时启动自动和手动举报功能

群组中的普通成员：

- `/admin`、`/admins`：发送此命令，呼叫至多 6 名管理员，仅在群组启用呼叫管理功能时有效
- `/report`：以此命令回复某用户发送的消息，向至多 6 名管理员举报该用户，仅在群组启用手动举报功能时有效

SCP-079-TEST 中的成员：

- `/version`：检查机器人版本

---

**附录：**自建机器人的方法

可先查看<a href="/how/">自建说明书</a>

克隆项目：

```bash
git clone https://github.com/scp-079/scp-079-warn.git ~/bots/scp-079/warn
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

[bots]
clean_id = [DATA EXPUNGED]
; SCP-079-CLEAN 的 ID
captcha_id = [DATA EXPUNGED]
; SCP-079-CAPTCHA 的 ID
lang_id = [DATA EXPUNGED]
; SCP-079-LANG 的 ID
long_id = [DATA EXPUNGED]
; SCP-079-LONG 的 ID
noflood_id = [DATA EXPUNGED]
; SCP-079-NOFLOOD 的 ID
noporn_id = [DATA EXPUNGED]
; SCP-079-NOPORN 的 ID
nospam_id = [DATA EXPUNGED]
; SCP-079-NOSPAM 的 ID
recheck_id = [DATA EXPUNGED]
; SCP-079-RECHECK 的 ID
tip_id = [DATA EXPUNGED]
; SCP-079-TIP 的 ID
user_id = [DATA EXPUNGED]
; SCP-079-USER 的 ID
warn_id = [DATA EXPUNGED]
; SCP-079-WARN 的 ID

[channels]
critical_channel_id = [DATA EXPUNGED]
; 此处填写紧急频道 SCP-079-CRITICAL 的 ID
debug_channel_id = [DATA EXPUNGED]
; 此处填写调试频道 SCP-079-DEBUG 的 ID
exchange_channel_id = [DATA EXPUNGED]
; 此处填写数据交换频道 SCP-079-EXCHANGE 的 ID
; 关于数据交换频道的详情，请查看 https://scp-079.org/exchange/
hide_channel_id = [DATA EXPUNGED]
; 此处填写数据交换备份频道 SCP-079-HIDE 的 ID
logging_channel_id = [DATA EXPUNGED]
; 此处填写证据存放频道 SCP-079-LOGGING 的 ID
test_group_id = [DATA EXPUNGED]
; 此处填写测试群组 SCP-079-TEST 的 ID

[custom]
default_group_link = [DATA EXPUNGED]
; 此处填写调试信息中默认的群组链接
project_link = [DATA EXPUNGED]
; 此处填写项目网址
project_name = [DATA EXPUNGED]
; 此处填写项目名称
reset_day = [DATA EXPUNGED]
; 此处填写每月重置数据的日期，例如 1st mon ，代表每月第一个星期一

[encrypt]
password = [DATA EXPUNGED]
; 加密文件所用的密码
```

---

**附录：**开发备忘

1. 记录用户警告和封禁状况
2. 通过计算用户受警告或封禁的群组数量，向其他机器人更新用户分数
3. 项目等级为：**Euclid**

WARN 能够向 ANALYZE、BACKUP、CAPTCHA、LANG、LONG、MANAGE、NOFLOOD、NOPORN、NOSPAM、RECHECK、USER 发送数据

情形 1：向 BACKUP 传送数据备份文件。每日 UTC 时间 20:00 。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="WARN",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="pickle",
    data="admin_ids"
)
```

情形 2：向 BACKUP 汇报在线状态。每个小时的第 30 分钟

```python
exchange_text = format_data(
    sender="WARN",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="status",
    data="awake"
)
```

情形 3：向 CONFIG 询问。由于群管理在群组中发送 `/config warn` 命令，故 WARN 令 CONFIG 在 SCP-079-CONFIG 频道中开启一个更新设置的会话

```python
exchange_text = format_data(
    sender="WARN",
    receviers=[
        "CONFIG"
    ],
    action="config",
    action_type="ask",
    data={
        "project_name": "SCP-079-WARN",
        "project_link": "https://scp-079.org/warn/",
        "group_id": -10012345678,
        "group_name": "SCP-079-CHAT",
        "group_link": "https://t.me/SCP_079_CHAT",
        "user_id": 12345678,
        "config": {
            "default": False,
            "lock": 1512345678,
            "limit": 3,
            "mention": True,
            "report": {
                "auto": True,
                "manual": True
            }
        },
        "default": {
            "default": True,
            "lock": 0,
            "limit": 3,
            "mention": False,
            "report": {
                "auto": False,
                "manual": False
            }
        }
    }
)
```

情形 4：向 MANAGE 请求。由于没有在管理员列表中找到 SCP-079-USER ，或其权限缺失而请求离开某个群组

```python
exchange_text = format_data(
    sender="WARN",
    receviers=[
        "MANAGE"
    ],
    action="leave",
    action_type="request",
    data={
        "group_id": -10012345678,
        "group_name": "SCP-079-CHAT",
        "group_link": "https://t.me/SCP_079_CHAT",
        "reason"： "user"
    }
)
```

情形 5：向 MANAGE 请求。由于管理权限缺失而请求离开某个群组

```python
exchange_text = format_data(
    sender="WARN",
    receviers=[
        "MANAGE"
    ],
    action="leave",
    action_type="request",
    data={
        "group_id": -10012345678,
        "group_name": "SCP-079-CHAT",
        "group_link": "https://t.me/SCP_079_CHAT",
        "reason"： "permissions"
    }
)
```

情形 6：向其他 Bot（ANALYZE、CLEAN、CAPTCHA、LANG、LONG、MANAGE、NOFLOOD、NOPORN、NOSPAM、RECHECK）更新用户分数

```python
exchange_text = format_data(
    sender="WARN",
    receviers=[
        "ANALYZE",
        "CLEAN",
        "CAPTCHA",
        "LANG",
        "LONG",
        "MANAGE",
        "NOFLOOD",
        "NOPORN",
        "NOSPAM",
        "RECHECK"
    ],
    action="update",
    action_type="score",
    data={
        "id": 12345678,
        "score": 1.0
    }
)
```

特殊情形：向所有 bot 发送数据交换频道转移指令

```python
exchange_text = format_data(
    sender="WARN",
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
