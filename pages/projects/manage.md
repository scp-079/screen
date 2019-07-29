---
title: SCP-079-MANAGE
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-MANAGE

**项目等级：**Safe

**特殊收容措施：**SCP-079-MANAGE 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-MANAGE 。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。其应该作为频道 SCP-079-EXCHANGE 、频道 SCP-079-HIDE 、频道 SCP-079-LOGGING（仅赋予编辑消息权限）的管理员，并加入 SCP-079-TEST 群组。

**描述：**SCP-079-MANAGE 是一个管理其他机器人的机器人，其项目位于 <a href="https://gitlab.com/scp-079/scp-079-manage" target="_blank">Gitlab</a>  ，镜像同步并开源于 <a href="https://github.com/scp-079/scp-079-manage" target="_blank">GitHub</a> 机器人本体位于 <a href="https://t.me/SCP_079_MANAGE_BOT" class="079" target="_blank">SCP-079-MANAGE</a> ，并由群组 SCP-079-MANAGE 中的成员对其所有操作进行管理。其加入了 SCP-079-TEST ，用于测试在线状态及版本。该项目由 ███ 主要负责。通过该项目建立的机器人有类似的功能：对用户、消息进行解禁或解明，处理申诉，处理使用申请，处理机器人退群请求，命令机器人退出某群组，添加或删除频道黑、白名单，检查用户名单收录状态。具体操作详见附录中的使用说明。

**附录：**使用说明

SCP-079-MANAGE 中的成员：

- `基本`：转发 LOGGING 频道的汇报消息。如有可能，机器人将询问是否解禁某用户或解明某消息，以带按钮（处理、取消）的消息呈现
- `按钮：处理`：解禁某用户或解明某消息
- `按钮：取消`：取消解禁或解明请求
- `/error process`：对应按钮 “处理”，以此命令回复某条带按钮的相应有效消息，解禁某用户或解明某消息
- `/error cancel`：对应按钮 “取消”，以此命令回复某条带按钮的相应有效消息，取消解禁或解明请求

SCP-079-TEST 中的成员：

- `/version`：检查机器人版本

**附录：**自建机器人的方法

可先查看<a href="/how/">自建说明书</a>

克隆项目：

```bash
git clone https://github.com/scp-079/scp-079-manage.git ~/bots/scp-079/manage
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
debug_channel_id = [DATA EXPUNGED]
; 此处填写调试频道 SCP-079-DEBUG 的 ID
error_channel_id = [DATA EXPUNGED]
; 此处填写数据交换频道 SCP-079-ERROR 的 ID
exchange_channel_id = [DATA EXPUNGED]
; 此处填写数据交换频道 SCP-079-EXCHANGE 的 ID
; 关于数据交换频道的详情，请查看 https://scp-079.org/exchange/
hide_channel_id = [DATA EXPUNGED]
; 此处填写数据交换备份频道 SCP-079-HIDE 的 ID
logging_channel_id = [DATA EXPUNGED]
; 此处填写证据存放频道 SCP-079-LOGGING 的 ID
manage_group_id = [DATA EXPUNGED]
; 此处填写管理群组 SCP-079-MANAGE 的 ID
test_group_id = [DATA EXPUNGED]
; 此处填写测试群组 SCP-079-TEST 的 ID

[custom]
project_link = [DATA EXPUNGED]
; 此处填写项目网址
project_name = [DATA EXPUNGED]
; 此处填写项目名称
reset_day = [DATA EXPUNGED]
; 此处填写每月重置数据的日期，例如 1st mon ，代表每月第一个星期一

[encrypt]
key = [DATA EXPUNGED]
; 加密字符串所用的密码
password = [DATA EXPUNGED]
; 加密文件所用的密码
```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
<audio id="dooropen079" src="/audio/door/dooropen079.ogg"/>
