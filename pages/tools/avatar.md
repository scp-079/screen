---
title: SCP-079-AVATAR
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-AVATAR

**项目等级：**Keter

**特殊收容措施：**SCP-079-AVATAR 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-AVATAR 。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。务必要注意，其机器人的真实身份应对所有人保持隐秘（除维护该机器人的人员以外的所有人士，包括核心管理人员），否则将可能给其他机器人的工作带来影响。其应该作为频道 SCP-079-HIDE 的管理员。

**描述：**SCP-079-AVATAR 是一个用于将新入群用户头像发至 NOSPAM 进行分析的机器人（user-bot），其项目位于 GitLab ，镜像同步并准备（尚未）开源于 <a href="https://github.com/scp-079/scp-079-avatar" target="_blank">GitHub</a> 。机器人的展示身份位于 <a href="https://t.me/SCP_079_AVATAR_BOT" class="079" target="_blank">SCP-079-AVATAR</a> ，真实身份为隐藏状态，且并不接受任何直接管理。该项目由 ███ 主要负责。通过该项目建立的机器人有类似的功能：发送新用户的头像数据至 NOSPAM，供其进行分析，避免 spammer 有意屏蔽 NOSPAM 使其无法获取头像。具体操作详见附录中的使用说明。

---

**附录：**使用说明

SCP-079-TEST 中的成员：

- `/version` ：间接检查机器人版本

---

**附录：**自建机器人的方法

可先查看<a href="/how/">自建说明书</a>

克隆项目：

```bash
git clone https://github.com/scp-079/scp-079-avatar.git ~/bots/scp-079/avatar
```

SCP-079-AVATAR 应加入成员人数较多的群组，其加入的群组只可以为 SCP-079-NOSPAM 机器人所在的群组，但不可加入 SCP-079-NOSPAM 所在的全部群组

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
    handlers.message

[proxy]
enabled = False
; 可根据需要自行决定是否使用 SOCKS5 代理
hostname = 127.0.0.1
port = 1080

[channels]
hide_channel_id = [DATA EXPUNGED]
; 此处填写数据交换备份频道 SCP-079-HIDE 的 ID

[custom]
reset_day = [DATA EXPUNGED]
; 此处填写每月重置数据的日期，例如 1st mon ，代表每月第一个星期一
time_new = [DATA EXPUNGED]
; 此处填写判断用户为新用户的入群时长，单位为秒

[encrypt]
password = [DATA EXPUNGED]
; 加密文件所用的密码
```

---

**附录：**开发备忘

1. 发送新用户头像前，检查记录，查看是否有必要重复发送同一用户的头像
2. 必要时，应添加对头像复查的功能

AVATAR 能够向 BACKUP、HIDE、NOSPAM、REGEX 发送数据

情形 1：向 BACKUP 传送数据备份文件。每日 UTC 时间 20:00 。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="AVATAR",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="pickle",
    data="user_ids"
)
```

情形 2：向 BACKUP 汇报在线状态。每个小时的第 30 分钟：

```python
exchange_text = format_data(
    sender="AVATAR",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="status",
    data="awake"
)
```

情形 3：向 HIDE 回复版本号

```python
exchange_text = format_data(
    sender="AVATAR",
    receviers=[
        "HIDE"
    ],
    action="version",
    action_type="reply",
    data={
        "admin_id": 12345678,
        "message_id": 123,
        "version": 0.0.1
    }
)
```

情形 4：向 REGEX 更新规则使用计数文件，每日 UTC 时间 21:00 。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="AVATAR",
    receviers=[
        "REGEX"
    ],
    action="regex",
    action_type="count",
    data="nm_words"
)
```

特殊情形：向所有 bot 发送数据交换频道转移指令

```python
exchange_text = format_data(
    sender="HIDE",
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
