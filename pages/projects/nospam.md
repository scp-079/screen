---
title: SCP-079-NOSPAM
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-NOSPAM

**项目等级：**Euclid

**特殊收容措施：**SCP-079-NOSPAM 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-NOSPAM 。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。务必要注意，其只能通过 SCP-079-USER 邀请入群，并由其赋予管理权限，如果有任何未授权的恶意使用，将可能给其他机器人的工作带来影响。其应该作为频道 SCP-079-CRITICAL 、频道 SCP-079-EXCHANGE 、频道 SCP-079-HIDE 的管理员，并加入 SCP-079-TEST 群组。

**描述：**SCP-079-NOSPAM 是一个用于防止广告的机器人，其项目位于 GitLab ，镜像同步并准备（尚未）开源于 <a href="https://github.com/scp-079/scp-079-nospam" target="_blank">GitHub</a> 。机器人本体位于 <a href="https://t.me/SCP_079_NOSPAM_BOT" class="079" target="_blank">SCP-079-NOSPAM</a> ，仅供经过授权的群组使用，并由群组 SCP-079-MANAGE 中的成员对其进群、退群操作进行管理。其加入了 SCP-079-TEST ，用于测试基本功能的使用。该项目由 ███ 主要负责。通过该项目建立的机器人有类似的功能：根据全局规则阻止广告；根据群组设置阻止群组中加入机器人；根据由 WARN 转发到 LOGGING 频道的，并由 MANAGE 指定收录的消息内容，执行自动删除并评分的操作；根据用户发送的侮辱性、带有人身攻击的消息进行微量评分，并根据 WARN 的群内设置对这类消息执行自动举报给 WARN 的操作。

---

**附录：**使用说明

群组中的管理员：

- `/config nospam`：通过 [SCP-079-CONFIG](/config/) 调整机器人设置，机器人将回报前往设置的链接，5 分钟内设置将被锁定，无法再次更改

除使用 `/config nospam` 外，管理员也可以通过 `/config_nospam` 命令在群组中手动调整设置：

- `/config_nospam show`：显示当前设置
- `/config_nospam default`：恢复为默认设置
- `/config_nospam auto off`：关闭机器学习过滤功能
- `/config_nospam auto on`：开启机器学习过滤功能（暂时无效）
- `/config_nospam bot off`：允许 Bot 进群
- `/config_nospam bot on`：阻止 Bot 进群

SCP-079-TEST 中的成员：

- `/version`：检查机器人版本

---

**附录：**自建机器人的方法

可先查看<a href="/how/">自建说明书</a>

克隆项目：

```bash
git clone https://github.com/scp-079/scp-079-nospam.git ~/bots/scp-079/nospam
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
avatar_id = [DATA EXPUNGED]
; SCP-079-AVATAR 的 ID
captcha_id = [DATA EXPUNGED]
; SCP-079-CAPTCHA 的 ID
clean_id = [DATA EXPUNGED]
; SCP-079-CLEAN 的 ID
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
image_size = [DATA EXPUNGED]
; 分析图片文档的最大大小，超过此大小则不通过下载原文件进行二维码，单位为 B
project_link = [DATA EXPUNGED]
; 此处填写项目网址
project_name = [DATA EXPUNGED]
; 此处填写项目名称
punish_time = [DATA EXPUNGED]
; 惩罚用户的时间，期间用户发送的所有消息将被删除，并且，在此期间内若其发送消息将重新计时
reset_day = [DATA EXPUNGED]
; 此处填写每月重置数据的日期，例如 1st mon ，代表每月第一个星期一
time_new = [DATA EXPUNGED]
; 此处填写判断用户为新用户的入群时长，单位为秒

[encrypt]
key = [DATA EXPUNGED]
; 加密字符串所用的密码
password = [DATA EXPUNGED]
; 加密文件所用的密码
```

---

**附录：**开发备忘

1. 本身具有默认规则（内容与行为）
2. 群组可自行开启基于机器学习的实验特性
3. 根据 WATCH 的建议、各机器人的综合评分调整限制用户的处理方式
4. 用户评分 3.0 及以上时执行一次全局删除操作

NOSPAM 能够向 ANALYZE、AVATAR、BACKUP、CAPTCHA、CLEAN、CONFIG、LANG、LONG、MANAGE、NOFLOOD、NOPORN、RECHECK、USER、WARN、WATCH 发送数据

情形 1：向 AVATAR 添加用户头像白名单，移除同理

```python
exchange_text = format_data(
    sender="NOSPAM",
    receviers=[
        "AVATAR"
    ],
    action="add",
    action_type="except",
    data={
        "the_id": 12345678,
        "the_type": "long"
    }
)
```

