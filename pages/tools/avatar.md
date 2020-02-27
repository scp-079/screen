---
title: SCP-079-AVATAR
---

<button onmouseover="PlaySound('totop1')" onmouseout="StopSound('totop1')" onclick="window.location.href = '/avatar-zh/';" class="zh">点此转至中文页面</button>

---

This English document is incomplete, please refer to [the Chinese document](/avatar-zh/).

---

**Item #:** SCP-079-AVATAR

**Object Class:** Keter

**Special Containment Procedures:** SCP-079-AVATAR is recommended to operate in a Linux environment. The program is available for Python 3.6 and above. The required third-party modules are listed in the `requirements.txt`. It is important to note that the bot has to run incognito, which means that the true identity of the bot should be kept secret from everyone, except for the maintainer, otherwise it will likely affect the operation of other bots. The bot should be the administrator of the channel SCP-079-HIDE.

**Description:** SCP-079-AVATAR is a user-bot for sending new joined users' avatar to NOSPAM for further analysis. The project is located in GitLab, mirrored and open source on <a href="https://github.com/scp-079/scp-079-avatar" target="_blank">GitHub</a>. The bot is presented as <a href="https://t.me/SCP_079_AVATAR_BOT" class="079" target="_blank">SCP-079-AVATAR</a>, but its real identity is hidden and does not accept any direct management. The project is taken charge of by ███. The bots based on this project have similar functions: sending new joined users' avatar to NPSPAM for further analysis, avoiding the spammers intentionally blocking NOSPAM from getting their avatar. For more details, please refer to the instructions in the appendix.

---

**Appendix:** Operation instructions

For members in SCP-079-TEST:

`/version`: Check the bot version indirectly

---

**Appendix:** Steps to create a bot on your own

See the <a href="/how/">Self Hosting Instructions</a> 

Clone Project:

```bash
git clone https://github.com/scp-079/scp-079-avatar.git ~/scp-079/avatar
```

SCP-079-AVATAR shall be added to groups with a large number of members. The groups it added to may only be the groups that include SCP-079-NOSPAM bot, but not all the groups where SCP-079-NOSPAM is located.

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
backup = [DATA EXPUNGED]
; Fill in True or False here to indicate whether the program is a backup copy
date_reset = [DATA EXPUNGED]
; Fill in the date of resetting data, for example 1st mon, representing the first Monday of every month
project_link = https://scp-079.org/avatar/
; Fill in the project URL
project_name = SCP-079-AVATAR
; Fill in the project name
time_new = [DATA EXPUNGED]
; Fill in a integer N here, and the user is considered to be a new user within N seconds after the user joined the group
zh_cn = [DATA EXPUNGED]
; Fill in True or False here to indicate whether the program enables Simplified Chinese mode

[encrypt]
password = [DATA EXPUNGED]
; Fill in the password used to encrypt files
```

---

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
<audio id="dooropen079" src="/audio/door/dooropen079.ogg"/>
