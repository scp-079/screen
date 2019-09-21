---
title: SCP-079-CLEAN
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-CLEAN

**项目等级：**Euclid

**特殊收容措施：**SCP-079-CLEAN 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-CLEAN 。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。务必要注意，其只能通过 SCP-079-USER 邀请入群，并由其赋予管理权限，如果有任何未授权的恶意使用，将可能给其他机器人的工作带来影响。其应该作为频道 SCP-079-CRITICAL 、频道 SCP-079-EXCHANGE 、频道 SCP-079-HIDE 的管理员，并加入 SCP-079-TEST 群组。

**描述：**SCP-079-CLEAN 是一个用于过滤特定类型消息的机器人，其项目位于 GitLab ，镜像同步并准备（尚未）开源于 <a href="https://github.com/scp-079/scp-079-clean" target="_blank">GitHub</a> 。机器人本体位于 <a href="https://t.me/SCP_079_CLEAN_BOT" class="079" target="_blank">SCP-079-CLEAN</a> ，仅供经过授权的群组使用，并由群组 SCP-079-MANAGE 中的成员对其进群、退群操作进行管理。其加入了 SCP-079-TEST ，用于测试基本功能的使用。该项目由 ███ 主要负责。通过该项目建立的机器人有类似的功能：根据管理员设置，删除某类型的消息，并对部分类型消息进行评分记录，定时删除贴纸，定时清理无效成员，群员自助删除自身所发全部消息。具体操作详见附录中的使用说明。

---

**附录：**使用说明

群组中的管理员：

- `/config clean`：通过 [SCP-079-CONFIG](/config/) 调整机器人设置，机器人将回报前往设置的链接，5 分钟内设置将被锁定，无法再次更改
- `/clean`：删除三小时内群组内的贴纸和 GIF 动图
- `/dafm yes` 或 `/dafm y`：命令机器人删除自己发送的所有消息
- `/purge`：回复某条消息，删除自该条消息开始，到当前消息结束的所有消息。注意，使用该命令只能删除基于消息 ID 的最近 1000 条消息，大于此数值将不会做出应答

除使用 `/config clean` 外，管理员也可以通过 `/config_clean` 命令在群组中手动调整设置：

- `/config_clean show`：显示当前设置
- `/config_clean default`：恢复为默认设置

忽略或过滤某种消息、关闭或开启某种功能：

- `/config_clean [type] off`：忽略某类别消息、关闭某个功能
- `/config_clean [type] on`：删除某类别消息、开启某个功能

其中，`[type]` 应为以下类别之一：

- `con`：联系人（默认过滤）
- `loc`：定位地址（默认过滤）
- `vdn`：圆视频（默认过滤）
- `voi`：语音（默认过滤）
- `ast`：动态贴纸
- `aud`：音频
- `bmd`：以 / 为前缀，且不带有参数的机器人命令
- `doc`：文件
- `gam`：游戏
- `gif`：GIF 动图
- `via`：通过 Bot 发送的消息
- `vid`：视频
- `ser`：服务类消息，对于加群消息将保留最后一条（默认过滤）
- `sti`：贴纸
- `aff`：传统 AFF 链接、支付宝淘宝红包、大陆 APP 的各类活动推广分享
- `exe`：可执行文件，例如 APK、BAT、CMD、COM、EXE、PIF、SCR、VBS 文件
- `iml`：即时通讯软件的邀请链接或联系方式
- `sho`：短链接
- `tgl`：TG 链接，包括带 Telegram 域名的链接和 `@mention`，只过滤非当前群组 `username` 的 `@mention` 、不在群组中（或 `restricted`）的用户 `@mention`
- `tgp`：TG 代理
- `qrc`：二维码
- `sde`：群员可否自助删除自己所发所有消息
- `tcl`：每日定时清除位于群组和黑名单中的 Deleted Account
- `ttd`：定时删除贴纸和动图（三小时后）

群组中的普通成员：

- `/dafm yes` 或 `/dafm y`：如果群组设置允许，删除自己在该群所发的全部消息

SCP-079-TEST 中的成员：

