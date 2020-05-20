---
title: SCP-079-AVATAR
---

<link rel="stylesheet" href="/css/chinese.css">
<button onmouseover="PlaySound('totop1')" onmouseout="StopSound('totop1')" onclick="window.location.href = '/avatar/';" class="en">Click Here to English Page</button>

---

**项目编号：**SCP-079-AVATAR

**项目等级：**Keter

---

**特殊收容措施：**SCP-079-AVATAR 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-AVATAR。务必要注意，其机器人的真实身份应对所有人保持隐秘（除维护该机器人的人员以外的所有人士），否则将可能给其他机器人的工作带来影响。

本机器人所需依赖安装：

- Debian 10: `sudo apt update && sudo apt install opencc -y`
- pip: `pip install -r requirements.txt`

此机器人需要加入以下频道：

- **SCP-079-HIDE（必选）（应具有发送消息的权限）**

此机器人需要配合其他机器人使用：

- SCP-079-REGEX（推荐）
- SCP-079-NOSPAM（推荐）

---

**描述：**SCP-079-AVATAR 是一个用于将新入群用户头像发至 NOSPAM 进行分析的机器人，同时生成全局白名单。其项目位于 GitLab，镜像同步并开源于 [GitHub](https://github.com/scp-079/scp-079-avatar)。机器人的展示身份位于 <a href="https://t.me/SCP_079_AVATAR_BOT" class="079" target="_blank">SCP-079-AVATAR</a>，真实身份为隐藏状态，且并不接受任何来自用户群组和项目工作组的直接管理。通过该项目建立的机器人有类似的功能：发送新用户的头像数据至 NOSPAM，供其进行分析，避免 spammer 有意屏蔽 NOSPAM 使其无法获取头像；根据指定条件，自动生成用户的全局白名单，并分享给其他机器人，以供其他机器人参考。

- 此机器人的性质：User Bot，需要使用一个通过手机号码注册的用户帐号

---

**附录：**使用说明

请[点击此处以查看本机器人实例的使用手册](/avatar-manual-zh/)。

---

**附录：**自建机器人的方法

关于搭建机器人的通用说明，请先查看[自建说明书](/how-zh/)。

---

**文件#config.ini：**

这是一个自定义的文件。文件应位于 `config.ini.example` 同目录下。

需要对 `config.ini` 文件中内容为 `[DATA EXPUNGED]` 的全部键值进行修改。

API ID 与 API Hash 可在[官网](https://my.telegram.org)获取。

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

[channels]
debug_channel_id = [DATA EXPUNGED]
; 此处填写调试频道 SCP-079-DEBUG 的 ID
hide_channel_id = [DATA EXPUNGED]
; 此处填写数据交换备份频道 SCP-079-HIDE 的 ID

[custom]
project_link = https://scp-079.org/avatar-zh/
; 此处填写项目网址
project_name = SCP-079-AVATAR
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
limit_length = [DATA EXPUNGED]
; 此处填写整数，代表有效消息包含文本的最小长度
limit_message = [DATA EXPUNGED]
; 此处填写整数，代表用户加入白名单待选列表前，所需的有效发言的累计条数

[mode]
aio = False
; 此处填写 True 或 False，代表程序是否与其他程序共用同一机器人帐号
backup = False
; 此处填写 True 或 False，代表程序是否为备份副本

[time]
date_reset = 1st mon
; 此处填写每月重置数据的日期，例如 1st mon ，代表每月第一个星期一
time_begin = [DATA EXPUNGED]
; 此处填写 0 到 23 之间的整数，代表统计用户发言自定义时段的开始时间
time_check = [DATA EXPUNGED]
; 此处填写 0 到 23 之间的整数，代表每日自动生成全局白名单的时间点
time_end = [DATA EXPUNGED]
; 此处填写 0 到 23 之间的整数，代表统计用户发言自定义时段的结束时间
time_new = [DATA EXPUNGED]
; 此处填写整数，代表判断用户为新用户的入群时长，用于进行头像复查，单位为秒
time_old = [DATA EXPUNGED]
; 此处填写整数，代表判断用户为老用户的入群时长，单位为秒
```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
<audio id="dooropen079" src="/audio/door/dooropen079.ogg"/>
