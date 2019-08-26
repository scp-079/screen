---
title: SCP-079-EXCHANGE
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-EXCHANGE

**项目等级：**Safe

**特殊收容措施：**SCP-079-EXCHANGE 应该设置成为一个私有频道，开启消息签名（确保机器人的越权操作也有迹可查），并赋予各机器人唯一一项权限：发送消息。

**描述：**SCP-079-EXCHANGE 是一个用于各机器人之间进行数据交换的频道。每个机器人发送数据所表达的意义，可见[各项目单独页面](/tools/)中的 `附录：开发备忘` 一节，其交换文本的格式化方法请见本页文件 `channel.py` 。

---

**文件#channel.py：**

```python
def format_data(sender: str, receivers: List[str], action: str, action_type: str, data: Union[dict, int, list, str]) -> str:
    """Make a unified format string for data exchange.

    Args:
        sender (str):
            The sender's name.

        receivers (list of str):
            The receivers' names.

        action (str):
            The action that the data receivers need to take. It can be any of the followings:
                add - Add id to some list
                appeal - User's appeal
                backup - Send backup data
                config - Update bot config
                help - Let others bot do something
                join - Let bots join some group
                leave - Let bots leave some group
                remove - Remove id in some list
                update - Update some data
                version - update WATCH's version

        action_type (str):
            Type of action. It can be any of the followings:
                When action is add or remove:
                    bad - Spam channel or user
                    except - Exception channel or user
                    watch - Suspicious user.
                            Recommended to ban user or delete user's messages when meets certain conditions

                When action is appeal:
                    request - Send a appeal request
                    reply - Send a appeal reply

                When action is backup:
                    emergency - Let bots enable emergency mode in groups
                    hide - Use HIDE channel to exchange data
                    pickle - Pickle file
                    status - Bot(s) status

                When action is config:
                    ask - Let CONFIG provide config options in CONFIG Channel
                    commit - Update group's configurations
                    reply - CONFIG reply the config link to bot

                When action is help:
                    ban - Let USER ban a user globally
                    delete - Let USER delete a user's all messages in some group
                    report - Let WARN alert admins

                When action is join:
                    approve - Let USER invite bots to a group
                    request - Send a join request to MANAGE
                    status - Send USER permission status to MANAGE
                    update - Let USER update the permission status

                When action is leave:
                    approve - Let bot leave a group
                    info - Send auto left group info to MANAGE
                    request - Send a leave request to MANAGE

                When action is update:
                    count - Update the frequency of use of regex rules
                    declare - Declare a message
                    download - Download the data, then update
                    preview - Update a message's preview
                    score - Update user's score
                
                When action is version:
                    ask - Let WATCH send version data
                    reply - Let HIDE send version text to TEST group

        data (Union[dict, int, list, str]):
            Additional data required for operation.
                Add / Remove:
                    bad:
                        {
                            "id":  -10012345678 / 123 / 12345678,
                            "type": "channel / content / user"
                        }

                    except:
                        {
                            "id":  "file id or hash",
                            "type": "long / tmp"
                        }

                    watch:
                        {
                            "id": 12345678,
                            "type": "all / ban / delete",
                            "until": "encrypted string"
                        }

                Appeal:
                    request:
                        {
                            "user_id": 12345678,
                            "record_id": 123
                        }
                    
                    reply:
                        {
                            "user_id": 12345678,
                            "result": True / False
                        }

                Backup:
                    file type:
                        "filename"
                    
                    status:
                        "awake"
                        
                        {
                            "type": "up / down",
                            "bots": List[str]
                        }
                    
                    start:
                        List[str]
                    
                    stop:
                        List[str]
                    
                    hide:
                        bool

                Config:
                    ask:
                        {
                            "project_name": "Project name",
                            "project_link": "Link to project",
                            "group_id": -10012345678,
                            "group_name": "Group Name",
                            "group_link": "link to group",
                            "user_id": 12345678
                            "config": dict,
                            "default": dict
                        }

                    commit:
                        {
                            "group_id": -10012345678,
                            "config": dict
                        }

                    reply:
                        {
                            "group_id": -10012345678,
                            "user_id": 12345678,
                            "config_link": "link to config"
                        }

                Help:
                    ban / delete:
                        {
                            "group_id": -10012345678,
                            "user_id": 12345678
                        }

                    report:
                        {
                            "group_id": -10012345678,
                            "user_id": 12345678,
                            "message_id": 123
                        }

                Join:
                    approve:
                        {
                            "id": "random",
                            "bots": List[str]
                        }
                    
                    reject:
                        {
                            "id": "random",
                            "reason": "reason here"
                        }

                    request:
                        {
                            "id": "random",
                            "bots": List[str],
                            "group_link": "link to group",
                            "user_id": 12345678
                        }

                    status:
                        {
                            "id": "random",
                            "status": "left / permission / invalid" / -10012345678
                        }

                    update:
                        "random id"

                Leave:
                    approve:
                        {
                            "admin_id": 12345678,
                            "group_id": -10012345678,
                            "reason": "reason here"
                        }

                    info:
                        {
                            "group_id": -10012345678,
                            "group_name": "Group Name",
                            "group_link": "link to group"
                        }

                    request:
                        {
                            "group_id": -10012345678,
                            "group_name": "Group Name",
                            "group_link": "link to group",
                            "reason": "permissions / user"
                        }

                Remove:
                    bad:
                        {
                            "id":  12345678,
                            "type": "user"
                        }
                    
                    except:
                        {
                            "id":  12345678 / "file id",
                            "type": "user / sticker"
                        }

                    watch:
                        {
                            "id": 12345678,
                            "type": "all"
                        }

                Update
                    count:
                        "filename"
                    
                    declare:
                        {
                            "group_id": -10012345678,
                            "message_id": 123
                        }
                    
                    download:
                        "filename"

                    preview: {
                        "group_id": -10012345678,
                        "user_id": 12345678,
                        "message_id": 123
                    }

                    score:
                        {
                            "id": 12345678,
                            "score": 3.2
                        }
                
                Version
                    ask:
                        {
                            "admin_id": 12345678,
                            "message_id": 123
                        }
                    
                    reply:
                        {
                            "admin_id": 12345678,
                            "message_id": 123,
                            "version": "0.0.1"
                        }

    Returns:
        A formatted string.
    """
    data = {
        "from": sender,
        "to": receivers,
        "action": action,
        "type": action_type,
        "data": data
    }

    return code_block(dumps(data, indent=4))
```

