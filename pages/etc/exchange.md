---
title: SCP-079-EXCHANGE
---

<button onmouseover="PlaySound('totop1')" onmouseout="StopSound('totop1')" onclick="window.location.href = '/exchange-zh/';" class="zh">点此转至中文页面</button>

---

**Item #:** SCP-079-EXCHANGE

**Object Class:** Safe

**Special Containment Procedures:** SCP-079-EXCHANGE should be set up as a private channel, turn on message signing (to ensure that the bots' unauthorized operations are also traceable), and give each bot the only permission: Post Messages.

**Description:** SCP-079-EXCHANGE is a channel for data exchanging between bots. The meaning of the data sent by each robot can be seen in the section `Appendix: Development Notes` on the [separate pages of each project](/tools/). For the format of the `exchange_text`, please refer to the document `channel.py`.

---

**Document #channel.py:**

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
                    hide - Use HIDE channel to exchange data
                    now - Let bots send backup files to exchange channel immediately
                    pickle - Pickle file
                    rollback - Rollback the data from the exchange channel's backup file
                    status - Info bot status

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

                When action is join:
                    approve - Let USER invite bots to a group
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
                    
                    info:
                        {
                            "type": "up / down",
                            "bots": List[str]
                        }
                    
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
                    
                    hide:
                        bool

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
                            "group_id": -10012345678
                        }

                Help:
                    ban:
                        {
                            "group_id": -10012345678,
                            "user_id": 12345678,
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

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
