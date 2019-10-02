---
title: SCP-079-CLEAN
---

<button onmouseover="PlaySound('totop1')" onmouseout="StopSound('totop1')" onclick="window.location.href = '/clean-zh/';" class="zh">点此转至中文页面</button>

---

**Item #:** SCP-079-CLEAN

**Object Class:** Euclid

**Special Containment Procedures:** SCP-079-CLEAN is recommended to operate in a Linux environment. The program is available for Python 3.6 and above. The required third-party modules are listed in the `requirements.txt`. It is important to note that it can only be invited to the group through SCP-079-USER and is given administrative privileges by SCP-079-USER. If there is any unauthorized malicious use, it may affect the operation of other bots. It should be the administrator of the channel SCP-079-CRITICAL, channel SCP-079-EXCHANGE, channel SCP-079-HIDE, and join the SCP-079-TEST group.

**Description:** SCP-079-CLEAN is a bot for filtering messages of specific types. The project is located in GitLab, mirrored and open source on <a href="https://github.com/scp-079/scp-079-clean" target="_blank">GitHub</a>. The bot is located in <a href="https://t.me/SCP_079_CLEAN_BOT" class="079" target="_blank">SCP-079-CLEAN</a>. It is intended for use by authorized groups only and is managed by members of the group SCP-079-MANAGE for joining and leaving operations. It joined SCP-079-TEST to test the use of basic functions. The project is taken charge of by ███. The bots based on this project have similar functions: according to the administrator settings, delete certain types of messages, score records for some types of messages, delete stickers periodically, regularly clean up invalid members, and the group members automatically delete all messages sent by themselves. For details, please refer to the instructions in the appendix.

---

**Appendix:** Operation instructions

Administrators in the group:

- `/config clean`: By adjusting the bot settings via SCP-079-CONFIG, the bot will send the link to the settings, and the settings will be locked within 5 minutes and cannot be changed again.
- `/clean`: Delete stickers and GIFs in the group within three hours
- `/dafm yes` or `/dafm y`: The user commands the bot to delete all messages sent by the user himself
- `/purge`: Reply to a message, delete all messages from the beginning of the message to the end of the current message. Note that you can only delete up to 1000 messages based on the message ID using this command. If the value is greater than this value, no response will be made

In addition to using `/config clean`, administrators can also manually adjust settings in groups using the `/config_clean` command:

- `/config_clean show`: Show current settings
- `/config_clean default`: Revert to default settings
- `/config_clean delete off`: Turn off the help delete function
- `/config_clean delete on`: Turn on the help delete function (default setting)
- `/config_clean friend off`: Turn off the friend link bypass function
- `/config_clean friend on`: Turn on the friend link bypass function (default setting)

Ignore or filter some type of message, turn a function off or on:

- `/config_clean [type] off`: Ignore messages of a certain type, or turn off a function
- `/config_clean [type] on`: Delete messages for a certain type, or turn on a function

Where `[type]` should be one of the following categories:

- `con`: Contact (default filter)
- `loc`: Location address (default filter)
- `vdn`: Round video (default filter)
- `voi`: Voice (default filter)
- `ast`: Animated sticker
- `aud`: Audio
- `bmd`: Bot commands prefixed with / without arguments (default filter)
- `doc`: Document
- `gam`: Game
- `gif`: GIF
- `via`: Via bot
- `vid`: Video
- `ser`: Service message, the last one joined group message will be kept (default filter)
- `sti`: Sticker
- `aff`: AFF link
- `exe`: Executable file such as APK, BAT, CMD, COM, EXE, PIF, SCR, VBS file
- `iml`: Invitation link or contact information for instant messaging software
- `sho`: Short links
- `tgl`: TG links, including links with Telegram domain names and `@mention`, filtering only `@mention` of non-current group's `username`, and `@mention` of users that not in current group
- `tgp`: TG proxy
- `qrc`: QR code
- `sde`: Decide whether the group members can self-delete all the messages they sent
- `tcl`: Remove Deleted Accounts in groups and blacklists daily
- `ttd`: Regularly delete stickers and animations (three hours later)

Ordinary members in the group:

- `/dafm yes` or `/dafm y`: Delete all messages sent in the group if the group settings allow it

Members of SCP-079-TEST:

- `Send a message`: If there is a result match, display the result
- `/version`: Check the bot's version

---

**Appendix:** Steps to create a bot on your own

See the <a href="/how/">Self Hosting Instructions</a> 

Clone Project:

```bash
git clone https://github.com/scp-079/scp-079-clean.git ~/scp-079/clean
```

---

**Document #config.ini:**

Modify the configuration file:

