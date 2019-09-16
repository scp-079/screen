---
title: SCP-079-WATCH
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-WATCH

**项目等级：**Keter

**特殊收容措施：**SCP-079-WATCH 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-WATCH 。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。务必要注意，其机器人的真实身份应对所有人保持隐秘（除维护该机器人的人员以外的所有人士，包括核心管理人员），否则将可能给其他机器人的工作带来影响。其应该作为频道 SCP-079-WATCH 、频道 SCP-079-HIDE 的管理员。

**描述：**SCP-079-WATCH 是一个用于观察和追踪可疑广告行为的机器人（user-bot），其项目位于 GitLab ，镜像同步并准备（尚未）开源于 <a href="https://github.com/scp-079/scp-079-watch" target="_blank">GitHub</a> 。机器人的展示身份位于 <a href="https://t.me/SCP_079_WATCH_BOT" class="079" target="_blank">SCP-079-WATCH</a> ，真实身份为隐藏状态，且并不接受任何直接管理。该项目由 ███ 主要负责。通过该项目建立的机器人有类似的功能：将某个时间长度有入群行为的用户视为新用户，对新用户发送的消息进行检查，若其在特定个数的群组内发送了疑似 spam 消息，则根据所发消息的具体状况，像其他机器人建议封禁此用户或删除此用户发送的消息，其他机器人将根据该用户在具体机器人所在群组中的再次发言，酌情对该用户进行处置。由 SCP-079-WATCH 给出的建议具有时效性，建议失效时间同样由其给出。具体操作详见附录中的使用说明。

---

**附录：**使用说明

SCP-079-TEST 中的成员：

- `/version`：间接检查机器人版本

---

**附录：**自建机器人的方法

可先查看<a href="/how/">自建说明书</a>

克隆项目：

```bash
git clone https://github.com/scp-079/scp-079-watch.git ~/bots/scp-079/watch
```

SCP-079-WATCH 应加入多个群组，其加入的群组可以包含部分 SCP-079 机器人所在的群组

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
    handlers.message

[proxy]
enabled = False
; 可根据需要自行决定是否使用 SOCKS5 代理
hostname = 127.0.0.1
port = 1080

[bots]
avatar_id = [DATA EXPUNGED]
; SCP-079-AVATAR 的 ID
captcha_id = [DATA EXPUNGED]
; SCP-079-CAPTCHA 的 ID
clean_id = [DATA EXPUNGED]
; SCP-079-CLEAN 的 ID
clean_id = [DATA EXPUNGED]
; SCP-079-CLEAN 的 ID
lang_id = [DATA EXPUNGED]
; SCP-079-LANG 的 ID
long_id = [DATA EXPUNGED]
; SCP-079-LONG 的 ID
noflood_id = [DATA EXPUNGED]
; SCP-079-NOFLOOD 的 ID
noporn_id = [DATA EXPUNGED]
; SCP-079-NOPORN 的 ID
nospam_id = [DATA EXPUNGED]
; SCP-079-NOSPAM 的 ID
recheck_id = [DATA EXPUNGED]
; SCP-079-RECHECK 的 ID
tip_id = [DATA EXPUNGED]
; SCP-079-TIP 的 ID
user_id = [DATA EXPUNGED]
; SCP-079-USER 的 ID
warn_id = [DATA EXPUNGED]
; SCP-079-WARN 的 ID

[channels]
hide_channel_id = [DATA EXPUNGED]
; 此处填写数据交换备份频道 SCP-079-HIDE 的 ID
watch_channel_id = [DATA EXPUNGED]
; 此处填写追踪证据频道 SCP-079-WATCH 的 ID

[custom]
image_size = [DATA EXPUNGED]
; 分析图片文档的最大大小，超过此大小则不通过下载原文件进行分析，单位为 B
lang_name = [DATA EXPUNGED]
; 此处填写应追踪的名称的特殊语言
lang_text = [DATA EXPUNGED]
; 此处填写应追踪的消息的特殊语言
limit_ban = [DATA EXPUNGED]
; 此处填写执行封禁追踪的触发群组数量
limit_delete = [DATA EXPUNGED]
; 此处填写执行删除追踪的触发群组数量
reset_day = [DATA EXPUNGED]
; 此处填写每月重置数据的日期，例如 1st mon ，代表每月第一个星期一
time_ban = [DATA EXPUNGED]
; 此处填写建议封禁追踪的时间，单位为秒
time_delete = [DATA EXPUNGED]
; 此处填写建议删除追踪的时间，单位为秒
time_new = [DATA EXPUNGED]
; 此处填写判断用户为新用户的入群时长，单位为秒

[encrypt]
key = [DATA EXPUNGED]
; 加密字符串所用的密码
password = [DATA EXPUNGED]
; 加密文件所用的密码
```

---

**附录：**开发备忘


1. 接收 MANAGE 的状态更新请求
2. 接收 HIDE 的版本号问询

WATCH 能够向 ANALYZE、BACKUP、CAPTCHA、LANG、LONG、MANAGE、NOFLOOD、NOPORN、NOSPAM、RECHECK 发送数据

情形 1：向 BACKUP 传送数据备份文件。每日 UTC 时间 20:00 。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="WATCH",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="pickle",
    data="user_ids"
)
```

情形 2：向 BACKUP 汇报在线状态。每个小时的第 30 分钟

```python
exchange_text = format_data(
    sender="WATCH",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="status",
    data="awake"
)
```

情形 3：向 HIDE 回复版本号

```python
exchange_text = format_data(
    sender="WATCH",
    receviers=[
        "HIDE"
    ],
    action="version",
    action_type="reply",
    data={
        "admin_id": 12345678,
        "message_id": 123,
        "version": 0.0.1
    }
)
```

情形 4：向 MANAGE 汇报统计数据文件。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="WATCH",
    receviers=[
        "MANAGE"
    ],
    action="status",
    action_type="reply",
    data={
        "admin_id": 12345678,
        "message_id": 123
    }
)
```

情形 5：向 REGEX 更新规则使用计数文件，每日 UTC 时间 21:00 。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="WATCH",
    receviers=[
        "REGEX"
    ],
    action="regex",
    action_type="count",
    data="wb_words"
)
```

情形 6：向其他 Bot（ANALYZE、CAPTCHA、LANG、LONG、MANAGE、NOFLOOD、NOPORN、NOSPAM、RECHECK）更新用户追踪状态，以 watch ban 为例

```python
exchange_text = format_data(
    sender="WATCH",
    receviers=[
        "ANALYZE",
        "CAPTCHA",
        "LANG",
        "LONG",
        "MANAGE",
        "NOFLOOD",
        "NOPORN",
        "NOSPAM",
        "RECHECK"
    ],
    action="add",
    action_type="watch",
    data={
        "id": 12345678,
        "type": "ban",
        "until"="gAAAAABc1SZjduLGl1872VS6dD3osVJaOSQqdlSHy3SpDXeV4yu2FLbEung8neVMonokt5yI8qaLic8bi44X-y073-pGX6LtxKNQilSvci_gk5xHj4HNPFE="    # 将追踪截止的时间戳转为加密字符串
    }
)
```

特殊情形：向所有 bot 发送数据交换频道转移指令

```python
exchange_text = format_data(
    sender="MANAGE",
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

