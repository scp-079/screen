---
title: SCP-079-MANAGE
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-MANAGE

**项目等级：**Safe

**特殊收容措施：**SCP-079-MANAGE 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-MANAGE 。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。其应该作为频道 SCP-079-CRITICAL 、频道 SCP-079-EXCHANGE 、频道 SCP-079-HIDE 、频道 SCP-079-LOGGING 、频道 SCP-079-M 的管理员，并加入 SCP-079-MANAGE 、SCP-079-TEST 群组。

**描述：**SCP-079-MANAGE 是一个管理其他机器人的机器人，其项目位于 GitLab  ，镜像同步并开源于 <a href="https://github.com/scp-079/scp-079-manage" target="_blank">GitHub</a> 机器人本体位于 <a href="https://t.me/SCP_079_MANAGE_BOT" class="079" target="_blank">SCP-079-MANAGE</a> ，并由群组 SCP-079-MANAGE 中的成员对其所有操作进行管理。其加入了 SCP-079-TEST ，用于测试在线状态及版本。该项目由 ███ 主要负责。通过该项目建立的机器人有类似的功能：对用户、消息进行解禁或解明、收录、重置，处理申诉，处理使用申请，处理机器人退群请求，命令机器人退出某群组，添加或删除频道黑、白名单，添加或删除内容黑名单、检查用户名单收录状态。具体操作详见附录中的使用说明。

---

**附录：**使用说明

SCP-079-MANAGE 中的成员：

(注：下列命令中，`[reason]` 为可选参数)

- `收录消息、解禁用户`：向 MANAGE 群组中转发 LOGGING 频道的汇报消息。如有可能，机器人将询问是否解禁某用户或解明、收录、重置某消息，以带按钮（处理、删除、取消）的消息呈现
- `查询用户或频道在项目中的收录状态`：向 MANAGE 群组中转发 DEBUG 频道的汇报消息。如有可能，机器人将展示相关信息
- `按钮：处理`：解禁某用户或解明某消息
- `按钮：删除`：删除原始证据消息
- `按钮：取消`：取消解禁、解明、增添黑白名单的请求
- `按钮：添加黑名单`：将该频道加入黑名单中
- `按钮：移除黑名单`：将该频道从黑名单中移除
- `按钮：添加白名单`：将该频道加入白名单中
- `按钮：移除白名单`：将该频道从白名单中移除
- `按钮：解禁用户`：解禁该用户
- `按钮：移除追踪`：移除该用户的追踪状态
- `/action proceed [reason]`：对应按钮 “处理”，以此命令回复某条带按钮的相应有效消息，解禁某用户或解明某消息
- `/action delete [reason]`：对应按钮 “删除”，以此命令回复某条带按钮的相应有效消息，删除原始证据消息
- `/action cancel [reason]`：对应按钮 “取消”，以此命令回复某条带按钮的相应有效消息，取消解禁或解明请求
- `/add_bad [id] [reason]`：将某频道 ID 加入黑名单中；以此命令回复某条带对象 ID的相应有效消息，执行相应操作，此时可省略 `[id]`；如需强制执行操作，在命令后添加 `force`
- `/add_except [id] [reason]`：将某频道 ID 加入白名单中；以此命令回复某条带对象 ID的相应有效消息，执行相应操作，此时可省略 `[id]`；如需强制执行操作，在命令后添加 `force`
- `/check [id | username]`：查询用户或频道在项目中的收录状态
- `/hide [off | on]`：通知其他机器人，关闭或启用应急频道
- `/leave approve [reason]`：对应按钮 “批准”，以此命令回复某条带按钮的相应有效消息，批准某机器人退出某群组
- `/leave cancel`：对应按钮 “取消”，以此命令回复某条带按钮的相应有效消息，取消某机器人退出某群组的请求
- `/leave [id] [reason]`：命令所有机器人退出某 ID 的群组
- `/refresh [all | project]`：命令某个机器人刷新群组管理员列表
- `/remove_bad [id] [reason]`：将某频道 ID 从白名单中移除，或解禁某用户；以此命令回复某条带对象 ID的相应有效消息，执行相应操作，此时可省略 `[id]`；如需强制执行操作，在命令后添加 `force`
- `/remove_except [id] [reason]`：将某频道 ID 从白名单中移除；以此命令回复某条带对象 ID 的相应有效消息，执行相应操作，此时可省略 `[id]`；如需强制执行操作，在命令后添加 `force`
- `/remove_watch [id] [reason]`：将某用户 ID 的追踪状态移除；以此命令回复某条带对象 ID 的相应有效消息，执行相应操作，此时可省略 `[id]`；如需强制执行操作，在命令后添加 `force`
- `/remove_contact 联系方式`：移除已收录的联系方式
- `/status [project]`：要求其他机器人汇报当前状态统计信息，其中，`[project]` 可为 nospam 、 regex 、 user 、 watch ，若 `[project]` 为 `all`，则要求全部机器人汇报统计信息


