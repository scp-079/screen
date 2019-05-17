---
title: SCP-079-WARN
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-WARN

**项目等级：**Euclid

**特殊收容措施：**SCP-079-WARN 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-WARN 。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。务必要注意，其只能通过 SCP-079-USER 邀请入群，并由其赋予管理权限，如果有任何未授权的恶意使用，将可能给其他机器人的工作带来影响。其应该作为频道 SCP-079-EXCHANGE 的管理员，并加入 SCP-079-TEST 群组。

**描述：**SCP-079-WARN 是一个用于群组成员管理的机器人，其项目位于 <a href="https://gitlab.com/scp-079/scp-079-warn" target="_blank">Gitlab</a> 。机器人本体位于 <a href="https://t.me/SCP_079_WARN_BOT" class="079" target="_blank">SCP-079-WARN</a> ，仅供经过授权的群组使用，并由群组 SCP-079-MANAGE 中的成员对其进群、退群操作进行管理。其加入了 SCP-079-TEST ，用于测试基本功能的使用。该项目由 ███ 主要负责，基于原有 SCP-079-USER 机器人修改。通过该项目建立的机器人有类似的功能：根据管理员命令警告、封禁某用户，接受普通用户的举报，提供普通用户 mention 管理员的便捷方法，提供自动对可疑行为进行举报的功能（需要群组同时使用 SCP-079-NOSPAM），提供群员向管理手动举报的功能。机器人将每月定时清除用户数据（受警告次数，被群组封禁的情况）。对于用户举报、或自动举报的回报消息，请及时处理，不要删除，除非您手动对举报双方执行 `/forgive` 命令，否则举报人由于其举报状态未被解除，其将无法再次使用举报功能；而被举报用户由于有未被处理的举报，故也不再接受新的举报。具体操作详见附录中的使用说明。

**附录：**使用说明

群组中的管理员：

- `/config warn`：通过 SCP-079-CONFIG 调整机器人设置，机器人将回报前往设置的链接
- `/ban`：以此命令回复某用户发送的消息或有效的回报消息，封禁该用户
- `/warn`：以此命令回复某用户发送的消息或有效的回报消息，警告该用户
- `/forgive`：以此命令回复某用户发送的消息或有效的回报消息，清除该用户警告，或解禁该用户，或重置该用户的举报状态
- `按钮：解禁`：当某用户被封禁后，点击此按钮解禁该用户
- `按钮：撤销`：当某用户被警告后，点击此按钮撤销该用户的警告
- `按钮：警告`：当某用户被举报时，点击此按钮警告被举报的用户
- `按钮：封禁`：当某用户被举报时，点击此按钮封禁被举报的用户
- `按钮：取消`：当某用户被举报时，点击此按钮取消该举报
- `按钮：滥用`：当某用户被手动举报时，点击此按钮警告举报人
- `/undo`：对应按钮 “解禁” 和 “撤销”，以此命令回复某条由 `/ban` 或 `/warn` 触发的有效汇报消息，解禁某用户或撤销某用户警告

除使用 `/config warn` 外，管理员也可以通过 `/warn_config` 命令在群组中手动调整设置：

- `/warn_config show`：显示当前设置
- `/warn_config default`：恢复为默认设置
- `/warn_config limit 5`：设置警告上限，上限应介于 2 和 5 之间，默认为 3
- `/warn_config mention off`：关闭呼叫管理功能（默认设置） 
- `/warn_config mention on`：打开呼叫管理功能
- `/warn_config report off`：关闭所有举报功能（默认设置）
- `/warn_config report auto`：仅启用自动举报功能，仅当 SCP-079-NOSPAM 在该群组中时真正有效
- `/warn_config report manual`：仅启用手动举报功能
- `/warn_config report both`：同时启动自动和手动举报功能

群组中的普通成员：

- `/admin`、`/admins`：发送此命令，呼叫至多 6 名管理员，仅在群组启用呼叫管理功能时有效
- `/report`：以此命令回复某用户发送的消息，向至多 6 名管理员举报该用户，仅在群组启用手动举报功能时有效

SCP-079-TEST 中的成员：

- `/version`：检查机器人版本

**附录：**自建机器人的方法

可先查看<a href="/how/">自建说明书</a>

克隆项目：

```bash
git clone https://gitlab.com/scp-079/scp-079-warn.git ~/bots/scp-079/warn
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

[bots]
clean_id = [DATA EXPUNGED]
; SCP-079-CLEAN 的 ID
captcha_id = [DATA EXPUNGED]
; SCP-079-CAPTCHA 的 ID
lang_id = [DATA EXPUNGED]
; SCP-079-LANG 的 ID
noflood_id = [DATA EXPUNGED]
; SCP-079-NOFLOOD 的 ID
noporn_id = [DATA EXPUNGED]
; SCP-079-NOPORN 的 ID
nospam_id = [DATA EXPUNGED]
; SCP-079-NOSPAM 的 ID
tip_id = [DATA EXPUNGED]
; SCP-079-TIP 的 ID
user_id = [DATA EXPUNGED]
; SCP-079-USER 的 ID
warn_id = [DATA EXPUNGED]
; SCP-079-WARN 的 ID

[channels]
debug_channel_id = [DATA EXPUNGED]
; 此处填写调试频道 SCP-079-DEBUG 的 ID
exchange_channel_id = [DATA EXPUNGED]
; 此处填写数据交换频道 SCP-079-EXCHANGE 的 ID
; 关于数据交换频道的详情，请查看 https://scp-079.org/exchange/
hide_channel_id = [DATA EXPUNGED]
; 此处填写数据交换备份频道 SCP-079-HIDE 的 ID
logging_channel_id = [DATA EXPUNGED]
; 此处填写证据存放频道 SCP-079-LOGGING 的 ID
test_group_id = [DATA EXPUNGED]
; 此处填写测试群组 SCP-079-TEST 的 ID
logging_channel_username = [DATA EXPUNGED]
; 此处填写 SCP-079-LOGGING 频道的链接名（不带 @）

[custom]
default_group_link = [DATA EXPUNGED]
; 此处填写调试信息中默认的群组链接
project_link = [DATA EXPUNGED]
; 此处填写项目网址
project_name = [DATA EXPUNGED]
; 此处填写项目名称
reset_day = [DATA EXPUNGED]
; 此处填写每月重置数据的日期，例如 1st mon ，代表每月第一个星期一
user_name = [DATA EXPUNGED]
; 此处填写 SCP-079-USER 的项目名称

[encrypt]
password = [DATA EXPUNGED]
; 加密文件所用的密码
```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
<audio id="dooropen079" src="/audio/door/dooropen079.ogg"/>
