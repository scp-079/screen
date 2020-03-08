---
title: SCP-079-NOSPAM
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-NOSPAM

**项目等级：**Euclid

**特殊收容措施：**SCP-079-NOSPAM 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-NOSPAM 。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。务必要注意，其只能通过 SCP-079-USER 邀请入群，并由其赋予管理权限，如果有任何未授权的恶意使用，将可能给其他机器人的工作带来影响。其应该作为频道 SCP-079-CRITICAL 、频道 SCP-079-EXCHANGE 、频道 SCP-079-HIDE 的管理员，并加入 SCP-079-TEST 群组。

**描述：**SCP-079-NOSPAM 是一个用于防止广告的机器人，其项目位于 GitLab ，镜像同步并准备（尚未）开源于 <a href="https://github.com/scp-079/scp-079-nospam" target="_blank">GitHub</a> 。机器人本体位于 <a href="https://t.me/SCP_079_NOSPAM_BOT" class="079" target="_blank">SCP-079-NOSPAM</a> ，仅供经过授权的群组使用，并由群组 SCP-079-MANAGE 中的成员对其进群、退群操作进行管理。其加入了 SCP-079-TEST ，用于测试基本功能的使用。该项目由 ███ 主要负责。通过该项目建立的机器人有类似的功能：根据全局规则阻止广告；根据群组设置阻止群组中加入机器人；根据由 WARN 转发到 LOGGING 频道的，并由 MANAGE 指定收录的消息内容，执行自动删除并评分的操作；根据用户发送的侮辱性、带有人身攻击的消息进行微量评分，并根据 WARN 的群内设置对这类消息执行自动举报给 WARN 的操作。

---

**附录：**使用说明

群组中的管理员：

- `/config nospam`：通过 [SCP-079-CONFIG](/config/) 调整机器人设置，机器人将回报前往设置的链接，5 分钟内设置将被锁定，无法再次更改

除使用 `/config nospam` 外，管理员也可以通过 `/config_nospam` 命令在群组中手动调整设置：

- `/config_nospam show`：显示当前设置
- `/config_nospam default`：恢复为默认设置
- `/config_nospam auto off`：关闭机器学习过滤功能（默认设置） 
- `/config_nospam auto on`：开启机器学习过滤功能（暂时无效）
- `/config_nospam bot off`：允许 Bot 进群
- `/config_nospam bot on`：阻止 Bot 进群（默认设置） 
- `/config_nospam report off`：自动封禁用户（默认设置） 
- `/config_nospam report on`：不封禁用户，仅向管理员自动举报

SCP-079-TEST 中的成员：

- `/content`：显示内容标识
- `/version`：检查机器人版本

---

**附录：**自建机器人的方法

可先查看<a href="/how-zh/">自建说明书</a>

克隆项目：

```bash
git clone https://github.com/scp-079/scp-079-nospam.git ~/bots/scp-079/nospam
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
watch_channel_id = [DATA EXPUNGED]
; 此处填写敏感追踪证据频道 SCP-079-WATCH 的 ID

[custom]
aio = [DATA EXPUNGED]
; 此处填写 True 或 False，代表程序是否与其他程序共用同一机器人帐号
backup = [DATA EXPUNGED]
; 此处填写 True 或 False，代表程序是否为备份副本
date_reset = [DATA EXPUNGED]
; 此处填写每月重置数据的日期，例如 1st mon ，代表每月第一个星期一
default_group_link = [DATA EXPUNGED]
; 此处填写调试信息中默认的群组链接
image_size = [DATA EXPUNGED]
; 此处填写整数，代表分析图片文档的最大大小，超过此大小则不通过下载原文件进行二维码，单位为 B
invalid = [DATA EXPUNGED]
; 此处填写不被机器人认为是 Telegram 链接的 username ，用空格分隔，无 @ 前缀
limit_track = [DATA EXPUNGED]
; 此处填写整数，代表用户短时间内加入多少群组才被认为是需要特殊对待的用户
project_link = https://scp-079.org/nospam/
; 此处填写项目网址
project_name = SCP-079-NOSPAM
; 此处填写项目名称
time_captcha = [DATA EXPUNGED]
; 此处填写整数，代表操作降级情况下，消息被发送和降级操作之间的时间差，超过此时长机器人将立即删除用户的全部消息，而不是令 CAPTCHA 发起新验证请求，单位为秒
time_long = [DATA EXPUNGED]
; 此处填写整数，代表判断用户为老用户的入群时长，单位为秒
time_new = [DATA EXPUNGED]
; 此处填写整数，代表判断用户为新用户的入群时长，用于进行昵称复查时使用，单位为秒
time_punish = [DATA EXPUNGED]
; 此处填写整数，代表惩罚用户的时间，期间用户发送的所有消息将被删除，并且，在此期间内若其发送消息将重新计时，单位为秒
time_short = [DATA EXPUNGED]
; 此处填写整数，代表判断用户为刚刚入群的入群时长，用户在群组开启新用户限制时使用，单位为秒
time_track = [DATA EXPUNGED]
; 此处填写整数，代表用户在多短时间内加入多个群组才被认为是需要特殊对待的用户
zh_cn = [DATA EXPUNGED]
; 此处填写 True 或 False，代表程序是否启用简体中文模式

[emoji]
emoji_ad_single = [DATA EXPUNGED]
; 此处填写整数，代表多少个同样的 emoji 在消息中出现则被认为是 ad_ 类词组
emoji_ad_total = [DATA EXPUNGED]
; 此处填写整数，代表一共多少个 emoji 在消息中出现则被认为是 ad_ 类词组
emoji_many = [DATA EXPUNGED]
; 此处填写整数，代表多少个 emoji 在消息中出现则被认为该消息含有多个 emoji
emoji_protect = [DATA EXPUNGED]
; 此处填写字符串，其中包含的 emoji 将受到保护，不计入各类判断中，字符串中间无空格，请以 \UXXXXXXXX 的形式代表一个 emoji
emoji_wb_single = [DATA EXPUNGED]
; 此处填写整数，代表多少个同样的 emoji 在消息中出现则被认为是 wb 类词组
emoji_wb_total = [DATA EXPUNGED]
; 此处填写整数，代表一共多少个 emoji 在消息中出现则被认为是 wb 类词组

[encrypt]
key = [DATA EXPUNGED]
; 加密字符串所用的密码
password = [DATA EXPUNGED]
; 加密文件所用的密码
```

---

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
<audio id="dooropen079" src="/audio/door/dooropen079.ogg"/>
