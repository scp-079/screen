---
title: SCP-079-MIRROR
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-MIRROR

**项目等级：**Safe

**特殊收容措施：**SCP-079-MIRROR 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-MIRROR 。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。其应该作为频道 SCP-079-GITHUB 、频道 SCP-079-CRITICAL 、频道 SCP-079-EXCHANGE 、频道 SCP-079-HIDE 的管理员，并加入 SCP-079-TEST 群组。

**描述：**SCP-079-MIRROR 是一个用于更新 GitHub 仓库状态到频道中的机器人（user-bot），利用了 <a href="https://t.me/GithubBot" target="_blank">@GithubBot</a> ，其项目位于 GitLab ，镜像同步并开源于 <a href="https://github.com/scp-079/scp-079-mirror" target="_blank">GitHub</a> 。机器人本体位于 <a href="https://t.me/SCP_079_MIRROR_BOT" class="079" target="_blank">SCP-079-MIRROR</a> ，并不接受任何直接管理。其加入了 SCP-079-TEST 群组，用于其自身运行状态。该项目由 ███ 主要负责。通过该项目建立的机器人有类似的功能：根据 @GithubBot 的私聊消息，重新格式化信息并发布于 <a href="https://t.me/SCP_079_GITHUB" target="_blank">SCP-079-GITHUB</a> 频道中。具体操作详见附录中的使用说明。

---

**附录：**使用说明

SCP-079-TEST 中的成员：

- `/version` ：检查机器人版本

---

**附录：**自建机器人的方法

可先查看<a href="/how/">自建说明书</a>

克隆项目：

```bash
git clone https://github.com/scp-079/scp-079-mirror.git ~/bots/scp-079/mirror
```

运行之后，根据 @GithubBot 的操作提示，将仓库的更新推送设置为私聊提示，SCP-079-MIRROR 会自动将消息转发到指定频道

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
    handlers.command
    handlers.message

[proxy]
enabled = False
; 可根据需要自行决定是否使用 SOCKS5 代理
hostname = 127.0.0.1
port = 1080

[basic]
prefix = /!
; 命令前的可用字符，如在群组中使用非常规命令前缀，需要机器人有获取普通消息的权限

[bots]
github_id = [DATA EXPUNGED]
; 此处填写 @GithubBot 的 ID

[channels]
critical_channel_id = 0
; 此处填写紧急频道 SCP-079-CRITICAL 的 ID
debug_channel_id = 0
; 此处填写调试频道 SCP-079-DEBUG 的 ID
exchange_channel_id = 0
; 此处填写数据交换频道 SCP-079-EXCHANGE 的 ID
; 关于数据交换频道的详情，请查看 https://scp-079.org/exchange/
github_channel_id = [DATA EXPUNGED]
; 此处填写 GitHub 仓库更新频道 SCP-079-GITHUB 的 ID
hide_channel_id = 0
; 此处填写数据交换备份频道 SCP-079-HIDE 的 ID
test_group_id = 0
; 此处填写测试群组 SCP-079-TEST 的 ID

[custom]
project_link = [DATA EXPUNGED]
; 此处填写项目网址
project_name = [DATA EXPUNGED]
; 此处填写项目名称
```

---

**附录：**开发备忘

1. 等待 @GithubBot 的私聊消息，转发到频道中
2. 对更新消息重新格式化，以便阅读

MIRROR 能够向 BACKUP 发送数据

情形 1：向 BACKUP 汇报在线状态。每个小时的第 30 分钟：

```python
exchange_text = format_data(
    sender="MIRROR",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="status",
    data="awake"
)
```

特殊情形：向所有 bot 发送数据交换频道转移指令

```python
exchange_text = format_data(
    sender="MIRROR",
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

