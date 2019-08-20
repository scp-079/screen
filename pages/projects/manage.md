---
title: SCP-079-MANAGE
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-MANAGE

**项目等级：**Safe

**特殊收容措施：**SCP-079-MANAGE 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-MANAGE 。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。其应该作为频道 SCP-079-CRITICAL 、频道 SCP-079-EXCHANGE 、频道 SCP-079-HIDE 、频道 SCP-079-LOGGING 的管理员，并加入 SCP-079-TEST 群组。

**描述：**SCP-079-MANAGE 是一个管理其他机器人的机器人，其项目位于 GitLab  ，镜像同步并开源于 <a href="https://github.com/scp-079/scp-079-manage" target="_blank">GitHub</a> 机器人本体位于 <a href="https://t.me/SCP_079_MANAGE_BOT" class="079" target="_blank">SCP-079-MANAGE</a> ，并由群组 SCP-079-MANAGE 中的成员对其所有操作进行管理。其加入了 SCP-079-TEST ，用于测试在线状态及版本。该项目由 ███ 主要负责。通过该项目建立的机器人有类似的功能：对用户、消息进行解禁或解明、收录、重置，处理申诉，处理使用申请，处理机器人退群请求，命令机器人退出某群组，添加或删除频道黑、白名单，检查用户名单收录状态。具体操作详见附录中的使用说明。

---

**附录：**使用说明

SCP-079-MANAGE 中的成员：

- `基本`：向 MANAGE 群组中转发 LOGGING 频道的汇报消息。如有可能，机器人将询问是否解禁某用户或解明、收录、重置某消息，以带按钮（处理、删除、取消）的消息呈现
- `按钮：处理`：解禁某用户或解明某消息
- `按钮：删除`：删除原始证据消息
- `按钮：取消`：取消解禁或解明请求
- `/action process`：对应按钮 “处理”，以此命令回复某条带按钮的相应有效消息，解禁某用户或解明某消息
- `/action delete`：对应按钮 “删除”，以此命令回复某条带按钮的相应有效消息，删除原始证据消息
- `/action cancel`：对应按钮 “取消”，以此命令回复某条带按钮的相应有效消息，取消解禁或解明请求
- `/action [action] [reason]`：对应某个按钮，以此命令回复某条带按钮的相应有效消息，执行相应操作，并附加某种原因，例如 `/error delete 涉及隐私`

SCP-079-TEST 中的成员：

- `/version`：检查机器人版本

---

**附录：**自建机器人的方法

可先查看<a href="/how/">自建说明书</a>

克隆项目：

