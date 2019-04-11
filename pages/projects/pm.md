---
title: SCP-079-PM
---

<link rel="stylesheet" href="/css/chinese.css">

在机器人项目未支持多语言之前，本说明将使用中文。

---

**项目编号：**SCP-079-PM

**项目等级：**Safe

**特殊收容措施：**SCP-079-PM 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-PM。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。

**描述：**SCP-079-PM 是一个用于转发私聊消息的机器人，其项目位于 <a href="https://gitlab.com/scp-079/scp-079-pm" target="_blank">Gitlab</a> 。该项目由 ███ 主要负责，并仍在完善中。通过该项目建立的机器人有类似的功能：如果客人向运行中的机器人发送任意消息，此消息将会被转发至机器人的主人与机器人的私聊对话中，并提供附加客人的来源信息，当主人回复某条包含客人 ID 的来源汇报消息后，机器人将把主人回复的消息转发给客人，以此实现通过 Bot 的主客私聊功能。除此之外，主人发送的某条消息可以通过相应回执消息所提供的按钮撤回。

**附录：**克隆项目：

```bash
git clone https://gitlab.com/scp-079/scp-079-pm.git scp-079-pm
cd scp-079-pm
```

**附录：**依赖安装（考虑是否需要 virtualenv 等创建环境）：

```bash
pip install -r requirements.txt
```

**附录：**创建配置文件：

```bash
cp config.ini.example config.ini
```

**附录：**修改配置文件：

需要对 `config.ini` 文件中内容为 `[DATA EXPUNGED]` 的全部键值进行修改。 API ID 与 API Hash 在 https://my.telegram.org 处获取。

**附录：**运行：

```bash
python3 main.py
```

**文件#config.ini：**

```ini
[pyrogram]
api_id = [DATA EXPUNGED] 
api_hash = [DATA EXPUNGED]
; 以上两条信息从官网申请获得
app_version = 0.1.0
device_model = VPS
system_version = Linux

[proxy]
enabled = False
; 可根据需要自行决定是否启用 SOCKS5 代理
hostname = 127.0.0.1
port = 1080

[plugins]
root = plugins
include =
    handlers.commands
    handlers.callbacks
    handlers.messages

[custom]
token = [DATA EXPUNGED]
; 此处填写在 Bot Father 处获得的 token
creator_id = [DATA EXPUNGED]
; 此处填写自己帐号的 ID
prefix = /!！
```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