You need to modify all the key values ​​in the `config.ini` file with the content `[DATA EXPUNGED]`. API ID and API Hash are available on the <a href="https://my.telegram.org" target="_blank">Official Website</a>.

```ini
[pyrogram]
api_id = [DATA EXPUNGED]
api_hash = [DATA EXPUNGED]
; The information above is obtained from the official website

[plugins]
root = plugins
include =
    handlers.command
    handlers.message

[proxy]
enabled = False
; You can decide whether to use a SOCKS5 proxy
hostname = 127.0.0.1
port = 1080

[basic]
bot_token = [DATA EXPUNGED]
; Fill in the token obtained from @BotFather here
prefix = /!
; Fill in the available characters before the command, if use a non-conventional command prefix in the group, the bot needs permission to get ordinary messages

[bots]
avatar_id = [DATA EXPUNGED]
; Fill in the ID of SCP-079-AVATAR
captcha_id = [DATA EXPUNGED]
; Fill in the ID of SCP-079-CAPTCHA
clean_id = [DATA EXPUNGED]
; Fill in the ID of SCP-079-CLEAN
lang_id = [DATA EXPUNGED]
; Fill in the ID of SCP-079-LANG
long_id = [DATA EXPUNGED]
; Fill in the ID of SCP-079-LONG
noflood_id = [DATA EXPUNGED]
; Fill in the ID of SCP-079-NOFLOOD
noporn_id = [DATA EXPUNGED]
; Fill in the ID of SCP-079-NOPORN
nospam_id = [DATA EXPUNGED]
; Fill in the ID of SCP-079-NOSPAM
recheck_id = [DATA EXPUNGED]
; Fill in the ID of SCP-079-RECHECK
tip_id = [DATA EXPUNGED]
; Fill in the ID of SCP-079-TIP
user_id = [DATA EXPUNGED]
; Fill in the ID of SCP-079-USER
warn_id = [DATA EXPUNGED]
; Fill in the ID of SCP-079-WARN

[channels]
critical_channel_id = [DATA EXPUNGED]
; Fill in the ID of the emergency channel SCP-079-CRITICAL
debug_channel_id = [DATA EXPUNGED]
; Fill in the ID of the debug channel SCP-079-DEBUG
exchange_channel_id = [DATA EXPUNGED]
; Fill in the ID of the data exchange channel SCP-079-EXCHANGE
; For more information on the Data Exchange Channel, please see https://scp-079.org/exchange/
hide_channel_id = [DATA EXPUNGED]
; Fill in the ID of the data exchange backup channel SCP-079-HIDE
logging_channel_id = [DATA EXPUNGED]
; Fill in the ID of the evidence channel SCP-079-LOGGING
test_group_id = [DATA EXPUNGED]
; Fill in the ID of the test group SCP-079-TEST

[custom]
backup = [DATA EXPUNGED]
; Fill in True or False here to indicate whether the program is a backup copy
default_group_link = [DATA EXPUNGED]
; Fill in the default group link in the debug information
date_reset = [DATA EXPUNGED]
; Fill in the date of resetting data, for example 1st mon, representing the first Monday of every month
image_size = [DATA EXPUNGED]
; Fill in the maximum size of the analysis image document. If the size is exceeded, the QR code will not be downloaded by the original file. The unit is B
project_link = https://scp-079.org/clean/
; Fill in the project URL
project_name = SCP-079-CLEAN
; Fill in the project name
time_ban = [DATA EXPUNGED]
; Fill in the recommended time to track the watch ban user, in seconds
time_punish = [DATA EXPUNGED]
; Fill in the time to punish the user, all messages sent by the user will be deleted, and if it sends a message, it will be re-timed during this period
time_sticker = [DATA EXPUNGED]
; Fill in the delay time required to delete the sticker and the animation regularly, in seconds
zh_cn = [DATA EXPUNGED]
; Fill in True or False here to indicate whether the program enables Simplified Chinese mode

[encrypt]
key = [DATA EXPUNGED]
; Fill in the password used to encrypt strings
password = [DATA EXPUNGED]
; Fill in the password used to encrypt files
```

---

**Appendix:** Development Notes

1. Automatically delete some types of messages according to the group customization setting. When the group opens AFF, EXE, SHO, TGL, TGP, QRC message filtering, it will have the ban function.
2. Record scores for AFF, EXE, IML, SHO, TGL, TGP, QRC type messages

CLEAN is allowed to send data to ANALYZE, BACKUP, CAPTCHA, LANG, LONG, MANAGE, NOFLOOD, NOPORN, NOSPAM, RECHECK, USER.

