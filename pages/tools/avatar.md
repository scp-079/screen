---
title: SCP-079-AVATAR
---

<button onmouseover="PlaySound('totop1')" onmouseout="StopSound('totop1')" onclick="window.location.href = '/avatar-zh/';" class="zh">点此转至中文页面</button>

---

**Item #:** SCP-079-AVATAR

**Object Class:** Keter

---

**Special Containment Procedures:** SCP-079-AVATAR is recommended to operate in a Linux environment. The program is available for Python 3.6 and above. It is important to note that the bot has to run incognito, which means that the true identity of the bot should be kept secret from everyone, except for the maintainer, otherwise it will likely affect the operation of other bots.

This bot's requirements:

- Debian 10: `sudo apt update && sudo apt install opencc -y`
- pip: `pip install -r requirements.txt`

This bot needs to join the following channels:

- **SCP-079-HIDE (required) (should have the permission to send messages)**

---

**Description:** SCP-079-AVATAR is a bot used to send new joined users' avatar to NOSPAM for further analysis. The project is located in GitLab, mirrored and open source on [GitHub](https://github.com/scp-079/scp-079-avatar). The bot is presented as <a href="https://t.me/SCP_079_AVATAR_BOT" class="079" target="_blank">SCP-079-AVATAR</a>, but its real identity is hidden and does not accept any direct management. The bots based on this project have similar functions: sending new joined users' avatar to NPSPAM for further analysis, avoiding the spammers intentionally blocking NOSPAM from getting their avatar.

- The nature of this bot: User Bot, requires a user account registered with a mobile number

---

**Appendix:** Operation instructions

This bot does not accept any group application, and the group cannot config this bot. The service host decides which groups this bot joins.

For members in SCP-079-TEST:

- `/version`: Check the bot version indirectly

---

**Appendix:** Steps to create a bot on your own

For general instructions on building a bot, please check the [Self Hosting Instructions](/how/) first.

Clone Project:

```bash
git clone https://github.com/scp-079/scp-079-avatar.git ~/scp-079/avatar
```

SCP-079-AVATAR shall be added to groups with a large number of members. The groups it added to may only be the groups that include SCP-079-NOSPAM bot, but not all the groups where SCP-079-NOSPAM is located.

---

**Document #config.ini:**

Modify the configuration file: You need to modify all the key values ​​in the `config.ini` file with the content `[DATA EXPUNGED]`. API ID and API Hash are available on the [Official Website](https://my.telegram.org).

```ini
[pyrogram]
api_id = [DATA EXPUNGED]
api_hash = [DATA EXPUNGED]
; The information above is obtained from the official website

[plugins]
root = plugins
include =
    handlers.message

[proxy]
enabled = False
; You can decide whether to use a SOCKS5 proxy
hostname = 127.0.0.1
port = 1080

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
debug_channel_id = [DATA EXPUNGED]
; Fill in the ID of the debug channel SCP-079-DEBUG
hide_channel_id = [DATA EXPUNGED]
; Fill in the ID of the data exchange backup channel SCP-079-HIDE

[custom]
aio = False
; Fill in True or False here to indicate whether the program shares the same bot account with other programs
backup = False
; Fill in True or False here to indicate whether the program is a backup copy
date_reset = 1st mon
; Fill in the date of resetting data, for example 1st mon, representing the first Monday of every month
project_link = https://scp-079.org/avatar/
; Fill in the project URL
project_name = SCP-079-AVATAR
; Fill in the project name
time_new = [DATA EXPUNGED]
; Fill in an integer here, which represents the length of time that the user is determined to be a new user. It is used to re-check the avatar. The unit is second
zh_cn = [DATA EXPUNGED]
; Fill in True or False here to indicate whether the program enables Simplified Chinese mode

[emoji]
emoji_ad_single = [DATA EXPUNGED]
; Fill in the integer here, which means how many of the same emoji appear in the message are considered to be ad_ type phrases
emoji_ad_total = [DATA EXPUNGED]
; Fill in an integer here, which represents how many emojis appear in the message are considered ad_ type phrases
emoji_many = [DATA EXPUNGED]
; Fill in an integer here, which represents how many emoji appear in the message, it is considered that the message contains multiple emoji
emoji_protect = [DATA EXPUNGED]
; Fill in the string here, the emoji contained in it will be protected, and will not be counted in various judgments. There is no space in the string. Please represent an emoji in the form \UXXXXXXXX
emoji_wb_single = [DATA EXPUNGED]
; Fill in an integer here, which means how many identical emoji appear in the message are considered wb type phrases
emoji_wb_total = [DATA EXPUNGED]
; Fill in an integer here, which represents how many emojis appear in the message are considered wb phrases

[encrypt]
password = [DATA EXPUNGED]
; A uniform password used by each bot to encrypt files. It is recommended to use a random string of 16 characters in length
```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
<audio id="dooropen079" src="/audio/door/dooropen079.ogg"/>
