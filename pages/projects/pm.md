---
title: SCP-079-PM
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-PM

**项目等级：**Safe

**特殊收容措施：**SCP-079-PM 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-PM。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。

**描述：**SCP-079-PM 是一个用于转发私聊消息的机器人，其项目位于 <a href="https://gitlab.com/scp-079/scp-079-pm" target="_blank">Gitlab</a> 。该项目由 ███ 主要负责，并仍在完善中。机器人本体位于 <a href="https://t.me/SCP_079_PM_BOT" class="079" target="_blank">SCP-079-PM</a> ，仅供与项目管理员私聊使用。通过该项目建立的机器人有类似的功能：如果客人向运行中的机器人发送任意消息，此消息将会被转发至机器人主人与该机器人的私聊对话中，并附加客人的来源信息，当主人回复某条包含客人 ID 的来源汇报消息后，机器人将把主人回复的消息转发给客人，以此实现通过 Bot 的主客私聊功能。除此之外，还具有一些聊天所需的必要功能，详见附录中的使用说明。

**附录：**使用说明

机器人所有者：

- `基本` ：回复某条汇报消息，即可回复对应的用户
- `/start`：首次使用以此命令激活机器人
- `/block`：以此命令回复某条带 ID 的汇报消息，将某人加入黑名单，机器人将忽略黑名单用户的一切消息
- `/unblock`：以此命令回复某条带 ID 的汇报消息，将某人从黑名单中移除。或者在命令后添加 ID，例如 `/unblock 12345678`
- `/recall`：以此命令回复某条带 ID 的汇报消息，机器人将询问要撤回哪种类别的全部消息
- `/clear` ：发送此命令，将询问清空哪种储存的数据
- `按钮：撤回`：点击此按钮，撤回某条已发送给某人的消息

客人：

- `基本` ：直接向机器人发送消息，将转发给机器人所有者
- `/start`：开始与机器人的对话
- 发送过于频繁时，将需要等待 15 分钟才能继续发送消息

**附录：**建立机器人的方法

克隆项目：

```bash
mkdir -p scp-079
git clone https://gitlab.com/scp-079/scp-079-pm.git scp-079/pm
cd scp-079/pm
```

依赖安装（考虑是否需要 virtualenv 等创建环境）：

```bash
pip install -r requirements.txt
```

创建配置文件：

```bash
cp config.ini.example config.ini
```

修改配置文件：

需要对 `config.ini` 文件中内容为 `[DATA EXPUNGED]` 的全部键值进行修改。 API ID 与 API Hash 在 https://my.telegram.org 处获取。

运行：

```bash
python3 main.py
```

**文件#config.ini：**

```ini
[pyrogram]
api_id = [DATA EXPUNGED] 
api_hash = [DATA EXPUNGED]
; 以上两条信息从官网申请获得

[proxy]
enabled = False
; 可根据需要自行决定是否启用 SOCKS5 代理
hostname = 127.0.0.1
port = 1080

[plugins]
root = plugins
include =
    handlers.callbacks
    handlers.commands
    handlers.messages

[custom]
token = [DATA EXPUNGED]
; 此处填写在 Bot Father 处获得的 token
creator_id = [DATA EXPUNGED]
; 此处填写自己帐号的 ID
prefix = /!！
```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