```bash
git clone https://github.com/scp-079/scp-079-manage.git ~/bots/scp-079/manage
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
critical_channel_id = [DATA EXPUNGED]
; 此处填写紧急频道 SCP-079-CRITICAL 的 ID
debug_channel_id = [DATA EXPUNGED]
; 此处填写调试频道 SCP-079-DEBUG 的 ID
error_channel_id = [DATA EXPUNGED]
; 此处填写错误存档频道 SCP-079-ERROR 的 ID
exchange_channel_id = [DATA EXPUNGED]
; 此处填写数据交换频道 SCP-079-EXCHANGE 的 ID
; 关于数据交换频道的详情，请查看 https://scp-079.org/exchange/
hide_channel_id = [DATA EXPUNGED]
; 此处填写数据交换备份频道 SCP-079-HIDE 的 ID
logging_channel_id = [DATA EXPUNGED]
; 此处填写证据存放频道 SCP-079-LOGGING 的 ID
manage_group_id = [DATA EXPUNGED]
; 此处填写管理群组 SCP-079-MANAGE 的 ID
test_group_id = [DATA EXPUNGED]
; 此处填写测试群组 SCP-079-TEST 的 ID

[custom]
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

1. 此机器人加入 SCP-079-MANAGE 群组
2. 接受 APPEAL 机器人的申诉请求，在 MANAGE 群组中提供解封选项
3. 接受 APPLY 机器人的使用申请，在 MANAGE 群组中提供相关信息，并提供处理选项，MANAGE 群组的管理员初步同意后，通知 USER 加入该群组，并等待该群组管理员赋予其必要的四项权限，USER 可主动或被动地将权限情况更新至 MANAGE ，若一切就绪且得到 MANAGE 批准，USER 可以将群主申请的机器人拉入群中
4. 接受 BACKUP 机器人的状态通知，出现宕机则在 MANAGE 群组中提供启用备份的处理选项
5. 接受各机器人的退群申请，在 MANAGE 群组中提供处理选项
6. 接受各机器人的自主退群通知，在 MANAGE 群组中提示
7. 在 MANAGE 群组中提供手动移除用户黑名单、用户受追踪状态的功能
8. 在 MANAGE 群组中提供手动添加和移除频道黑名单的功能
9. 在 MANAGE 群组中提供手动添加和移除针对内容的黑、白名单的功能
10. 在 MANAGE 群组中提供手动通知各机器人退出某群组的功能
11. 驻守 SCP-079-LOGGING 频道，作为管理员，拥有编辑消息、删除权限。若出现解除错误的操作，则根据该消息的等级：若为封禁，解禁某用户并编辑附加消息添加 “已解封” 标签；若为删除，编辑附加消息添加 “已解明” 标签，表示已发现此错误。若出现添加内容黑名单的操作，则根据管理员的命令将内容指派给某个机器人作为短期内容白名单，编辑附加消息添加 “已收录” 标签。若出现因隐私信息、危害信息而进行的删除存档操作，编辑附加信息添加 “已删除”，并提供原因
12. 加入 SCP-079-ERROR 频道，作为管理员，转发误判消息到该频道中，并附加必要消息及执行者 ID

MANAGE 能够向 ANALYZE、APPEAL、APPLY、BACKUP、CAPTCHA、CLEAN、LANG、LONG、NOFLOOD、NOPORN、NOSPAM、RECHECK、USER、WATCH 发送数据

情形 1：向 APPEAL 回复申诉请求处理结果。同意用户的解封诉求，并向其他 Bot（ANALYZE、APPEAL、APPLY、CAPTCHA、LANG、LONG、NOFLOOD、NOPORN、NOSPAM、RECHECK、USER、WATCH）发送移除黑名单指令

```python
exchange_text = format_data(
    sender="MANAGE",
    receviers=[
        "APPEAL"
    ],
    action="appeal",
    action_type="reply",
    data={
        "user_id": 12345678,
        "result": True
    }
)
```

情形 2：向 APPLY、USER 发送批准加入的回复。针对申请编号 `ds3FsdX1`，同意使用 NOPORN、NOSPAM

```python
exchange_text = format_data(
    sender="MANAGE",
    receviers=[
        "APPLY",
        "USER"
    ],
    action="join",
    action_type="approve",
    data={
        "id": "ds3FsdX1",
        "bots": [
            "NOPORN",
            "NOSPAM"
        ]
    }
)
```

情形 3：向 APPLY、USER 发送拒绝加入的回复。针对申请编号 `ds3FsdX1`，附加某种原因

```python
exchange_text = format_data(
    sender="MANAGE",
    receviers=[
        "APPLY",
        "USER"
    ],
    action="join",
    action_type="reject",
    data={
        "id": "ds3FsdX1",
        "result": "some reason"
    }
)
```

情形 4：向 BACKUP 传送数据备份文件。每日 UTC 时间 20:00 。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="MANAGE",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="pickle",
    data="bad_ids"
)
```

情形 5：向 BACKUP 汇报在线状态。每个小时的第 30 分钟

```python
exchange_text = format_data(
    sender="MANAGE",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="status",
    data="awake"
)
```

情形 5：向 BACKUP 批准启用备份。例如启用 NOPORN 备份副本

```python
exchange_text = format_data(
    sender="MANAGE",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="start",
    data=[
        "NOPORN"
    ]
)
```

情形 6：向 BACKUP 命令停止备份副本。例如停止 NOPORN 备份副本

```python
exchange_text = format_data(
    sender="MANAGE",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="stop",
    data=[
        "NOPORN"
    ]
)
```

情形 7：向 USER 发送加入群组的状态更新请求。针对申请编号 `ds3FsdX1`，由于项目管理员的要求，通知 USER 更新加入的已申请群组的状况

