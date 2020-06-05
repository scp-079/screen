---
title: SCP-079-CAPTCHA
---

<link rel="stylesheet" href="/css/chinese.css">
<button onmouseover="PlaySound('totop1')" onmouseout="StopSound('totop1')" onclick="window.location.href = '/captcha/';" class="en">Click Here to English Page</button>

---

**项目编号：**SCP-079-CAPTCHA

**项目等级：**Euclid

---

**特殊收容措施：**SCP-079-CAPTCHA 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-CAPTCHA 。务必要注意，其只能通过 SCP-079-USER 邀请入群，并由其赋予管理权限，如果有任何未授权的恶意使用，将可能给其他机器人的工作带来影响。

本机器人所需依赖安装：

- Debian 10: `sudo apt update && sudo apt install fonts-arphic-gkai00mp fonts-freefont-ttf opencc -y`
- pip: `pip install -r requirements.txt`

此机器人需要加入以下频道：

- **SCP-079-DEBUG（必选）**
- **SCP-079-EXCHANGE（必选）**
- **SCP-079-LOGGING（必选）**
- SCP-079-HIDE
- SCP-079-CRITICAL

> SCP-079-CAPTCHA 在上述频道中应具有发送消息的权限

此机器人需要额外创建以下频道，机器人不必加入此频道中：

- SCP-079-CAPTCHA

此机器人需要加入以下群组：

- **SCP-079-CAPTCHA（必选）（应具有封禁用户、删除消息、邀请用户的管理员权限）**
- SCP-079-TEST

此机器人需要配合其他机器人使用：

- **SCP-079-USER（必选）**
- SCP-079-LANG（推荐）
- SCP-079-REGEX（推荐）
- SCP-079-NOSPAM（推荐）

---