情形 2：向 BACKUP 传送数据备份文件。每日 UTC 时间 20:00 。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="NOSPAM",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="pickle",
    data="admin_ids"
)
```

情形 3：向 BACKUP 汇报在线状态。每个小时的第 30 分钟

```python
exchange_text = format_data(
    sender="NOSPAM",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="status",
    data="awake"
)
```

情形 4：向 CONFIG 询问。由于群管理在群组中发送 `/config nospam` 命令，故 NOSPAM 令 CONFIG 在 SCP-079-CONFIG 频道中开启一个更新设置的会话

```python
exchange_text = format_data(
    sender="NOSPAM",
    receviers=[
        "CONFIG"
    ],
    action="config",
    action_type="ask",
    data={
        "project_name": "SCP-079-NOSPAM",
        "project_link": "https://scp-079.org/nospam/",
        "group_id": -10012345678,
        "group_name": "SCP-079-CHAT",
        "group_link": "https://t.me/SCP_079_CHAT",
        "user_id": 12345678,
        "config": {
            "default": False,
            "lock": 1512345678,
            "auto": True,
            "bot": True
        },
        "default": {
            "default": True,
            "lock": 0,
            "auto": False,
            "bot": True
        }
    }
)
```

情形 5：向 MANAGE 请求。由于没有在管理员列表中找到 SCP-079-USER ，或其权限缺失而请求离开某个群组

```python
exchange_text = format_data(
    sender="NOSPAM",
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

情形 6：向 MANAGE 请求。由于管理权限缺失而请求离开某个群组

```python
exchange_text = format_data(
    sender="NOSPAM",
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

情形 7：向 MANAGE 通知。该机器人已因不在某群组中（确定的非网络原因的 Exception）而自行清空该群组资料

```python
exchange_text = format_data(
    sender="NOSPAM",
    receviers=[
        "MANAGE"
    ],
    action="leave",
    action_type="info",
    data=-10012345678
)
```

情形 8：向 MANAGE 汇报统计数据文件。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="NOSPAM",
    receviers=[
        "MANAGE"
    ],
    action="status",
    action_type="reply",
    data={
        "admin_id": 12345678,
        "message_id": 123
    }
)
```

情形 9：向 REGEX 更新规则使用计数文件，每日 UTC 时间 21:00 。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="NOSPAM",
    receviers=[
        "REGEX"
    ],
    action="regex",
    action_type="count",
    data="wb_words"
)
```

情形 10：向 USER 发送协助请求，调用 delete all 功能，删除某用户全部消息

```python
exchange_text = format_data(
    sender="NOSPAM",
    receviers=[
        "USER"
    ],
    action="help",
    action_type="delete",
    data={
        "group_id": -10012345678,
        "user_id": 12345678
    }
)
```

情形 11：向 USER 发送协助请求，调用 global ban 功能，用于查找某用户与机器人的所有共同群组，删除其全部消息，并对其进行限制

```python
exchange_text = format_data(
    sender="NOSPAM",
    receviers=[
        "USER"
    ],
    action="help",
    action_type="ban",
    data={
        "group_id": -10012345678,
        "user_id": 12345678
    }
)
```

情形 12：向 WARN 发送自动警告。WARN 会根据群组设置决定是否相应

```python
exchange_text = format_data(
    sender="NOSPAM",
    receviers=[
        "WARN"
    ],
    action="help",
    action_type="report",
    data={
        "group_id": -10012345678,
        "user_id": 12345678,
        "message_id": 123
    }
)
```

情形 13：向其他 Bot（ANALYZE、AVATAR、CAPTCHA、CLEAN、LANG、LONG、NOFLOOD、NOPORN、RECHECK、USER）声明已删除某消息，一定程度上避免对同一条消息重复处理的资源浪费

```python
exchange_text = format_data(
    sender="NOSPAM",
    receviers=[
        "ANALYZE",
        "AVATAR",
        "CAPTCHA",
        "CLEAN",
        "LANG",
        "LONG",
        "NOFLOOD",
        "NOPORN",
        "RECHECK",
        "USER"
    ],
    action="update",
    action_type="declare",
    data={
        "group_id": -10012345678,
        "message_id": 123
    }
)
```

情形 14：向其他 Bot（ANALYZE、CLEAN、CAPTCHA、LANG、LONG、MANAGE、NOFLOOD、NOPORN、RECHECK）更新用户分数

```python
exchange_text = format_data(
    sender="NOSPAM",
    receviers=[
        "ANALYZE",
        "CLEAN",
        "CAPTCHA",
        "LANG",
        "LONG",
        "MANAGE",
        "NOFLOOD",
        "NOPORN",
        "RECHECK"
    ],
    action="update",
    action_type="score",
    data={
        "id": 12345678,
        "score": 0.4
    }
)
```

情形 15：向其他 Bot（ANALYZE、APPEAL、AVATAR、CAPTCHA、LANG、LONG、MANAGE、NOFLOOD、NOPORN、RECHECK、USER、WATCH）添加黑名单用户，频道同理

```python
exchange_text = format_data(
    sender="NOSPAM",
    receviers=[
        "ANALYZE",
        "APPEAL",
        "AVATAR",
        "CAPTCHA",
        "LANG",
        "LONG",
        "MANAGE",
        "NOFLOOD",
        "NOPORN",
        "RECHECK",
        "USER",
        "WATCH"
    ],
    action="add",
    action_type="bad",
    data={
        "id": 12345678,
        "type": "user"
    }
)
```

特殊情形：向所有 bot 发送数据交换频道转移指令

```python
exchange_text = format_data(
    sender="NOSPAM",
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