- `发送消息`：如有匹配，显示判断内容
- `/version`：检查机器人版本

---

**附录：**自建机器人的方法

可先查看<a href="/how/">自建说明书</a>

克隆项目：

```bash
git clone https://github.com/scp-079/scp-079-clean.git ~/bots/scp-079/clean
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
time_ban = [DATA EXPUNGED]
; 建议追踪封禁状态维持的时间，单位为秒
time_sticker = [DATA EXPUNGED]
; 定时删除贴纸、动图所需的延迟时间，单位为秒

[encrypt]
key = [DATA EXPUNGED]
; 加密字符串所用的密码
password = [DATA EXPUNGED]
; 加密文件所用的密码
```

---

**附录：**开发备忘

1. 根据群组自定义设置自动删除某类别消息，在群组开启 AFF、EXE、SHO、TGL、TGP、QRC 消息过滤时，将具有封禁功能
2. 针对 AFF、EXE、IML、SHO、TGL、TGP、QRC 类型的消息进行较低分数的记录

CLEAN 能够向 ANALYZE、BACKUP、CAPTCHA、LANG、LONG、MANAGE、NOFLOOD、NOPORN、NOSPAM、RECHECK、USER 发送数据

情形 1：向 BACKUP 传送数据备份文件。每日 UTC 时间 20:00 。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="CLEAN",
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
    sender="CLEAN",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="status",
    data="awake"
)
```

情形 3：向 CONFIG 询问。由于群管理在群组中发送 `/config clean` 命令，故 CLEAN 令 CONFIG 在 SCP-079-CONFIG 频道中开启一个更新设置的会话

```python
exchange_text = format_data(
    sender="CLEAN",
    receviers=[
        "CONFIG"
    ],
    action="config",
    action_type="ask",
    data={
        "project_name": "SCP-079-CLEAN",
        "project_link": "https://scp-079.org/clean/",
        "group_id": -10012345678,
        "group_name": "SCP-079-CHAT",
        "group_link": "https://t.me/SCP_079_CHAT",
        "user_id": 12345678,
        "config": {
            "default": False,
            "lock": 1512345678,
            "con": True,
            "loc": True,
            "vdn": True,
            "voi": True,
            "ast": False,
            "aud": False,
            "bmd": True,
            "doc": False,
            "gam": False,
            "gif": False,
            "via": False,
            "vid": False,
            "ser": True,
            "sti": False,
            "aff": False,
            "exe": False,
            "iml": False,
            "sho": False,
            "tgl": False,
            "tgp": False,
            "qrc": False,
            "sde": False,
            "tcl": False,
            "ttd": False
        },
        "default": {
            "default": True,
            "lock": 0,
            "con": True,    # 联系人
            "loc": True,    # 定位地址
            "vdn": True,    # 圆视频
            "voi": True,    # 语音
            "ast": False,    # 动态贴纸
            "aud": False,    # 音频
            "bmd": False,    # 以 / 为前缀的机器人命令
            "doc": False,    # 文件
            "gam": False,    # 游戏
            "gif": False,    # GIF 动图
            "via": False,    # 通过 Bot 发送的消息
            "vid": False,    # 视频
            "ser": True,    # 服务类消息，对于加群消息将保留最后一条
            "sti": False,    # 贴纸
            "aff": False,    # 传统 AFF 链接、支付宝淘宝红包、大陆 APP 的各类活动推广分享
            "exe": False,    # APK、BAT、CMD、COM、EXE、PIF、SCR、VBS 文件
            "iml": False,    # 即时通讯软件的邀请链接或联系方式
            "sho": False,    # 短链接
            "tgl": False,    # TG 链接
            "tgp": False,    # TG 代理
            "qrc": False,    # 二维码
            "sde": False,    # 群员可否自助删除自己所发所有消息
            "tcl": False,    # 每日定时清除位于群组和黑名单中的 Deleted Account
            "ttd": False    # 定时删除贴纸，动态贴纸，和 GIF 动图（三小时后）
        }
    }
)
```

情形 4：向 MANAGE 请求。由于没有在管理员列表中找到 SCP-079-USER ，或其权限缺失而请求离开某个群组

```python
exchange_text = format_data(
    sender="CLEAN",
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
    sender="CLEAN",
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

情形 6：向 MANAGE 通知。该机器人已因不在某群组中（确定的非网络原因的 Exception）而自行清空该群组资料

```python
exchange_text = format_data(
    sender="CLEAN",
    receviers=[
        "MANAGE"
    ],
    action="leave",
    action_type="info",
    data=-10012345678
)
```

情形 7：向 REGEX 更新规则使用计数文件，每日 UTC 时间 21:00 。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="CLEAN",
    receviers=[
        "REGEX"
    ],
    action="update",
    action_type="download",
    data="wb_words"
)
```

情形 8：向 USER 发送协助请求，调用 delete all 功能，用于实现单个群组的 /dafm 功能

```python
exchange_text = format_data(
    sender="CLEAN",
    receviers=[
        "USER"
    ],
    action="help",
    action_type="delete",
    data={
        "group_id": -10012345678,
        "user_id": 12345678,
        "type": "single"
    }
)
```

情形 9：向 USER 发送协助请求，调用 delete all 功能，删除某用户全部消息，范围：所有群组（评分过高或受追踪时的触发）

```python
exchange_text = format_data(
    sender="CLEAN",
    receviers=[
        "USER"
    ],
    action="help",
    action_type="delete",
    data={
        "group_id": -10012345678,
        "user_id": 12345678,
        "type": "global"
    }
)
```

情形 10：向 USER 发送协助请求，调用 global ban 功能，用于查找某用户与机器人的所有共同群组，删除其全部消息，并对其进行限制

```python
exchange_text = format_data(
    sender="CLEAN",
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

情形 11：向其他 Bot（ANALYZE、CAPTCHA、LANG、LONG、NOFLOOD、NOPORN、NOSPAM、RECHECK、USER）声明已删除某消息，一定程度上避免对同一条消息重复处理的资源浪费

```python
exchange_text = format_data(
    sender="CLEAN",
    receviers=[
        "ANALYZE",
        "CAPTCHA",
        "LANG",
        "LONG",
        "NOFLOOD",
        "NOPORN",
        "NOSPAM",
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

情形 12：向其他 Bot（ANALYZE、LANG、LONG、MANAGE、NOFLOOD、NOPORN、NOSPAM、RECHECK）更新用户分数

```python
exchange_text = format_data(
    sender="CLEAN",
    receviers=[
        "ANALYZE",
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
        "score": 0.3
    }
)
```

情形 13：向其他 Bot（ANALYZE、CAPTCHA、LANG、LONG、MANAGE、NOFLOOD、NOPORN、NOSPAM、RECHECK、WATCH）更新用户追踪状态，以 watch ban 为例

```python
exchange_text = format_data(
    sender="CLEAN",
    receviers=[
        "ANALYZE",
        "CAPTCHA",
        "LANG",
        "LONG",
        "MANAGE",
        "NOFLOOD",
        "NOPORN",
        "NOSPAM",
        "RECHECK",
        "WATCH"
    ],
    action="add",
    action_type="watch",
    data={
        "id": 12345678,
        "type": "ban",
        "until"="gAAAAABc1SZjduLGl1872VS6dD3osVJaOSQqdlSHy3SpDXeV4yu2FLbEung8neVMonokt5yI8qaLic8bi44X-y073-pGX6LtxKNQilSvci_gk5xHj4HNPFE="    # 将追踪截止的时间戳转为加密字符串
    }
)
```

情形 14：向其他 Bot（ANALYZE、CAPTCHA、LANG、LONG、MANAGE、NOFLOOD、NOPORN、NOSPAM、RECHECK、USER、WATCH）添加黑名单用户

```python
exchange_text = format_data(
    sender="CLEAN",
    receviers=[
        "ANALYZE",
        "CAPTCHA",
        "LANG",
        "LONG",
        "MANAGE",
        "NOFLOOD",
        "NOPORN",
        "NOSPAM",
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
    sender="CLEAN",
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
