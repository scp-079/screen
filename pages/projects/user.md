---
title: SCP-079-USER
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-USER

**项目等级：**Euclid

**特殊收容措施：**SCP-079-USER 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-USER 。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。务必要注意，其应该关闭被陌生人拉入群组的设置，如果有任何未授权的恶意使用，将可能给其他机器人的工作带来影响。其应该作为频道 SCP-079-CRITICAL 、频道 SCP-079-EXCHANGE 、频道 SCP-079-HIDE 、频道 SCP-079-LOGGING 的管理员，并加入 SCP-079-TEST 群组。

**描述：**SCP-079-USER 是一个用于协助、邀请其他机器人的机器人，其项目位于 GitLab ，镜像同步并准备（尚未）开源于 <a href="https://github.com/scp-079/scp-079-user" target="_blank">GitHub</a> 。机器人本体位于 <a href="https://t.me/SCP_079_USER_BOT" class="079" target="_blank">SCP-079-USER</a> ，仅供经过授权的群组使用，并由群组 SCP-079-MANAGE 中的成员对其进群、退群操作进行管理。其加入了 SCP-079-TEST ，用于测试基本功能的使用。该项目由 ███ 主要负责。通过该项目建立的机器人有类似的功能：根据群组订阅设置，对某用户进行全局封禁或删除消息，根据 MANAGE 和 APPLY 提供的指令，邀请其他机器人入群。机器人将每月定时清除用户数据（黑名单）。对于再次进入群组中的已封禁黑名单用户，将视为群组单独白名单放行，此时大部分机器人将不对此用户进行任何处理。具体操作详见附录中的使用说明。

---

**附录：**使用说明

群组中的管理员：

- `/config user`：通过 [SCP-079-CONFIG](/config/) 调整机器人设置，机器人将回报前往设置的链接，5 分钟内设置将被锁定，无法再次查看和更改设置

除使用 `/config user` 外，管理员也可以通过 `/config_user` 命令在群组中手动调整设置：

- `/config_user show`：显示当前设置
- `/config_user default`：恢复为默认设置
- `/config_user subscribe off`：关闭黑名单订阅
- `/config_user subscribe on`：打开黑名单订阅（默认设置） 

SCP-079-TEST 中的成员：

- `/mention [id | username]`：通过 ID 或 username 查询用户
- `/version`：检查机器人版本

---

**附录：**自建机器人的方法

可先查看<a href="/how/">自建说明书</a>

克隆项目：

```bash
git clone https://github.com/scp-079/scp-079-user.git ~/bots/scp-079/user
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
key = [DATA EXPUNGED]
; 加密字符串所用的密码
password = [DATA EXPUNGED]
; 加密文件所用的密码
```

---

**附录：**开发备忘

1. 协助删除某用户全部消息
2. 协助在与某用户的所有共同群组中对该用户进行限制
3. 接管删除黑名单用户发言、限制黑名单用户的任务，对管理员手动解封再入群的黑名单用户实行单群组白名单放行
3. 接受 APPLY 与 MANAGE 的通知，在 MANAGE 批准后加入某个群组，自动、或受 MANAGE 的要求更新加入群组成功与否。在 MANAGE 进一步批准同意后，邀请其他机器人并赋予管理权限
4. 向其他机器人提供消息链接预览
5. 配合 CLEAN 实现群员自助删除所发全部消息的功能

USER 能够向  ANALYZE、BACKUP、CLEAN、LANG、LONG、MANAGE、NOFLOOD、NOPORN、NOSPAM、RECHECK、WATCH 发送数据

