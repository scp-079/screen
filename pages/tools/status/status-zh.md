---
title: SCP-079-STATUS
---

<link rel="stylesheet" href="/css/chinese.css">
<button onmouseover="PlaySound('totop1')" onmouseout="StopSound('totop1')" onclick="window.location.href = '/status/';" class="en">Click Here to English Page</button>

---

**项目编号：**SCP-079-STATUS

**项目等级：**Safe

---

**特殊收容措施：**SCP-079-STATUS 仅支持在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-STATUS 。

本机器人所需依赖安装：

- pip: `pip install -r requirements.txt`

此机器人需要加入以下频道：

- **SCP-079-CRITICAL（必选）**

> SCP-079-STATUS 在上述频道中应具有发送消息的权限

---

**描述：**SCP-079-STATUS 是一个提供 Linux 服务器运行状态信息的机器人，其项目位于 GitLab ，镜像同步并开源于 [GitHub](https://github.com/scp-079/scp-079-status)。Demo 机器人本体位于 <a href="https://t.me/SCP_079_STATUS_BOT" class="079" target="_blank">SCP-079-STATUS</a>，仅供展示。通过源码搭建的机器人可拥有类似功能：根据所有者的设置，在指定频道中定时更新所在服务器的运行状态，示例效果见[此频道](https://t.me/SCP_079_CRITICAL/13)。

- 此机器人的性质：常规机器人，需要获取 bot token

---

**附录：**使用说明

请[点击此处以查看本机器人实例的使用手册](/status-manual-zh/)。

---

**附录：**自建机器人的方法

关于搭建机器人的通用说明，请先查看<a href="/how-zh/" target="_blank">自建说明书</a>

同时，我们建议不同的服务器使用单独的机器人更新状态，避免同一机器人在同一频道中频繁编辑多个消息，防止因此受到 Telegram 对编辑消息的频率限制。

---

**文件#config.ini：**

这是一个自定义的文件。文件应位于 `config.ini.example` 同目录下。

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

[proxy]
enabled = False
; 可根据需要自行决定是否使用 SOCKS5 代理
hostname = 127.0.0.1
port = 1080

[auth]
creator_id = [DATA EXPUNGED]
; 此处填写机器人所有者的用户 ID

[basic]
bot_token = [DATA EXPUNGED]
; 此处填写在 @BotFather 处获得的 token
prefix = /!
; 命令前的可用字符，如在群组中使用非常规命令前缀，需要机器人有获取普通消息的权限

[channels]
critical_channel_id = [DATA EXPUNGED]
; 此处填写紧急频道 SCP-079-CRITICAL 的 ID

[custom]
format_date = %Y/%m/%d %H:%M:%S
; 此处自定义显示日期时所使用的格式
format_time = %H:%M:%S
; 此处自定义显示时间时所使用的格式
interval = 3
; 此处填写正整数，表示更新状态的时间间隔，建议不大于 3，否则机器人可能频繁受到编辑消息的频率限制

[language]
lang = cmn-Hans
; 此处填写 languages 文件夹下所包含的 YAML 文件的对应名称
```

以上是对文件 `config.ini` 的说明。

---

**文件#report.txt：**

这是一个自定义的文件。文件应位于 `template.txt` 同目录下。

设定内容的格式时（链接、加粗、斜体、代码块），请内容遵从 HTML 格式，请见：<https://docs.pyrogram.org/topics/text-formatting#html-style>

此文件中可用的代号（以两个 `$` 所包裹）可见文件 `template.txt`。代号将在运行时被替换为对应的系统状态信息。

此文件的内容可自由编写，但请注意不要超过 4096 个字符。

以下是示例，仅供参考：

```
站点：<code>Site-01</code>

备注：<code>示例</code>
更新间隔：<code>$interval$</code>
时区：<code>UTC</code>

最后在线：<code>$last$</code>
操作系统：<code>$dist$</code>
内核：<code>$kernel$</code>
开机时长：<code>$up_time$</code>

平均负载：<code>$load$</code>
CPU 核心数量：<code>$cpu_count_logical$</code>
CPU 总占用：<code>$cpu_percent$</code>
CPU 各核心占用情况:
$cpu_percent_per$

内存总量: <code>$memory_total$</code>
空闲内存：<code>$memory_available$</code>
内存占用比：<code>$memory_percent$</code>
SWAP 总量：<code>$swap_total$</code>
SWAP 空闲：<code>$swap_free$</code>
SWAP 占用比：<code>$swap_percent$</code>

硬盘总读取：<code>$disk_read$</code>
硬盘总写入：<code>$disk_write$</code>
$disk_usage$

网络总发送：<code>$network_sent$</code>
网络总接收：<code>$network_received$</code>
```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
<audio id="dooropen079" src="/audio/door/dooropen079.ogg"/>