SCP-079-TEST 中的成员：

- `/version`：检查机器人版本

---

**附录：**自建机器人的方法

可先查看<a href="/how-zh/">自建说明书</a>

克隆项目：

```bash
git clone https://github.com/scp-079/scp-079-manage.git ~/bots/scp-079/manage
```

---

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

[bots]
ticket_id = [DATA EXPUNGED]
; 此处填写工单机器人 SCP-079-TICKET 的 ID

[channels]
critical_channel_id = [DATA EXPUNGED]
; 此处填写紧急频道 SCP-079-CRITICAL 的 ID
debug_channel_id = [DATA EXPUNGED]
; 此处填写调试频道 SCP-079-DEBUG 的 ID
error_channel_id = [DATA EXPUNGED]
; 此处填写错误存档频道 SCP-079-ERROR 的 ID
exchange_channel_id = [DATA EXPUNGED]
; 此处填写数据交换频道 SCP-079-EXCHANGE 的 ID
hide_channel_id = [DATA EXPUNGED]
; 此处填写数据交换备份频道 SCP-079-HIDE 的 ID
logging_channel_id = [DATA EXPUNGED]
; 此处填写证据存放频道 SCP-079-LOGGING 的 ID
manage_channel_id = [DATA EXPUNGED]
; 此处填写内部操作存放频道 SCP-079-M 的 ID
manage_group_id = [DATA EXPUNGED]
; 此处填写管理群组 SCP-079-MANAGE 的 ID
test_group_id = [DATA EXPUNGED]
; 此处填写测试群组 SCP-079-TEST 的 ID
watch_channel_id = [DATA EXPUNGED]
; 此处填写追踪证据频道 SCP-079-WATCH 的 ID

[custom]
aio = False
; 此处填写 True 或 False，代表程序是否与其他程序共用同一机器人帐号
backup = False
; 此处填写 True 或 False，代表程序是否为备份副本
date_reset = 1st mon
; 此处填写每月重置数据的日期，例如 1st mon ，代表每月第一个星期一
per_page = 10
; 每页显示的 ID 数量
project_link = https://scp-079.org/manage/
; 此处填写项目网址
project_name = SCP-079-MANAGE
; 此处填写项目名称
query = CAS 黑名单：<a href="https://cas.chat/query?u={}">查询</a>
; 此处填写自定义的与用户 ID 相关的字符串
zh_cn = True
; 此处填写 True 或 False，代表程序是否启用简体中文模式

[encrypt]
key = [DATA EXPUNGED]
; 各机器人加密字符串所用的统一密码，需由程序生成
password = [DATA EXPUNGED]
; 各机器人加密文件所用的统一密码，建议为长度 16 及以上的随机字符串
```

---

**附录：**开发备忘

1. 此机器人加入 SCP-079-MANAGE 群组
2. 接受 APPEAL 机器人的申诉请求，在 MANAGE 群组中提供解封选项
3. 接受 APPLY 机器人的使用申请，在 MANAGE 群组中提供相关信息，并提供处理选项，MANAGE 群组的管理员初步同意后，通知 USER 加入该群组，并等待该群组管理员赋予其必要的五项权限，USER 可主动或被动地将权限情况更新至 MANAGE ，若一切就绪且得到 MANAGE 批准，USER 可以将申请者申请的机器人添加至群中
4. 接受 BACKUP 机器人的状态通知，出现宕机则在 MANAGE 群组中提供启用备份的处理选项
5. 接受各机器人的退群申请，在 MANAGE 群组中提供处理选项
6. 接受各机器人的自主退群通知，在 MANAGE 群组中提示
7. 在 MANAGE 群组中提供手动移除用户黑名单、用户受追踪状态的功能
8. 在 MANAGE 群组中提供手动添加和移除频道黑名单的功能
9. 在 MANAGE 群组中提供手动添加和移除针对内容的黑、白名单的功能
10. 在 MANAGE 群组中提供手动通知各机器人退出某群组的功能
11. 驻守 SCP-079-LOGGING 频道，作为管理员，拥有编辑消息、删除权限。若出现解除错误的操作，则根据该消息的等级：若为封禁，解禁某用户并编辑附加消息添加 “已解封” 标签；若为删除，编辑附加消息添加 “已解明” 标签，表示已发现此错误。若出现添加内容黑名单的操作，则根据管理员的命令将内容指派给某个机器人作为短期内容白名单，编辑附加消息添加 “已收录” 标签。若出现因隐私信息、危害信息而进行的删除存档操作，编辑附加信息添加 “已删除”，并提供原因
12. 加入 SCP-079-ERROR 频道，作为管理员，转发误判消息到该频道中，并附加必要消息及执行者 ID

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
<audio id="dooropen079" src="/audio/door/dooropen079.ogg"/>