**描述：**SCP-079-CAPTCHA 是一个提供用户入群验证的机器人，其项目位于 GitLab ，镜像同步并开源于 [GitHub](https://github.com/scp-079/scp-079-captcha)。Demo 机器人本体位于 <a href="https://t.me/SCP_079_CAPTCHA_BOT" class="079" target="_blank">SCP-079-CAPTCHA</a>，仅供经过授权的群组使用。通过源码搭建的机器人可拥有类似功能：提供对新入群用户的验证审核。如果群组开启了免验证模式，用户在成功验证一次后，在一段时间内可以自动在多群免验证。并且，验证流程不会在群内呈现，多人进群也不会造成验证码的刷屏，本机器人力求以最简短最不干扰群组内正常交流的方式提醒用户进行验证。

- 此机器人的性质：常规机器人，需要获取 bot token

---

**附录：**使用说明

请[点击此处以查看本机器人实例的使用手册](/captcha-manual-zh/)。

---

**附录：**自建机器人的方法

关于搭建机器人的通用说明，请先查看<a href="/how-zh/" target="_blank">自建说明书</a>。


启用看图辨物的功能：如需启用此功能，服务托管者须在 `~/scp-079/captcha/assets/` 下创建 `pics` 文件夹，并适当存放图片，其结构描述如下：

- pics/
    - 物体名称_1/
        - 图片_1.jpg
        - 图片_2.jpg
        - ...
    - 物体名称_2/
        - 图片_1.jpg
        - 图片_2.jpg
        - ...
    - ...

注意物体名称文件夹的名字，不应超过 64 个字节长度（换算为：中文字符不超过 21 个；英文字符不超过 64 个）。

---

**文件#config.ini：**

这是一个自定义的文件。文件应位于 `config.ini.example` 同目录下。

需要对 `config.ini` 文件中内容为 `[DATA EXPUNGED]` 的全部键值进行修改。 API ID 与 API Hash 在 <a href="https://my.telegram.org" target="_blank">官网</a> 获取。

一些建议：

- `[captcha]` 中需要填写 `captcha_link`，这是一个备用频道链接，此频道用于在某些情况下提供加入专用验证群组的链接。
- 建议自建者将备用频道设置为公开频道。并且，备用频道中应该至少有一条明显的消息，用以指向加入专用验证群组的链接。
- 建议自建者通过 [TIP](/tip-zh/) 自动维护公开备用频道入群链接，即，TIP 加入专用验证群组中，并利用 TIP 将备用频道作为专用验证群组的`入群频道`。

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
avatar_id = [DATA EXPUNGED]
; SCP-079-AVATAR 的 ID
captcha_id = [DATA EXPUNGED]
; SCP-079-CAPTCHA 的 ID
clean_id = [DATA EXPUNGED]
; SCP-079-CLEAN 的 ID
index_id = [DATA EXPUNGED]
; SCP-079-INDEX 的 ID
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
tip_id = [DATA EXPUNGED]
; SCP-079-TIP 的 ID
user_id = [DATA EXPUNGED]
; SCP-079-USER 的 ID
warn_id = [DATA EXPUNGED]
; SCP-079-WARN 的 ID

[captcha]
captcha_link = [DATA EXPUNGED]
; 此处填写公开频道 SCP-079-CAPTCHA 的长期链接
font_chinese = /usr/share/fonts/truetype/arphic-gkai00mp/gkai00mp.ttf
; 此处填写中文字体的路径
font_english = /usr/share/fonts/truetype/freefont/FreeMono.ttf
; 此处填写英文字体的路径
font_number = /usr/share/fonts/truetype/freefont/FreeMono.ttf
; 此处填写数字字体的路径
noise = [DATA EXPUNGED]
; 此处填写噪声值，推荐 0.3 - 0.5 之间


[channels]
captcha_group_id = [DATA EXPUNGED]
; 此处填写 CAPTCHA 专用群组的 ID
critical_channel_id = [DATA EXPUNGED]
; 此处填写紧急频道 SCP-079-CRITICAL 的 ID
debug_channel_id = [DATA EXPUNGED]
; 此处填写调试频道 SCP-079-DEBUG 的 ID
exchange_channel_id = [DATA EXPUNGED]
; 此处填写数据交换频道 SCP-079-EXCHANGE 的 ID
hide_channel_id = [DATA EXPUNGED]
; 此处填写数据交换备份频道 SCP-079-HIDE 的 ID
logging_channel_id = [DATA EXPUNGED]
; 此处填写证据存放频道 SCP-079-LOGGING 的 ID
test_group_id = [DATA EXPUNGED]
; 此处填写测试群组 SCP-079-TEST 的 ID

[custom]
default_group_link = https://t.me/SCP_079_DEBUG
; 此处填写 DEBUG 频道信息中默认的群组链接
leave_button = 申请使用
; 此处填写未授权使用时，发送说明消息的按钮文字
leave_link = https://scp-079.org/ApplyForUse/
; 此处填写未授权使用时，发送说明消息的按钮链接
leave_reason = 需要授权方可使用
; 此处填写未授权使用时，退出群组的原因
more = True
; 此处填写 True 或 False，代表是否在用户验证通过后启用链接按钮
more_link = https://scp-079.org/readme/
; 此处填写链接
more_text = 点击了解本项目
; 此处填写按钮文字
project_link = https://scp-079.org/captcha-zh/
; 此处填写项目网址
project_name = SCP-079-CAPTCHA
; 此处填写项目名称

[emoji]
emoji_ad_single = [DATA EXPUNGED]
; 此处填写整数，代表多少个同样的 emoji 在消息中出现则被认为是 ad_ 类词组
emoji_ad_total = [DATA EXPUNGED]
; 此处填写整数，代表一共多少个 emoji 在消息中出现则被认为是 ad_ 类词组
emoji_many = 15
; 此处填写整数，代表多少个 emoji 在消息中出现则被认为该消息含有多个 emoji
emoji_protect = \U0001F642
; 此处填写字符串，其中包含的 emoji 将受到保护，不计入各类判断中，字符串中间无空格，请以 \UXXXXXXXX 的形式代表一个 emoji
emoji_wb_single = [DATA EXPUNGED]
; 此处填写整数，代表多少个同样的 emoji 在消息中出现则被认为是 wb 类词组
emoji_wb_total = [DATA EXPUNGED]
; 此处填写整数，代表一共多少个 emoji 在消息中出现则被认为是 wb 类词组

[encrypt]
key = [DATA EXPUNGED]
; 各机器人加密字符串所用的统一密码，需由程序生成
password = [DATA EXPUNGED]
; 各机器人加密文件所用的统一密码，建议为长度 16 及以上的随机字符串

[language]
lang = cmn-Hans
; 此处填写 languages 文件夹下所包含的 YAML 文件的对应名称
normalize = True
; 此处填写 True 或 False，代表程序是否对消息文字进行转换处理

[limit]
limit_flood = 10
; 此处填写整数，代表正常模式下 time_captcha 时间内入群人数的最大值，超过则自动启用防轰炸模式
limit_mention = 20
; 此处填写整数，代表同一条入群验证提示消息 mention 的最大人数
limit_track = [DATA EXPUNGED]
; 此处填写整数，代表用户短时间内加入多少群组才被认为是需要特殊对待的用户
limit_try = 2
; 此处填写整数，代表用户验证超时的机会次数

[mode]
aio = False
; 此处填写 True 或 False，代表程序是否与其他程序共用同一机器人帐号
backup = False
; 此处填写 True 或 False，代表程序是否为备份副本
failed = False
; 此处填写 True 或 False，代表程序是否每天将验证失败的用户列表以 TSV 文件的格式，发送至 REGEX 群组中以供工作组分析 spam 规律
simple = False
; 此处填写 True 或 False，代表是否启用简单文字数学运算验证
simple_only = False
; 此处填写 True 或 False，极简模式，代表是否仅使用简单文字数学运算验证模式、不使用其他相对复杂的验证问题，启用该模式时，simple 值需要为 True

[time]
date_reset = 1st mon
; 此处填写每月重置数据的日期，例如 1st mon ，代表每月第一个星期一
time_captcha = 240
; 此处填写整数，代表等待用户验证时间的上限，单位为秒
time_invite = [DATA EXPUNGED]
; 此处填写整数，代表加入 CAPTCHA 专用验证群链接的刷新间隔时间，单位为秒
time_new = [DATA EXPUNGED]
; 此处填写整数，代表判断用户为新用户的入群时长，单位为秒
time_punish = 600
; 此处填写整数，代表惩罚用户的时间，期间用户在验证未通过群组将保持封禁状态，惩罚时间过后才会被解禁，单位为秒
time_recheck = [DATA EXPUNGED]
; 此处填写整数，代表用户加入已通过验证的同一群组超过多长时间才再需要验证，单位为秒
time_remove = 300
; 此处填写整数，代表普通用户可加入 CAPTCHA 群组的最长时间，单位为秒
time_short = [DATA EXPUNGED]
; 此处填写整数，代表判断用户为刚刚入群的入群时长，用户在群组开启新用户限制时使用，单位为秒
time_track = [DATA EXPUNGED]
; 此处填写整数，代表用户在多短时间内加入多个群组才被认为是需要特殊对待的用户
```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
<audio id="dooropen079" src="/audio/door/dooropen079.ogg"/>