情形 1：向 BACKUP 传送数据备份文件。每日 UTC 时间 20:00 。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="USER",
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
    sender="USER",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="status",
    data="awake"
)
```

情形 3：向 CONFIG 询问。由于群管理在群组中发送 `/config user` 命令，故 USER 令 CONFIG 在 SCP-079-CONFIG 频道中开启一个更新设置的会话

```python
exchange_text = format_data(
    sender="CAPTCHA",
    receviers=[
        "CONFIG"
    ],
    action="config",
    action_type="ask",
    data={
        "project_name": "SCP-079-USER",
        "project_link": "https://scp-079.org/user/",
        "group_id": -10012345678,
        "group_name": "SCP-079-CHAT",
        "group_link": "https://t.me/SCP_079_CHAT",
        "user_id": 12345678,
        "config": {
            "default": False,
            "lock": 1512345678,
            "subscribe": True,
            "dafm": True
        },
        "default": {
            "default": True,
            "lock": 0,
            "subscribe": True, # 订阅黑名单列表
            "dafm": False # 开启群员自助删除所有消息功能
        }
    }
)
```

情形 4：向 MANAGE 请求。由于管理权限缺失而请求离开某个群组

```python
exchange_text = format_data(
    sender="USER",
    receviers=[
        "MANAGE"
    ],
    action="leave",
    action_type="request",
    data={
        "group_id": -10012345678,
        "group_name": "SCP-079-CHAT",
        "group_link": "https://t.me/SCP_079_CHAT",
        "reason"： "权限缺失"
    }
)
```

情形 5：向 MANAGE 通知。该机器人已因不在某群组中（确定的非网络原因的 Exception）而自行清空该群组资料

```python
exchange_text = format_data(
    sender="USER",
    receviers=[
        "MANAGE"
    ],
    action="leave",
    action_type="info",
    data={
        "group_id": -10012345678,
        "group_name": "SCP-079-CHAT",
        "group_link": "https://t.me/SCP_079_CHAT"
    }
)
```

情形 6：向 MANAGE 更新加入申请群组的状况。针对申请编号 `ds3FsdX1`，USER 已成功加入群组，提供的链接有效

```python
exchange_text = format_data(
    sender="USER",
    receviers=[
        "MANAGE"
    ],
    action="join",
    action_type="status",
    data={
        "id": "ds3FsdX1",
        "status": -10012345678
    }
)
```

情形 7：向 MANAGE 更新加入申请群组的状况。针对申请编号 `ds3FsdX1`，申请人在该群组没有全部拥有四项权限：删除消息、封禁用户、添加用户、添加管理员

```python
exchange_text = format_data(
    sender="USER",
    receviers=[
        "MANAGE"
    ],
    action="join",
    action_type="status",
    data={
        "id": "ds3FsdX1",
        "status": "left"
    }
)
```

情形 8：向 MANAGE 更新加入申请群组的状况。针对申请编号 `ds3FsdX1`，机器人尚未拥有四项权限：删除消息、封禁用户、添加用户、添加管理员

```python
exchange_text = format_data(
    sender="USER",
    receviers=[
        "MANAGE"
    ],
    action="join",
    action_type="status",
    data={
        "id": "ds3FsdX1",
        "status": "permission"
    }
)
```

情形 9：向 MANAGE 更新加入申请群组的状况。针对申请编号 `ds3FsdX1`，申请人提供的入群链接无效

```python
exchange_text = format_data(
    sender="USER",
    receviers=[
        "MANAGE"
    ],
    action="join",
    action_type="status",
    data={
        "id": "ds3FsdX1",
        "status": "invalid"
    }
)
```

情形 10：向其他 Bot（CLEAN、LANG、NOPORN、NOSPAM、RECHECK）发送某条消息的链接预览文件。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="USER",
    receviers=[
        "CLEAN",
        "LANG",
        "NOPORN",
        "NOSPAM",
        "RECHECK"
    ],
    action="update",
    action_type="preview",
    data={
        "group_id": -10012345678,
        "user_id": 12345678,
        "message_id": 123
    }
)
```

情形 11：向其他 Bot（ANALYZE、CAPTCHA、LANG、LONG、MANAGE、NOFLOOD、NOPORN、NOSPAM、RECHECK、WATCH）移除黑名单用户

```python
exchange_text = format_data(
    sender="USER",
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
    action="remove",
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
    sender="USER",
    receviers=[
        "EMERGENCY"
    ],
    action="backup",
    action_type="hide",
    data=True
)
```

---

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
<audio id="dooropen079" src="/audio/door/dooropen079.ogg"/>
