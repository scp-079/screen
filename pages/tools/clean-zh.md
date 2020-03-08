---
title: SCP-079-CLEAN
---

<button onmouseover="PlaySound('totop1')" onmouseout="StopSound('totop1')" onclick="window.location.href = '/clean/';" class="en">Click Here to English Page</button>

---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-CLEAN

**项目等级：**Euclid

**特殊收容措施：**SCP-079-CLEAN 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-CLEAN 。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。务必要注意，其只能通过 SCP-079-USER 邀请入群，并由其赋予管理权限，如果有任何未授权的恶意使用，将可能给其他机器人的工作带来影响。其应该作为频道 SCP-079-CRITICAL 、频道 SCP-079-EXCHANGE 、频道 SCP-079-HIDE 的管理员，并加入 SCP-079-TEST 群组。

**描述：**SCP-079-CLEAN 是一个用于过滤特定类型消息的机器人，其项目位于 GitLab ，镜像同步并开源于 <a href="https://github.com/scp-079/scp-079-clean" target="_blank">GitHub</a> 。机器人本体位于 <a href="https://t.me/SCP_079_CLEAN_BOT" class="079" target="_blank">SCP-079-CLEAN</a> ，仅供经过授权的群组使用，并由群组 SCP-079-MANAGE 中的成员对其进群、退群操作进行管理。其加入了 SCP-079-TEST ，用于测试基本功能的使用。该项目由 ███ 主要负责。通过该项目建立的机器人有类似的功能：根据管理员设置，删除某类型的消息，并对部分类型消息进行评分记录，定时删除贴纸，定时清理无效成员，群员自助删除自身所发全部消息。具体操作详见附录中的使用说明。

---

**附录：**使用说明

群组中的管理员：

- `/config clean`：通过 [SCP-079-CONFIG](/config/) 调整机器人设置，机器人将回报前往设置的链接，5 分钟内设置将被锁定，无法再次更改
- `/clean`：删除三小时内群组内的贴纸和 GIF 动图
- `/dafm yes` 或 `/dafm y`：命令机器人删除自己发送的所有消息
- `/purge`：回复某条消息，删除自被回复消息开始，到当前消息结束的所有消息。注意，使用该命令只能最多删除基于消息 ID 的最近 1000 条消息，大于此数值将不会做出应答

除使用 `/config clean` 外，管理员也可以通过 `/config_clean` 命令在群组中手动调整设置：

- `/config_clean show`：显示当前设置
- `/config_clean default`：恢复为默认设置
- `/config_clean delete off`：关闭协助删除功能
- `/config_clean delete on`：开启协助删除功能（默认设置）
- `/config_clean friend off`：关闭放行友情群组链接的功能
- `/config_clean friend on`：开启放行友情群组链接的功能（默认设置）

忽略或过滤某种消息、关闭或开启某种功能：

- `/config_clean [type] off`：忽略某类别消息、关闭某个功能
- `/config_clean [type] on`：删除某类别消息、开启某个功能

其中，`[type]` 应为以下类别之一：

- `con`：联系人（默认过滤）
- `loc`：定位地址（默认过滤）
- `vdn`：圆视频（默认过滤）
- `voi`：语音（默认过滤）
- `ast`：动态贴纸
- `aud`：音频
- `bmd`：以 / 为前缀，且不带有参数的机器人命令（默认过滤）
- `doc`：文件
- `gam`：游戏
- `gif`：GIF 动图
- `via`：通过 Bot 发送的消息
- `vid`：视频
- `ser`：服务类消息，对于加群消息将保留最后一条（默认过滤）
- `sti`：贴纸
- `aff`：传统 AFF 链接、支付宝淘宝红包、大陆 APP 的各类活动推广分享
- `exe`：可执行文件，例如 APK、BAT、CMD、COM、EXE、PIF、SCR、VBS 文件
- `iml`：即时通讯软件的邀请链接或联系方式
- `sho`：短链接
- `tgl`：Telegram 链接，包括带 Telegram 域名的链接和 `@mention`，只过滤非当前群组 `username` 的 `@mention` 、非群组成员 `@mention`
- `tgp`：代理链接
- `qrc`：二维码
- `sde`：群员可否自助删除自己所发所有消息
- `tcl`：每日定时清除位于群组和黑名单中的 Deleted Account
- `ttd`：定时删除贴纸和动图（三小时后）

群组中的普通成员：

- `/dafm yes` 或 `/dafm y`：如果群组设置允许，删除自己在该群所发的全部消息

SCP-079-TEST 中的成员：

- `发送消息`：如有匹配，显示判断内容
- `/version`：检查机器人版本

---

**附录：**自建机器人的方法

可先查看<a href="/how-zh/">自建说明书</a>

克隆项目：

```bash
git clone https://github.com/scp-079/scp-079-clean.git ~/scp-079/clean
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

[bots]
avatar_id = [DATA EXPUNGED]
; SCP-079-AVATAR 的 ID
captcha_id = [DATA EXPUNGED]
; SCP-079-CAPTCHA 的 ID
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
critical_channel_id = [DATA EXPUNGED]
; 此处填写紧急频道 SCP-079-CRITICAL 的 ID
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

[custom]
backup = [DATA EXPUNGED]
; 此处填写 True 或 False，代表程序是否为备份副本
default_group_link = [DATA EXPUNGED]
; 此处填写调试信息中默认的群组链接
date_reset = [DATA EXPUNGED]
; 此处填写每月重置数据的日期，例如 1st mon ，代表每月第一个星期一
image_size = [DATA EXPUNGED]
; 此处填写整数，代表分析图片文档的最大大小，超过此大小则不通过下载原文件进行二维码，单位为 B
project_link = https://scp-079.org/clean-zh/
; 此处填写项目网址
project_name = SCP-079-CLEAN
; 此处填写项目名称
time_ban = [DATA EXPUNGED]
; 建议追踪封禁状态维持的时间，单位为秒
time_punish = [DATA EXPUNGED]
; 惩罚用户的时间，期间用户发送的所有消息将被删除，并且，在此期间内若其发送消息将重新计时
time_sticker = [DATA EXPUNGED]
; 定时删除贴纸、动图所需的延迟时间，单位为秒
zh_cn = [DATA EXPUNGED]
; 此处填写 True 或 False，代表程序是否启用简体中文模式

[encrypt]
key = [DATA EXPUNGED]
; 加密字符串所用的密码
password = [DATA EXPUNGED]
; 加密文件所用的密码
```

---


<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
<audio id="dooropen079" src="/audio/door/dooropen079.ogg"/>
