---
title: SCP-079-EXCHANGE
---

<button onmouseover="PlaySound('totop1')" onmouseout="StopSound('totop1')" onclick="window.location.href = '/exchange/';" class="en">Click Here to English Page</button>

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
                add - Add id to a list
                appeal - User's appeal request
                backup - Send backup data
                clear - Clear all data
                config - Update the bot's config session
                help - Let others bots do something
                join - Let bots join some group
                leave - Let bots leave some group
                remove - Remove id in a list
                update - Update some data
                version - Update the hider's version

        action_type (str):
            Type of action. It can be any of the followings:
                When action is add:
                    bad - Add a bad channel, content, or user
                    except - Add an exception for channel or content
                    watch - Add a suspicious user. Recommended to ban the user or delete the user's messages when it meets certain conditions

                When action is appeal:
                    request - Send a appeal request
                    reply - Send a appeal reply

                When action is backup:
                    auto - BACKUP send info about auto starting or stopping bots
                    data - Backup files
                    hide - Use HIDE channel to exchange data
                    info - Info about the up or down bots
                    now - Let bots send backup files to exchange channel immediately
                    rollback - Rollback the data from the exchange channel's backup file
                    status - Info bot status
                    start - Start backup bots
                    stop - Stop backup bots

                When action is clear:
                    bad - Clear bad channels, contents, or users
                    except - Clear exceptions for channels or contents
                    user - Clear users' new joined status, score, or all data
                    watch - Clear suspicious user lists

                When action is config:
                    ask - Let CONFIG provide a config session in CONFIG Channel
                    commit - Update group's settings
                    reply - CONFIG reply the session's link to the bot
                    show - Let other bot show a group's config

                When action is help:
                    ban - Let USER ban a user globally
                    delete - Let USER delete a user's all messages in the group
                    list - Update auto report groups list to NOSPAM
                    report - Let WARN send an auto report message
                    send - Let HIDE send a message to a chat

                When action is join:
                    approve - Let USER invite bots to a group
                    reject - Reject the request
                    request - Send a join request to MANAGE
                    status - Update USER permission status to MANAGE
                    update - Let USER update the permission status

                When action is leave:
                    approve - Let bots leave a group
                    info - Send auto left group info to MANAGE
                    request - Send a leave request to MANAGE

                When action is regex:
                    count - Update the usage of regex rules
                    update - Let bots update regex rules

                When action is add or remove:
                    bad - Remove the bad channel, content, or user
                    except - Remove the exception for channel or user
                    score - Clear the user's score
                    watch - Remove the user's watch status

                When action is status:
                    ask - MANAGE ask other bots report status
                    reply - Reply the status to MANAGE

                When action is update:
                    avatar - Send the new joined user's avatar
                    declare - Declare a deleted message
                    preview - Update a message's preview
                    refresh- Refresh the admin lists in groups
                    score - Update user's score
                
                When action is version:
                    ask - Let hiders send the version information
                    reply - Let HIDE send the version message to TEST group

        data (Union[dict, int, list, str]):
            Additional data required for operation.
                Add:
                    bad:
                        {
                            "id":  -10012345678 / 123,
                            "type": "channel / content"
                        }

                    except:
                        {
                            "id":  -10012345678 / 123,
                            "type": "channel / long / temp"
                        }

                    watch:
                        {
                            "id": 12345678,
                            "type": "ban / delete",
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
                            "result": False / True,
                            "reason": "reason here"
                        }

                Backup:
                    auto:
                        {
                            "type": "start / stop".
                            "bots": List[str]
                        }
                
                    data:
                        "filename"
                    
                    hide:
                        bool
                    
                    info:
                        {
                            "type": "up / down",
                            "bots": List[str]
                        }
                    
                    now:
                        None
                    
                    rollback:
                        {
                            "admin_id": 12345678,
                            "type": "admin_ids"
                        }
                    
                    status:
                        {
                            "type": "awake / online",
                            "backup": Flase / True
                        }
                    
                    start:
                        {
                            "admin_id": 12345678,
                            "bots": List[str]
                        }
                    
                    stop:
                        {
                            "admin_id": 12345678,
                            "bots": List[str]
                        }

                Clear:
                    bad:
                        {
                            "admin_id": 12345678,
                            "type": "channels / contacts / contents / users"
                        }
                    
                    except:
                        {
                            "admin_id": 12345678,
                            "type": "channels / long / temp"
                        }
                    
                    user:
                        {
                            "admin_id": 12345678,
                            "type": "all / new"
                        }
                    
                    watch:
                        {
                            "admin_id": 12345678,
                            "type": "all / ban / delete"
                        }

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
                    
                    show:
                        {
                            "admin_id": 12345678,
                            "message_id": 123,
                            "group_id": -10012345678
                        }

                Help:
                    ban:
                        {
                            "group_id": -10012345678,
                            "user_id": 12345678,
                            "type": "ban / restrict",
                            "delete": False / True,
                        }
                    
                    delete:
                        {
                            "group_id": -10012345678,
                            "user_id": 12345678,
                            "type": "single / global"
                        }
                    
                    list:
                        "report"

                    report:                    
                        {
                            "group_id": -10012345678,
                            "user_id": 12345678,
                            "message_id": 123
                        }

                    send:
                        -10012345678

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

                Regex:
                    count:
                        "ask" / "filename"
                    
                    update:
                        "filename"

                Remove:
                    bad:
                        {
                            "id":  -10012345678 / 123 / 12345678,
                            "type": "channel / content / user"
                        }

                    except:
                        {
                            "id":  -10012345678 / 123,
                            "type": "channel / long / temp"
                        }

                    score:
                        12345678

                    watch:
                        {
                            "id": 12345678,
                            "type": "all"
                        }
                        
                        {
                            "id": 12345678,
                            "type": "all / ban / delete",
                            "until": "encrypted string"
                        }

                Status
                    ask:
                        {
                            "admin_id": 12345678,
                            "message_id": 123
                        }
                    
                    reply:
                        {
                            "admin_id": 12345678,
                            "message_id": 123
                        }

                Update
                    avatar:
                        {
                            "group_id": -10012345678,
                            "user_id": 12345678,
                            "message_id: 123
                        }

                    declare:
                        {
                            "group_id": -10012345678,
                            "message_id": 123
                        }

                    preview: {
                        "group_id": -10012345678,
                        "user_id": 12345678,
                        "message_id": 123
                    }

                    refresh:
                        12345678

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

[SCP-079-TIP](#scp-079-tip)

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

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