```python
exchange_text = format_data(
    sender="MANAGE",
    receviers=[
        "USER"
    ],
    action="join",
    action_type="update",
    data="ds3FsdX1"
)
```

情形 8：向其他 Bot（CAPTCHA、CLEAN、LANG、LONG、NOFLOOD、NOPORN、NOSPAM、USER、WARN）批准退出或命令推出某群组。因某种原因

```python
exchange_text = format_data(
    sender="MANAGE",
    receviers=[
        "LANG",
        "NOFLOOD"
    ],
    action="leave",
    action_type="approve",
    data={
        "group_id": -10012345678,
        "reason": "some reason"
    }
)
```

情形 9：向其他 Bot（ANALYZE、CAPTCHA、LANG、LONG、NOFLOOD、NOPORN、NOSPAM、RECHECK、USER、WATCH）移除黑名单用户

```python
exchange_text = format_data(
    sender="MANAGE",
    receviers=[
        "ANALYZE",
        "CAPTCHA",
        "LANG",
        "LONG",
        "NOFLOOD",
        "NOPORN",
        "NOSPAM",
        "RECHECK",
        "USER",
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

情形 10：向其他 Bot（ANALYZE、CAPTCHA、LANG、LONG、NOFLOOD、NOPORN、NOSPAM、RECHECK、USER、WATCH）移除受追踪用户

```python
exchange_text = format_data(
    sender="MANAGE",
    receviers=[
        "ANALYZE",
        "CAPTCHA",
        "LANG",
        "LONG",
        "NOFLOOD",
        "NOPORN",
        "NOSPAM",
        "RECHECK",
        "USER",
        "WATCH"
    ],
    action="remove",
    action_type="watch",
    data={
        "id": 12345678,
        "type": "all"
    }
)
```

情形 11：向其他 Bot（CAPTCHA、LANG、NOFLOOD、NOPORN、NOSPAM、RECHECK、USER、WATCH）添加黑名单频道，从该频道转发的消息将被自动删除，预计使用频率极低，移除同理

```python
exchange_text = format_data(
    sender="MANAGE",
    receviers=[
        "CAPTCHA",
        "LANG",
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
        "id": -10012345678,
        "type": "channel"
    }
)
```

情形 12：向 NOSPAM 添加内容短暂黑名单，移除同理

```python
exchange_text = format_data(
    sender="MANAGE",
    receviers=[
        "NOSPAM"
    ],
    action="add",
    action_type="bad",
    data={
        "id": 123,
        "type": "long"
    }
)

情形 13：向 NOSPAM 添加内容短暂黑名单，移除同理

```python
exchange_text = format_data(
    sender="MANAGE",
    receviers=[
        "NOSPAM"
    ],
    action="add",
    action_type="bad",
    data={
        "id": 123,
        "type": "tmp"
    }
)
```

情形 14：向其他 Bot（CLEAN、LANG、NOPORN、NOSPAM、RECHECK）添加内容长期白名单，移除同理

```python
exchange_text = format_data(
    sender="MANAGE",
    receviers=[
        "NOPORN"
    ],
    action="add",
    action_type="except",
    data={
        "id": 123,
        "type": "long"
    }
)
```

情形 15：向其他 Bot（CLEAN、LANG、NOPORN、NOSPAM、RECHECK）添加内容短暂白名单，移除同理

```python
exchange_text = format_data(
    sender="MANAGE",
    receviers=[
        "NOSPAM"
    ],
    action="add",
    action_type="except",
    data={
        "id": 123,
        "type": "tmp"
    }
)
```

特殊情形 1：向所有 bot 发送数据交换频道转移指令

```python
exchange_text = format_data(
    sender="MANAGE",
    receviers=[
        "EMERGENCY"
    ],
    action="backup",
    action_type="hide",
    data=True
)
```

特殊情形 2：向所有 bot 发送恢复原数据交换频道指令

```python
exchange_text = format_data(
    sender="MANAGE",
    receviers=[
        "EMERGENCY"
    ],
    action="backup",
    action_type="hide",
    data=False
)
```


<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
<audio id="dooropen079" src="/audio/door/dooropen079.ogg"/>