# 以下内容即将作废，各部分转移至各项目的单独介绍页面

## 目录

[SCP-079-ANALYZE](#scp-079-analyze)

[SCP-079-APPEAL](#scp-079-appeal)

[SCP-079-APPLY](#scp-079-apply)

[SCP-079-BACKUP](#scp-079-backup)

[SCP-079-CAPTCHA](#scp-079-captcha)

[SCP-079-CLEAN](#scp-079-clean)

[SCP-079-LANG](#scp-079-lang)

[SCP-079-NOFLOOD](#scp-079-noflood)

[SCP-079-NOSPAM](#scp-079-nospam)

[SCP-079-TIP](#scp-079-tip)

[SCP-079-WATCH](#scp-079-watch)

---

## [SCP-079-ANALYZE](#目录)

此机器人用于进行每日所有群组的统计数据图表展示

1. 加入 SCP-079-EXHCANGE 频道，收集各机器人对所有用户状态的更新
2. 加入 SCP-079-WARNING 频道，每日 UTC 时间 00:00 发送 24 小时内各项统计数据的图表
3. 项目等级为：**Safe**

ANALYZE 能够向 BACKUP 发送数据

情形 1：向 BACKUP 传送数据备份文件。每日 UTC 时间 20:00 。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="ANALYZE",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="pickle",
    data="count_data"
)
```

情形 2：向 BACKUP 汇报在线状态。每个小时的第 30 分钟

```python
exchange_text = format_data(
    sender="ANALYZE",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="status",
    data="awake"
)
```

特殊情形：向所有 bot 发送数据交换频道转移指令

```python
exchange_text = format_data(
    sender="ANALYZE",
    receviers=[
        "EMERGENCY"
    ],
    action="backup",
    action_type="hide",
    data=True
)
```

---

## [SCP-079-APPEAL](#目录)

此机器人用于进行申诉功能

1. 此机器人加入 SCP-079-APPEAL 申诉群组，作为管理员
2. 新用户入群，将用户禁言，提示该用户其是否被项目封禁
3. 如用户没有被封禁，提示其 5 分钟后会被从申诉群组中移除
4. 如用户已被封禁，发送简单按钮验证（验证方式也可更为复杂），例如：“我要申诉”，该用户点击后解除禁言，此时用户可以发言说明情况；同时，令 MANAGE 在 SCP-079-MANAGE 群组中询问项目管理员是否解封该用户

APPEAL 能够向 BACKUP、MANAGE、USER 发送数据

情形 1：向 BACKUP 传送数据备份文件。每日 UTC 时间 20:00 。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="APPEAL",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="pickle",
    data="bad_ids"
)
```

情形 2：向 BACKUP 汇报在线状态。每个小时的第 30 分钟

```python
exchange_text = format_data(
    sender="APPEAL",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="status",
    data="awake"
)
```

情形 3：向 MANAGE 发起申诉请求。来自用户 ID 12345678 的解封请求

```python
exchange_text = format_data(
    sender="APPEAL",
    receviers=[
        "MANAGE"
    ],
    action="appeal",
    action_type="request",
    data={
        "user_id": 12345678,
        "record_id": 123
    }
)
```

情形 4：向 USER 发送协助请求，调用 delete all 功能，用于防止 spammer 加群时发送消息过快，而 APPEAL 没能完全清除用户在被禁言前所发送的全部消息

```python
exchange_text = format_data(
    sender="APPEAL",
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

特殊情形：向所有 bot 发送数据交换频道转移指令

```python
exchange_text = format_data(
    sender="APPEAL",
    receviers=[
        "EMERGENCY"
    ],
    action="backup",
    action_type="hide",
    data=True
)
```

---

## [SCP-079-APPLY](#目录)

此机器人用于进行使用申请

1. 此机器人加入 SCP-079-APPLY 群组，作为管理员
2. 新入群用户，将其禁言，如用户为黑名单用户，无提示将其踢出
3. 发出提示，附带按钮，点击则可开始引导程序，并分配唯一申请编号，此时用户禁言解除
4. 引导程序将通过按钮询问需要启用哪些机器人
5. 主要介绍各机器人的默认及可选规则，用户点击已阅读按钮后，展示下一个机器人
6. 引导程序简要介绍隐私及相关政策，用户同意后方可继续
7. 引导程序结束后，取消该用户禁言，提示用户发送有效的入群链接
8. 提示用户等待 MANAGE 的回复，将回复结果更新至原有引导消息中
9. 项目等级为：**Safe**

APPLY 能够向 BACKUP、MANAGE、USER 发送数据

情形 1：向 BACKUP 传送数据备份文件。每日 UTC 时间 20:00 。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="APPLY",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="pickle",
    data="bad_ids"
)
```

情形 2：向 BACKUP 汇报在线状态。每个小时的第 30 分钟

```python
exchange_text = format_data(
    sender="APPLY",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="status",
    data="awake"
)
```

情形 3：向 MANAGE、USER 发起加群使用请求。申请编号为 `ds3FsdX1`，用户申请使用 NOPORN、NOSPAM，群组链接为 https://t.me/SCP_079_CHAT

```python
exchange_text = format_data(
    sender="APPLY",
    receviers=[
        "MANAGE",
        "USER"
    ],
    action="join",
    action_type="request",
    data={
        "id": "ds3FsdX1",
        "bots": [
            "NOPORN",
            "NOSPAM"
        ],
        "group_link": "https://t.me/SCP_079_CHAT",
        "user_id": 12345678
    }
)
```

情形 4：向 USER 发送协助请求，调用 delete all 功能，用于防止 spammer 加群时发送消息过快，而 APPLY 没能完全清除用户在被禁言前所发送的全部消息

```python
exchange_text = format_data(
    sender="APPLY",
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

特殊情形：向所有 bot 发送数据交换频道转移指令

```python
exchange_text = format_data(
    sender="APPLY",
    receviers=[
        "EMERGENCY"
    ],
    action="backup",
    action_type="hide",
    data=True
)
```

---

## [SCP-079-BACKUP](#目录)

此机器人用于每日备份所有机器人的数据，并在宕机时启动备份机器人

1. 此机器人加入 SCP-079-CRITICAL 频道，作为管理员，用于自动发布宕机通告；并加入 SCP-079-MANAGE 群组
2. 每小时的第 30 分钟接收各机器人的在线情况
3. 每小时的第 33 分钟截止情况收集，将机器人在线或出现宕机的情况通报 MANAGE，若同样未收到 MANAGE 的在线状态，直接在 SCP-079-MANAGE 群组中越级发送通知，提供一键启用备份的按钮
4. 每小时的第 36 分钟接收 MANAGE 的情况确认
5. 如出现宕机，并且在每小时第 39 分钟 MANAGE 仍旧没有回复情况确认，直接在 SCP-079-MANAGE 群组中越级发送通知，提供一键启用备份的按钮
6. 项目等级为：**Safe**

BACKUP 能够向 MANAGE 发送数据

情形 1：向 MANAGE 发送在线情况。全部在线，机器人列表并非必须，但为了保证格式一致，仍旧在 “up” 状态下附加机器人列表

```python
exchange_text = format_data(
    sender="BACKUP",
    receviers=[
        "MANAGE"
    ],
    action="backup",
    action_type="status",
    data={
        "type": "up",
        "bots": [
            "ANALYZE",
            "APPEAL",
            "APPLY",
            "CAPTCHA",
            "CLEAN",
            "CONFIG",
            "LANG",
            "NOFLOOD",
            "NOPORN",
            "NOSPAM",
            "PM",
            "RECHECK",
            "REGEX",
            "TIP",
            "USER",
            "WARN",
            "WATCH"
        ]
    }
)
```

情形 2：向 MANAGE 发送在线情况。部分宕机 —— CLEAN、CONFIG、NOFLOOD、USER

```python
exchange_text = format_data(
    sender="BACKUP",
    receviers=[
        "MANAGE"
    ],
    action="backup",
    action_type="status",
    data={
        "type": "down",
        "bots": [
            "CLEAN",
            "CONFIG",
            "NOFLOOD",
            "USER"
        ]
    }
)
```

特殊情形 1：向所有 bot 发送数据交换频道转移指令

```python
exchange_text = format_data(
    sender="EMERGENCY",
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
    sender="BACKUP",
    receviers=[
        "EMERGENCY"
    ],
    action="backup",
    action_type="hide",
    data=False
)
```

---

## [SCP-079-CAPTCHA](#目录)

此机器人用于进行加群验证

1. 群管可以选择订阅当日通过验证的全局列表（此列表并非单纯记录已通过的用户，而是根据用户已有各项总分和验证的通过情况酌情添加），或采用每个用户都强制需要验证的方式（另外对用户综合评分大于 1.5 的，应始终强制验证）
2. 验证方式可以有多种，根据用户已有的不同总分与加群频率，将有不同的难度验证，如棋牌游戏、图形验证码、数学运算
3. 如验证通过，将给出负分（仅当用户综合评分大于等于 1.5 时）-0.5，如验证失败，将给出正分 0.5
4. 项目等级为：**Euclid**

CAPTCHA 能够向 ANALYZE、BACKUP、CLEAN、CONFIG、LANG、MANAGE、NOFLOOD、NOPORN、NOSPAM、RECHECK、USER 发送数据

情形 1：向 BACKUP 传送数据备份文件。每日 UTC 时间 20:00 。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="CAPTCHA",
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
    sender="CAPTCHA",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="status",
    data="awake"
)
```

情形 3：向 CONFIG 询问。由于群管理在群组中发送 `/config captcha` 命令，故 CAPTCHA 令 CONFIG 在 SCP-079-CONFIG 频道中开启一个更新设置的会话

```python
exchange_text = format_data(
    sender="CAPTCHA",
    receviers=[
        "CONFIG"
    ],
    action="config",
    action_type="ask",
    data={
        "project_name": "SCP-079-CAPTCHA",
        "project_link": "https://scp-079.org/captcha/",
        "group_id": -10012345678,
        "group_name": "SCP-079-CHAT",
        "group_link": "https://t.me/SCP_079_CHAT",
        "user_id": 12345678,
        "config": {
            "default": False,
            "lock": 1512345678,
            "auto": True
        },
        "default": {
            "default": True,
            "lock": 0,
            "auto": False
        }
    }
)
```

情形 4：向 MANAGE 请求。由于没有在管理员列表中找到 SCP-079-USER ，或其权限缺失而请求离开某个群组

```python
exchange_text = format_data(
    sender="CAPTCHA",
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
    sender="CAPTCHA",
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
    sender="CAPTCHA",
    receviers=[
        "MANAGE"
    ],
    action="leave",
    action_type="info",
    data=-10012345678
)
```

情形 7：向其他 Bot（ANALYZE、CLEAN、LANG、NOFLOOD、NOPORN、NOSPAM、RECHECK、USER）声明已删除某消息，一定程度上避免对同一条消息重复处理的资源浪费

```python
exchange_text = format_data(
    sender="CAPTCHA",
    receviers=[
        "ANALYZE",
        "CLEAN",
        "LANG",
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

情形 8：向其他 Bot（ANALYZE、CLEAN、LANG、MANAGE、NOFLOOD、NOPORN、NOSPAM、RECHECK）更新用户分数

```python
exchange_text = format_data(
    sender="CAPTCHA",
    receviers=[
        "ANALYZE",
        "CLEAN",
        "LANG",
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
        "score": -0.5
    }
)
```

情形 9：向 USER 发送协助请求，调用 delete all 功能，用于防止 spammer 加群时发送消息过快，而 CAPTCHA 没能完全清除用户在验证开始前所发送的全部消息

```python
exchange_text = format_data(
    sender="CAPTCHA",
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

特殊情形：向所有 bot 发送数据交换频道转移指令

```python
exchange_text = format_data(
    sender="CAPTCHA",
    receviers=[
        "EMERGENCY"
    ],
    action="backup",
    action_type="hide",
    data=True
)
```

---

## [SCP-079-CLEAN](#目录)

此机器人用于过滤某类型消息

1. 根据群组自定义设置自动删除某类别消息，在群组开启 AFF、EXE、SHO、TGL、TGP、QRC 消息过滤时，将具有封禁功能
2. 针对 AFF、EXE、LOC、SHO、TGL、TGP、QRC 类型的消息进行较低分数的记录
3. 项目等级为：**Safe**

CLEAN 能够向 ANALYZE、BACKUP、CAPTCHA、LANG、MANAGE、NOFLOOD、NOPORN、NOSPAM、RECHECK、USER 发送数据

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
            "via": False,
            "ani": False,
            "bmd": False,
            "vid": True,
            "vdn": True,
            "sti": False,
            "ast": False,
            "aud": False,
            "voi": False,
            "gam": True,
            "ser": False,
            "ttd": False,
            "sde": False,
            "loc": False,
            "doc": False,
            "exe": True,
            "tcl": False,
            "aff": True,
            "sho": True,
            "tgl": False,
            "tgp": False,
            "iml": False,
            "qrc": False
        },
        "default": {
            "default": True,
            "lock": 0,
            "con": True, # 联系人
            "via": False, # 通过 Bot 发送的消息
            "ani": False, # GIF 动图
            "bmd": False, # 以 / 为前缀的机器人命令
            "vid": False, # 视频
            "vdn": True, # 圆视频
            "sti": False, # 贴纸
            "ast": False, # 动态贴纸
            "aud": False, # 音频
            "voi": True, # 语音
            "gam": False, # 游戏
            "ser": True, # 服务类消息，对于加群消息将保留最后一条
            "ttd": False, # 定时删除贴纸，动态贴纸，和 GIF 动图（三小时后）
            "sde": False, # 群员可否自助删除自己所发所有消息
            "loc": True, # 定位地址
            "doc": False, # 文件
            "exe": False, # EXE、APK、BAT、CMD、COM 文件
            "tcl": False, # 每日定时清除位于群组和黑名单中的 Deleted Account
            "aff": False, # 传统 AFF 链接、支付宝淘宝红包、大陆 APP 的各类活动推广分享
            "sho": False, # 短链接
            "tgl": False, # TG 链接
            "tgp": False, # TG 代理
            "iml": False, # 即时通讯软件的邀请链接或联系方式
            "qrc": False # 二维码
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

情形 7：向 USER 发送协助请求，调用 delete all 功能，用于实现 /dafm 功能

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

情形 8：向其他 Bot（ANALYZE、CAPTCHA、LANG、NOFLOOD、NOPORN、NOSPAM、RECHECK、USER）声明已删除某消息，一定程度上避免对同一条消息重复处理的资源浪费

```python
exchange_text = format_data(
    sender="CLEAN",
    receviers=[
        "ANALYZE",
        "CAPTCHA",
        "LANG",
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

情形 9：向其他 Bot（ANALYZE、LANG、MANAGE、NOFLOOD、NOPORN、NOSPAM、RECHECK）更新用户分数

```python
exchange_text = format_data(
    sender="CLEAN",
    receviers=[
        "ANALYZE",
        "LANG",
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

---

## [SCP-079-LANG](#目录)

此机器人用于根据群组设置过滤某种语言的消息、用户，删除或封禁

1. 默认不允许清真类语言昵称，默认删除清真类语言、俄语
2. 群组自行重新定义用户昵称不允许的语言，不允许的语言出现将限制该用户
3. 根据某用户触及默认敏感语言的群组数量，进行 lang 评分
4. 群组自行重新定义用户发言不允许的语言，不允许的语言将被自动删除。如用户评分过高时触及默认删除的语言，或受到追踪删除时触发，将进行追踪封禁类收录，并分享给其他机器人
5. 支持检测的语言： af, ar, bg, bn, ca, cs, cy, da, de, el, en, es, et, fa, fi, fr, gu, he, hi, hr, hu, id, it, ja, kn, ko, lt, lv, mk, ml, mr, ne, nl, no, pa, pl, pt, ro, ru, sk, sl, so, sq, sv, sw, ta, te, th, tl, tr, uk, ur, vi, zh-cn, zh-tw 。参见： https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes

LANG 能够向 ANALYZE、BACKUP、CAPTCHA、CLEAN、CONFIG、MANAGE、NOFLOOD、NOPORN、NOSPAM、RECHECK、USER、WATCH 发送数据

情形 1：向 BACKUP 传送数据备份文件。每日 UTC 时间 20:00 。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="LANG",
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
    sender="LANG",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="status",
    data="awake"
)
```

情形 3：向 CONFIG 询问。由于群管理在群组中发送 `/config lang` 命令，故 LANG 令 CONFIG 在 SCP-079-CONFIG 频道中开启一个更新设置的会话

```python
exchange_text = format_data(
    sender="LANG",
    receviers=[
        "CONFIG"
    ],
    action="config",
    action_type="ask",
    data={
        "project_name": "SCP-079-LANG",
        "project_link": "https://scp-079.org/lang/",
        "group_id": -10012345678,
        "group_name": "SCP-079-CHAT",
        "group_link": "https://t.me/SCP_079_CHAT",
        "user_id": 12345678,
        "config": {
            "default": False,
            "lock": 1512345678,
            "name": {
                "enable": True,
                "lang": [
                    "fa",
                    "ur",
                    "ja"
                ],
            "text": {
                "enable": True,
                "lang": [
                    "fa",
                    "ru"
                ]
        },
        "default": {
            "default": True,
            "lock": 0,
            "name": {
                "enable": True,
                "lang": [
                    "fa",
                    "ur",
                    "ar"
                ],
            "text": 
                "enable": True,
                "lang": [
                    "fa",
                    "ur",
                    "ar",
                    "bn",
                    "ru",
                    "bg"
                ]
        }
    }
)
```

情形 4：向 MANAGE 请求。由于没有在管理员列表中找到 SCP-079-USER ，或其权限缺失而请求离开某个群组

```python
exchange_text = format_data(
    sender="LANG",
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
    sender="LANG",
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
    sender="LANG",
    receviers=[
        "MANAGE"
    ],
    action="leave",
    action_type="info",
    data=-10012345678
)
```

情形 7：向其他 Bot（ANALYZE、CAPTCHA、CLEAN、NOFLOOD、NOPORN、NOSPAM、RECHECK、USER）声明已删除某消息，一定程度上避免对同一条消息重复处理的资源浪费

```python
exchange_text = format_data(
    sender="LANG",
    receviers=[
        "ANALYZE",
        "CAPTCHA",
        "CLEAN",
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

情形 8：向其他 Bot（ANALYZE、CLEAN、CAPTCHA、MANAGE、NOFLOOD、NOPORN、NOSPAM、RECHECK）更新用户分数

```python
exchange_text = format_data(
    sender="LANG",
    receviers=[
        "ANALYZE",
        "CLEAN",
        "CAPTCHA",
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
        "score": 0.4
    }
)
```

情形 9：向其他 Bot（ANALYZE、CAPTCHA、MANAGE、NOFLOOD、NOPORN、NOSPAM、RECHECK、WATCH）更新用户追踪状态，以 watch ban 为例

```python
exchange_text = format_data(
    sender="LANG",
    receviers=[
        "ANALYZE",
        "CAPTCHA",
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
        "until"="gAAAAABc1SZjduLGl1872VS6dD3osVJaOSQqdlSHy3SpDXeV4yu2FLbEung8neVMonokt5yI8qaLic8bi44X-y073-pGX6LtxKNQilSvci_gk5xHj4HNPFE=" # 将追踪截止的时间戳转为加密字符串
    }
)
```

情形 10：向其他 Bot（ANALYZE、APPEAL、CAPTCHA、MANAGE、NOFLOOD、NOPORN、NOSPAM、RECHECK、USER、WATCH）添加黑名单用户

```python
exchange_text = format_data(
    sender="LANG",
    receviers=[
        "ANALYZE",
        "APPEAL",
        "CAPTCHA",
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

情形 11：向 USER 发送协助请求，调用 delete all 功能，删除某用户全部消息，范围：所有群组（评分过高或受追踪时的触发）

```python
exchange_text = format_data(
    sender="LANG",
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

情形 12：向 USER 发送协助请求，调用 global ban 功能，用于查找某用户与机器人的所有共同群组，删除其全部消息，并对其进行限制

```python
exchange_text = format_data(
    sender="LANG",
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

特殊情形：向所有 bot 发送数据交换频道转移指令

```python
exchange_text = format_data(
    sender="LANG",
    receviers=[
        "EMERGENCY"
    ],
    action="backup",
    action_type="hide",
    data=True
)
```

---

## [SCP-079-NOFLOOD](#目录)

此机器人用于根据群组设置限制用户发送消息的频率

1. 默认用户在所有群组中总计的发言频率上限为每 10 秒 20 条
2. 群组可自行调整频率上限
3. 超过上限者将被删除其在该群组中的所有消息，直到用户主动沉默一定时间后该限制解除
4. 根据某用户触发频率上限的群组数量，进行 noflood 评分
5. 如用户评分过高时触发频率上限，或受到追踪删除时触发，将进行追踪封禁类收录，并分享给其他机器人
6. 项目等级为：**Euclid**

NOFLOOD 能够向 ANALYZE、BACKUP、CAPTCHA、CLEAN、CONFIG、LANG、MANAGE、NOPORN、NOSPAM、RECHECK、USER、WATCH 发送数据

情形 1：向 BACKUP 传送数据备份文件。每日 UTC 时间 20:00 。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="NOFLOOD",
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
    sender="NOFLOOD",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="status",
    data="awake"
)
```

情形 3：向 CONFIG 询问。由于群管理在群组中发送 `/config noflood` 命令，故 NOFLOOD 令 CONFIG 在 SCP-079-CONFIG 频道中开启一个更新设置的会话

```python
exchange_text = format_data(
    sender="NOFLOOD",
    receviers=[
        "CONFIG"
    ],
    action="config",
    action_type="ask",
    data={
        "project_name": "SCP-079-NOFLOOD",
        "project_link": "https://scp-079.org/noflood/",
        "group_id": -10012345678,
        "group_name": "SCP-079-CHAT",
        "group_link": "https://t.me/SCP_079_CHAT",
        "user_id": 12345678,
        "config": {
            "default": False,
            "lock": 1512345678,
            "limit": 10
        },
        "default": {
            "default": True,
            "lock": 0,
            "limit": 20 # 默认的发送频率为每 10 秒 20 条
        }
    }
)
```

情形 4：向 MANAGE 请求。由于没有在管理员列表中找到 SCP-079-USER ，或其权限缺失而请求离开某个群组

```python
exchange_text = format_data(
    sender="NOFLOOD",
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
    sender="NOFLOOD",
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
    sender="NOFLOOD",
    receviers=[
        "MANAGE"
    ],
    action="leave",
    action_type="info",
    data=-10012345678
)
```

情形 7：向其他 Bot（ANALYZE、CAPTCHA、CLEAN、LANG、NOPORN、NOSPAM、RECHECK、USER）声明已删除某消息，一定程度上避免对同一条消息重复处理的资源浪费

```python
exchange_text = format_data(
    sender="NOFLOOD",
    receviers=[
        "ANALYZE",
        "CAPTCHA",
        "CLEAN",
        "LANG",
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

情形 8：向其他 Bot（ANALYZE、CLEAN、CAPTCHA、LANG、MANAGE、NOPORN、NOSPAM、RECHECK）更新用户分数

```python
exchange_text = format_data(
    sender="NOFLOOD",
    receviers=[
        "ANALYZE",
        "CLEAN",
        "CAPTCHA",
        "LANG",
        "MANAGE",
        "NOPORN",
        "NOSPAM",
        "RECHECK"
    ],
    action="update",
    action_type="score",
    data={
        "id": 12345678,
        "score": 0.6
    }
)
```

情形 9：向其他 Bot（ANALYZE、CAPTCHA、LANG、MANAGE、NOPORN、NOSPAM、RECHECK、WATCH）更新用户追踪状态，以 watch ban 为例

```python
exchange_text = format_data(
    sender="NOFLOOD",
    receviers=[
        "ANALYZE",
        "CAPTCHA",
        "LANG",
        "MANAGE",
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
        "until"="gAAAAABc1SZjduLGl1872VS6dD3osVJaOSQqdlSHy3SpDXeV4yu2FLbEung8neVMonokt5yI8qaLic8bi44X-y073-pGX6LtxKNQilSvci_gk5xHj4HNPFE=" # 将追踪截止的时间戳转为加密字符串
    }
)
```

情形 10：向其他 Bot（ANALYZE、APPEAL、CAPTCHA、LANG、MANAGE、NOPORN、NOSPAM、RECHECK、USER、WATCH）添加黑名单用户

```python
exchange_text = format_data(
    sender="NOFLOOD",
    receviers=[
        "ANALYZE",
        "APPEAL",
        "CAPTCHA",
        "LANG",
        "MANAGE",
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

情形 11：向 USER 发送协助请求，调用 delete all 功能，删除某用户全部消息，范围：所有群组（评分过高或受追踪时的触发）

```python
exchange_text = format_data(
    sender="NOFLOOD",
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

情形 12：向 USER 发送协助请求，调用 global ban 功能，用于查找某用户与机器人的所有共同群组，删除其全部消息，并对其进行限制

```python
exchange_text = format_data(
    sender="NOFLOOD",
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

特殊情形：向所有 bot 发送数据交换频道转移指令

```python
exchange_text = format_data(
    sender="NOFLOOD",
    receviers=[
        "EMERGENCY"
    ],
    action="backup",
    action_type="hide",
    data=True
)
```

---

## [SCP-079-NOSPAM](#目录)

此机器人用于自动删除广告消息，或限制广告用户

1. 本身具有默认规则（内容与行为）
2. 群组可自行开启基于机器学习的实验特性
3. 根据 WATCH 的建议、各机器人的综合评分调整限制用户的处理方式

NOSPAM 能够向 ANALYZE、BACKUP、CAPTCHA、CLEAN、CONFIG、LANG、MANAGE、NOFLOOD、NOPORN、RECHECK、USER、WARN、WATCH 发送数据

情形 1：向 BACKUP 传送数据备份文件。每日 UTC 时间 20:00 。`exchange_text` 文本作为该文件的 `caption`

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

情形 2：向 BACKUP 汇报在线状态。每个小时的第 30 分钟

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

情形 3：向 CONFIG 询问。由于群管理在群组中发送 `/config nospam` 命令，故 NOSPAM 令 CONFIG 在 SCP-079-CONFIG 频道中开启一个更新设置的会话

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
            "auto": True
        },
        "default": {
            "default": True,
            "lock": 0,
            "auto": False
        }
    }
)
```

情形 4：向 MANAGE 请求。由于没有在管理员列表中找到 SCP-079-USER ，或其权限缺失而请求离开某个群组

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

情形 5：向 MANAGE 请求。由于管理权限缺失而请求离开某个群组

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

情形 6：向 MANAGE 通知。该机器人已因不在某群组中（确定的非网络原因的 Exception）而自行清空该群组资料

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

情形 7：向其他 Bot（ANALYZE、CAPTCHA、CLEAN、LANG、NOFLOOD、NOPORN、RECHECK、USER）声明已删除某消息，一定程度上避免对同一条消息重复处理的资源浪费

```python
exchange_text = format_data(
    sender="NOSPAM",
    receviers=[
        "ANALYZE",
        "CAPTCHA",
        "CLEAN",
        "LANG",
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

情形 8：向其他 Bot（ANALYZE、CLEAN、CAPTCHA、LANG、MANAGE、NOFLOOD、NOPORN、RECHECK）更新用户分数

```python
exchange_text = format_data(
    sender="NOSPAM",
    receviers=[
        "ANALYZE",
        "CLEAN",
        "CAPTCHA",
        "LANG",
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

情形 9：向其他 Bot（ANALYZE、CAPTCHA、LANG、MANAGE、NOFLOOD、NOPORN、RECHECK、WATCH）更新用户追踪状态，以 watch ban 为例

```python
exchange_text = format_data(
    sender="NOSPAM",
    receviers=[
        "ANALYZE",
        "CAPTCHA",
        "LANG",
        "MANAGE",
        "NOFLOOD",
        "NOPORN",
        "RECHECK",
        "WATCH"
    ],
    action="add",
    action_type="watch",
    data={
        "id": 12345678,
        "type": "ban",
        "until"="gAAAAABc1SZjduLGl1872VS6dD3osVJaOSQqdlSHy3SpDXeV4yu2FLbEung8neVMonokt5yI8qaLic8bi44X-y073-pGX6LtxKNQilSvci_gk5xHj4HNPFE=" # 将追踪截止的时间戳转为加密字符串
    }
)
```

情形 10：向其他 Bot（ANALYZE、APPEAL、CAPTCHA、LANG、MANAGE、NOFLOOD、NOPORN、RECHECK、USER、WATCH）添加黑名单用户，频道同理

```python
exchange_text = format_data(
    sender="NOSPAM",
    receviers=[
        "ANALYZE",
        "APPEAL",
        "CAPTCHA",
        "LANG",
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

情形 11：向 USER 发送协助请求，调用 delete all 功能，删除某用户全部消息

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

情形 12：向 USER 发送协助请求，调用 global ban 功能，用于查找某用户与机器人的所有共同群组，删除其全部消息，并对其进行限制

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

情形 13：向 WARN 发送自动警告。WARN 会根据群组设置决定是否相应

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

特殊情形：向所有 bot 发送数据交换频道转移指令

```python
exchange_text = format_data(
    sender="EMERGENCY",
    receviers=[
        "EMERGENCY"
    ],
    action="backup",
    action_type="hide",
    data=True
)
```

---

## [SCP-079-TIP](#目录)

此机器人用于发送群组的各种自定义提示

1. 此机器人发送的消息至少应该有 “仅保留最后一条” 的默认机制
2. 根据群组自定义发送加群欢迎消息
3. 根据群组自定义发送长久可编辑的置顶消息
4. 根据群组自定义发送 OT 提醒
5. 根据群组自定义正则关键词发送某消息

TIP 能够向 BACKUP 发送数据

情形 1：向 BACKUP 传送数据备份文件。每日 UTC 时间 20:00 。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="TIP",
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
    sender="TIP",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="status",
    data="awake"
)
```

情形 3：向 CONFIG 询问。由于群管理在群组中发送 `/config tip` 命令，故 TIP 令 CONFIG 在 SCP-079-CONFIG 频道中开启一个更新设置的会话

```python
exchange_text = format_data(
    sender="TIP",
    receviers=[
        "CONFIG"
    ],
    action="config",
    action_type="ask",
    data={
        "project_name": "SCP-079-TIP",
        "project_link": "https://scp-079.org/tip/",
        "group_id": -10012345678,
        "group_name": "SCP-079-CHAT",
        "group_link": "https://t.me/SCP_079_CHAT",
        "user_id": 12345678,
        "config": {
            "default": False,
            "lock": 1512345678,
            "ot": False,
            "welcome": False,
            "rm": False,
            "custom": True
        },
        "default": {
            "default": True,
            "lock": 0,
            "ot": False, # 开启 OT 警告
            "welcome": False, # 启用欢迎信息
            "rm": False, # 开启 RM 警告
            "custom": False # 自定义关键词
        }
    }
)
```

情形 4：向 MANAGE 请求。由于没有在管理员列表中找到 SCP-079-USER ，或其权限缺失而请求离开某个群组

```python
exchange_text = format_data(
    sender="TIP",
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
    sender="TIP",
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

特殊情形：向所有 bot 发送数据交换频道转移指令

```python
exchange_text = format_data(
    sender="EMERGENCY",
    receviers=[
        "EMERGENCY"
    ],
    action="backup",
    action_type="hide",
    data=True
)
```

---

## [SCP-079-WATCH](#目录)

此机器人用于进行敏感追踪

1. 对新入群用户的行为进行一定考量，举一个简单理想化的例子：如某用户有加群行为，并在一个时间段内在多个群组中发送疑似广告内容，则此机器人应给出某种处理建议，其他机器人根据其建议酌情对用户再次发生的可疑行为选择处理方式
2. 根据规则，判断是否应该建议封禁某用户
3. 根据规则，判断是否应该建议删除某用户发送的消息
4. 此机器人涉及的方面广泛，涵盖了部分其他机器人的功能，由于需要对消息预览进行独立的检查，此机器人应该作为 userbot ，并应保持匿名性

WATCH 能够向 ANALYZE、APPLY、BACKUP、CAPTCHA、LANG、MANAGE、NOFLOOD、NOPORN、NOSPAM、RECHECK 发送数据

情形 1：向 BACKUP 传送数据备份文件。每日 UTC 时间 20:00 。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="WATCH",
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
    sender="WATCH",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="status",
    data="awake"
)
```

情形 3：向其他 Bot（ANALYZE、CAPTCHA、LANG、MANAGE、NOPORN、NOSPAM、RECHECK）更新用户追踪状态，以 watch ban 为例

```python
exchange_text = format_data(
    sender="WATCH",
    receviers=[
        "ANALYZE",
        "CAPTCHA",
        "LANG",
        "MANAGE",
        "NOPORN",
        "NOSPAM",
        "RECHECK"
    ],
    action="add",
    action_type="watch",
    data={
        "id": 12345678,
        "type": "ban",
        "until"="gAAAAABc1SZjduLGl1872VS6dD3osVJaOSQqdlSHy3SpDXeV4yu2FLbEung8neVMonokt5yI8qaLic8bi44X-y073-pGX6LtxKNQilSvci_gk5xHj4HNPFE=" # 将追踪截止的时间戳转为加密字符串
    }
)
```

特殊情形：向所有 bot 发送数据交换频道转移指令

```python
exchange_text = format_data(
    sender="EMERGENCY",
    receviers=[
        "EMERGENCY"
    ],
    action="backup",
    action_type="hide",
    data=True
)
```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