Scenario 1: Send backup files to BACKUP. Daily UTC time 20:00. `exchange_text` is the `caption` of the file

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

Scenario 2: Report the online status to BACKUP. Every time the program starts

```python
exchange_text = format_data(
    sender="CLEAN",
    receviers=[
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

Scenario 3: Report online status to BACKUP. 30th minute of every hour

```python
exchange_text = format_data(
    sender="CLEAN",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="status",
    data={
        "type": "awake",
        "backup": false
    }
)
```

Scenario 4: Ask CONFIG. Since the group administrator sends the `/config clean` command in the group, CLEAN asks CONFIG to open an config session in the SCP-079-CONFIG channel

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
            "delete": True,
            "friend": True,
            "con": True,
            "loc": True,
            "vdn": True,
            "voi": True,
            "ast": False,
            "aud": False,
            "bmd": True,
            "doc": False,
            "gam": True,
            "gif": False,
            "via": False,
            "vid": False,
            "ser": True,
            "sti": False,
            "aff": True,
            "exe": True,
            "iml": True,
            "sho": True,
            "tgl": True,
            "tgp": True,
            "qrc": True,
            "sde": False,
            "tcl": True,
            "ttd": False
        },
        "default": {
            "default": True,
            "lock": 0,
            "delete": True,    # Request USER to assist with deletion when blocking users
            "friend": True,    # Bypass the TG links of SCP-079 joined groups
            "con": True,    # Contact
            "loc": True,    # Location
            "vdn": True,    # Round Video
            "voi": True,    # Voice
            "ast": False,    # Animated Sticker
            "aud": False,    # Audio
            "bmd": True,    # Bot commands prefixed with / without arguments
            "doc": False,    # Document
            "gam": False,    # Game
            "gif": False,    # GIF
            "via": False,    # Via bot
            "vid": False,    # Video
            "ser": True,    # Service message, the last one joined group message will be kept
            "sti": False,    # Sticker
            "aff": False,    # AFF link
            "exe": False,    # Executable file
            "iml": False,    # Invitation link or contact information for instant messaging software
            "sho": False,    # Short link
            "tgl": False,    # TG link
            "tgp": False,    # TG proxy
            "qrc": False,    # QR Code
            "sde": False,    # Decide whether the group members can self-delete all the messages they sent
            "tcl": False,    # Remove Deleted Accounts in groups and blacklists daily
            "ttd": False    # Regularly delete stickers and animations
        }
    }
)
```

Scenario 5: Request to MANAGE. Request to leave a group because SCP-079-USER was not found in the administrator list, or its permissions are missing

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

Scenario 6: Request to MANAGE. Request to leave a group due to lack of administrative permissions

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

Scenario 7: Notify MANAGE. The bot has emptied the group data itself because it is not in a group (determined Exception for non-network reasons)

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

Scenario 8: Update the counting file for regulation usage. Daily UTC time 21:00. `exchange_text` is the `caption` of the file

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

Scenario 9: Send a request for assistance to USER, call the delete all function to implement the /dafm function for a single group

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

Scenario 10: Send a request for assistance to USER, call the delete all function, delete all messages from a user, range: all groups (triggered when the score is too high or user is tracked)

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

Scenario 11: Send a request for assistance to USER, call the global ban function to find all common groups of a user, delete all messages, and ban the user

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
        "user_id": 12345678,
        "delete": True
    }
)
```

Scenario 12: Declare that a message has been deleted to other bots (ANALYZE, CAPTCHA, LANG, LONG, NOFLOOD, NOPORN, NOSPAM, RECHELO, USER), to a certain extent avoid waste of resources for repeated processing of the same message

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

Scenario 13: Update user scores to other bots (ANALYZE, LANG, LONG, MANAGE, NOFLOOD, NOPORN, NOSPAM, RECHECK)

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

Scenario 14: Update user tracking status to other bots (ANALYZE, CAPTCHA, LANG, LONG, MANAGE, NOFLOOD, NOPORN, NOSPAM, RECHECK, WATCH), taking watch ban as an example

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
        "until"="gAAAAABc1SZjduLGl1872VS6dD3osVJaOSQqdlSHy3SpDXeV4yu2FLbEung8neVMonokt5yI8qaLic8bi44X-y073-pGX6LtxKNQilSvci_gk5xHj4HNPFE="    # Convert the tracking timestamp to an encrypted string
    }
)
```

Scenario 15: Adding blacklisted users to other bots (ANALYZE, CAPTCHA, LANG, LONG, MANAGE, NOFLOOD, NOPORN, NOSPAM, RECHECK, USER, WATCH)

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

Special Case: Send data exchange channel transfer order to all bots

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
