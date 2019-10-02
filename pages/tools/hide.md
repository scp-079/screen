---
title: SCP-079-HIDE
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-HIDE

**项目等级：**Safe

**特殊收容措施：**SCP-079-HIDE 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-HIDE 。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。其应该作为频道 SCP-079-CRITICAL 、频道 SCP-079-EXCHANGE 、频道 SCP-079-HIDE 的管理员，并加入 SCP-079-TEST 群组。

**描述：**SCP-079-HIDE 是一个用于隐藏频道消息真实发布者的机器人，用于保护关键机器人的真实身份，使其不被 spammer 知晓，其项目位于 GitLab ，镜像同步并开源于 <a href="https://github.com/scp-079/scp-079-hide" target="_blank">GitHub</a> 。机器人本体位于 <a href="https://t.me/SCP_079_HIDE_BOT" class="079" target="_blank">SCP-079-HIDE</a> ，并不接受任何直接管理。其加入了 SCP-079-TEST 群组，用于其自身运行状态，并协助显示隐藏者的运行状态。该项目由 ███ 主要负责。通过该项目建立的机器人有类似的功能：根据其他机器人的请求，在 SCP-079-EXCHANGE 频道中转发相应信息。具体操作详见附录中的使用说明。

---

**附录：**使用说明

SCP-079-TEST 中的成员：

- `/version` ：检查机器人版本

---

**附录：**自建机器人的方法

可先查看<a href="/how-zh/">自建说明书</a>

克隆项目：

```bash
git clone https://github.com/scp-079/scp-079-hide.git ~/scp-079/hide
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
critical_channel_id = [DATA EXPUNGED]
; 此处填写紧急频道 SCP-079-CRITICAL 的 ID
debug_channel_id = [DATA EXPUNGED]
; 此处填写调试频道 SCP-079-DEBUG 的 ID
exchange_channel_id = [DATA EXPUNGED]
; 此处填写数据交换频道 SCP-079-EXCHANGE 的 ID
; 关于数据交换频道的详情，请查看 https://scp-079.org/exchange/
hide_channel_id = [DATA EXPUNGED]
; 此处填写数据交换备份频道 SCP-079-HIDE 的 ID
test_group_id = [DATA EXPUNGED]
; 此处填写测试群组 SCP-079-TEST 的 ID

[custom]
backup = [DATA EXPUNGED]
; 此处填写 True 或 False，代表程序是否为备份副本
hiders = [DATA EXPUNGED]
; 此处填写隐藏者项目编号列表，以空格分隔
project_link = [DATA EXPUNGED]
; 此处填写项目网址
project_name = [DATA EXPUNGED]
; 此处填写项目名称
zh_cn = [DATA EXPUNGED]
; 此处填写 True 或 False，代表程序是否启用简体中文模式
```

---

**附录：**开发备忘

1. 在 SCP-079-EXCHANGE 频道中等待来自其他机器人的消息，特定消息转发至 HIDE 频道
2. 在 SCP-079-HIDE 频道中等待来自其他机器人的消息，特定消息转发至 EXCHANGE 频道
3. 在 SCP-079-HIDE 频道中与隐藏者交换版本信息以供 TEST 群组查询使用

HIDE 能够向 BACKUP、CAPTCHA、CLEAN、LANG、LONG、NOFLOOD、NOPORN、NOSPAM、RECHECK、USER、WATCH 发送数据

情形 1：向 BACKUP 汇报在线状态。每个小时的第 30 分钟：

```python
exchange_text = format_data(
    sender="HIDE",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="status",
    data="awake"
)
```

情形 2：在 HIDE 或 EXCHANGE 频道中转发特定消息

```python
# 略
```

情形 3：向隐藏者请求更新版本信息，以 WATCH 为例

```python
exchange_text = format_data(
    sender="HIDE",
    receviers=[
        "WATCH"
    ],
    action="version",
    action_type="ask",
    data={
        "admin_id": 12345678,
        "message_id": 123
    }
)
```

特殊情形：向所有 bot 发送数据交换频道转移指令

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
