---
title: SCP-079-AVATAR
---

<button onmouseover="PlaySound('totop1')" onmouseout="StopSound('totop1')" onclick="window.location.href = '/avatar-zh/';" class="zh">点此转至中文页面</button>

---

**Object Class: **Keter

**Special Containment Procedures: **The recommended operating environment for SCP-079-AVATAR is Linux with Python 3.6 or higher version. The required third-party libraries are listed in the `requirements.txt`. Bear in mind that the bot has to run incognito, which means no one else knows the true identity of the bot, except for the developers. Otherwise, the operation of the bot will be hindered inevitably. In addition, the bot should be one of the SCP-079-HIDE Channel Administrators.

**Description: **SCP-079-AVATAR is a user-bot who is able to send the new group user's avatar to NOSPAM for further analysis. The project of the bot has been uploaded to GitLab and the code is synchronized to <a href="https://github.com/scp-079/scp-079-avatar" target="_blank">GitHub</a>. The bot is presented as <a href="https://t.me/SCP_079_AVATAR_BOT" class="079" target="_blank">SCP-079-AVATAR</a> but its true identity is disguised and no direct management is accepted. The project is taken charge of by ███. The bots based this project will have similar functions: sending the new user's avatar to NPSPAM for further analysis to prevent spammer from intentionally blocking NOSPAM. Detailed operations can be found in the instructions in the appendix.

---

**Appendix: **Operation instructions

For the members in SCP-079-TEST:

`/version`: Checking the bot version indirectly

---

**Appendix: **Steps to create a bot on your own

Refer to the <a href="/how/">Manual</a> 

Clone Project:

```bash
git clone https://github.com/scp-079/scp-079-avatar.git ~/bots/scp-079/avatar
```

SCP-079-AVATAR is supposed to join the group with lager amount of members and the group has to include SCP-079-NOSPAM bot. However, please do not join all the groups where SCP-079-NOSPAM is located.

---

**File#config.ini: **

Edit configuration file:

Edit all the key values of `[DATA EXPUNGED]` in the `config.ini` file. API ID and API Hash can be found in the <a href="https://my.telegram.org" target="_blank">Official Website</a>.

```ini
[pyrogram]
api_id = [DATA EXPUNGED]
api_hash = [DATA EXPUNGED]
; The information above is got by the application on the official website

[plugins]
root = plugins
include =
    handlers.message

[proxy]
enabled = False
; Using SOCKS5 proxy is not necessary
hostname = 127.0.0.1
port = 1080

[channels]
hide_channel_id = [DATA EXPUNGED]
; Input the ID of SCP-079-HIDE (data exchange backup channel)

[custom]
reset_day = [DATA EXPUNGED]
; Input the date of resetting data, such as 1st mon，meaning the first Monday of every month
time_new = [DATA EXPUNGED]
; Input the time length, within the time_new period, the user joined the group is identified as the new user
zh_cn = [DATA EXPUNGED]
; Input True or False, meaning whether the Simplified Chinese mode is enabled

[encrypt]
password = [DATA EXPUNGED]
; Input the password used to encrypt files
```

---

**Appendix: **Development Memorandum

1. Before sending the new user's avatar, check the logs and decide whether to repeat sending the avatar from the same user.
2. Add the avatar review function if necessary.

AVATAR is able to sending data to BACKUP, HIDE, NOSPAM, and REGEX.

Situation 1: Send data backup files to BACKUP at UTC 20:00 everyday. `exchange_text` is the `caption` of the file

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

Situation 2: Report online status to BACKUP in 30th minute every hour

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

Situation 3: Reply the version information to HIDE

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

Situation 4: Update the counting file for regulation usage at UTC 21:00 everyday. `exchange_text` is the `caption` of the file

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

Special Case: Send transfer order of data exchange channel to all bots

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
