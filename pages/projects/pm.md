---
title: SCP-079-PM
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-PM

**项目等级：**Safe

**特殊收容措施：**SCP-079-PM 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-PM 。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。

**描述：**SCP-079-PM 是一个用于转发私聊消息的机器人，其项目位于 GitLab ，镜像同步并开源于 <a href="https://gitlab.com/scp-079/scp-079-pm" target="_blank">GitHub</a> 。该项目由 ███ 主要负责。机器人本体位于 <a href="https://t.me/SCP_079_PM_BOT" class="079" target="_blank">SCP-079-PM</a> ，仅供演示、与项目管理员 @SCP_079 私聊使用。其加入了 SCP-079-TEST ，用于测试运行状态。通过该项目建立的机器人有类似的功能：如果客人向运行中的机器人发送任意消息，此消息将会被转发至机器人主人与该机器人的私聊对话中，并附加客人的来源信息，当主人回复某条包含客人 ID 的来源汇报消息后，机器人将把主人回复的消息转发给客人，以此实现通过 Bot 的主客私聊功能。除此之外，还具有一些聊天所需的必要功能，例如回复某条特定消息、同步消息编辑状态，撤回消息。详见附录中的使用说明。

**附录：**使用说明

机器人所有者：

`注意`：机器人只能删除在私聊对话中 48 小时内发送的消息

- `基本`：回复某条汇报消息，即可回复对应的用户；回复某条来自用户的非汇报消息，则以 reply 该条消息的方式回复给该用户；编辑某条消息的文字部分，将同步给对应用户
- `/start`：首次使用以此命令激活机器人
- `/block`：以此命令回复某条带 ID 的汇报消息，将某人加入黑名单，机器人将忽略黑名单用户的一切消息
- `/clear`：发送此命令，将询问清空哪种储存的数据
- `/direct` ：此命令回复某条带 ID 的汇报消息，与某人展开直接对话，期间发送的非回复类消息将直接发送给该用户，也可以通过回复其他带 ID 的汇报消息给另外的人发送消息
- `/leave` ：如果当前有正在进行的直接对话，发送此条命令即可退出直接对话模式
- `/now` ：查看当前进行的直接对话
- `/recall`：以此命令回复某条带 ID 的汇报消息，机器人将询问要撤回哪种类别的全部消息
- `/unblock`：以此命令回复某条带 ID 的汇报消息，将某人从黑名单中移除。或者在命令后添加 ID，例如 `/unblock 12345678`
- `按钮：撤回`：点击此按钮，撤回某条已发送给某人的消息
- `按钮：消息 ID`：点击此按钮，清空用于实现撤回、回复功能所记录的所有消息 ID
- `按钮：黑名单`：点击此按钮，清空黑名单
- `按钮：由您发送的消息`：点击此按钮，撤回在某对话中，全部由机器人所有者发送的消息
- `按钮：全部对话消息`：点击此按钮，删除在某对话中的全部消息
- `/clear blacklist`：对应按钮 “黑名单”，发送此命令，清空黑名单
- `/clear messages`：对应按钮 “消息 ID”，发送此命令，清空用于实现撤回、回复功能所记录的所有消息 ID
- `/recall all`：对应按钮 “全部对话消息”，以此命令回复某条带 ID 的汇报消息，将清空与某人对话的全部消息
- `/recall host`：对应按钮 “由您发送的消息”，以此命令回复某条带 ID 的汇报消息，将清空与某人对话中，由您发送的全部消息
- `/recall single`：对应按钮 “撤回”，以此命令回复某条带 ID 的汇报消息（状态为：已发送），将撤回相应的某条消息

客人：

- `基本`：直接向机器人发送消息，将转发给机器人所有者；编辑某条消息的文字部分，将同步给机器人所有者
- `/start`：开始与机器人的对话
- 发送过于频繁时，将需要等待 15 分钟才能继续发送消息

SCP-079-TEST 中的成员：

- `/version`：检查机器人版本

**附录：**自建机器人的方法

可先查看<a href="/how/">自建说明书</a>

克隆项目：

```bash
git clone https://github.com/scp-079/scp-079-pm.git ~/bots/scp-079/pm
```

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
exchange_channel_id = 0
; 此处填写数据交换频道 SCP-079-EXCHANGE 的 ID（可选）
; 关于数据交换频道的详情，请查看 https://scp-079.org/exchange/
hide_channel_id = 0
; 此处填写数据交换备份频道 SCP-079-HIDE 的 ID（可选）
test_group_id = 0
; 此处填写测试群组 SCP-079-TEST 的 ID（可选）

[custom]
host_id = [DATA EXPUNGED]
; 此处填写自己帐号的 ID
host_name = [DATA EXPUNGED]
; 此处填写自定义昵称
reset_day = [DATA EXPUNGED]
; 此处填写每月重置数据的日期，例如 1st mon ，代表每月第一个星期一
```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
<audio id="dooropen079" src="/audio/door/dooropen079.ogg"/>
