---
title: SCP-079-LANG
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-LANG

**项目等级：**Euclid

**特殊收容措施：**SCP-079-LANG 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-LANG 。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。务必要注意，其只能通过 SCP-079-USER 邀请入群，并由其赋予管理权限，如果有任何未授权的恶意使用，将可能给其他机器人的工作带来影响。其应该作为频道 SCP-079-CRITICAL 、频道 SCP-079-EXCHANGE 、频道 SCP-079-HIDE 的管理员，并加入 SCP-079-TEST 群组。

**描述：**SCP-079-LANG 是一个用于根据语言删除消息或封禁用户的机器人，其项目位于 GitLab ，镜像同步并准备（尚未）开源于 <a href="https://github.com/scp-079/scp-079-lang" target="_blank">GitHub</a> 。机器人本体位于 <a href="https://t.me/SCP_079_LANG_BOT" class="079" target="_blank">SCP-079-LANG</a> ，仅供经过授权的群组使用，并由群组 SCP-079-MANAGE 中的成员对其进群、退群操作进行管理。其加入了 SCP-079-TEST ，用于测试分析结果。该项目由 ███ 主要负责。通过该项目建立的机器人有类似的功能：根据群组的设置，删除某些语言的消息，或封禁某些语言昵称的用户。具体操作详见附录中的使用说明。

---

**附录：**使用说明

群组中的管理员：

- `/config lang`：通过 [SCP-079-CONFIG](/config/) 调整机器人设置，机器人将回报前往设置的链接，5 分钟内设置将被锁定，无法再次更改

除使用 `/config lang` 外，管理员也可以通过 `/config_lang` 命令在群组中手动调整设置：

- `/config_lang show`：显示当前设置
- `/config_lang default`：恢复为默认设置
- `/config_lang delete off`：关闭协助删除功能
- `/config_lang delete on`：开启协助删除功能（默认设置） 
- `/config_lang name default`：将名称过滤功能重置为默认状态
- `/config_lang name off`：关闭检查名称语言的功能
- `/config_lang name on` 打开检查名称语言的功能（默认设置）
- `/config_lang name [languages]`：设置名称过滤的语言，其中 `[languages]` 为以空格作为分隔的字符串，例如 `ar ja`
- `/config_lang text default`：将文字过滤功能重置为默认状态
- `/config_lang text off`：关闭检查文字语言的功能
- `/config_lang text on`：打开检查文字语言的功能（默认设置）
- `/config_lang text [languages]`：设置文字过滤的语言，其中 `[languages]` 为以空格作为分隔的字符串，例如 `ar ja`
- `/config_lang sticker default`：将贴纸过滤功能重置为默认状态
- `/config_lang sticker off`：关闭检查贴纸标题语言的功能
- `/config_lang sticker on`：打开检查贴纸标题语言的功能（默认设置）
- `/config_lang sticker [languages]`：设置贴纸标题过滤的语言，其中 `[languages]` 为以空格作为分隔的字符串，例如 `ar ja`
- `/config_lang spc off`：关闭过滤特殊中文的功能
- `/config_lang spc on`：打开过滤特殊中文的功能（默认设置）
- `/config_lang spe off`：关闭过滤特殊英文的功能（默认设置）
- `/config_lang spe on`：打开过滤特殊英文的功能

其中，`[languages]` 应从以下列表选择：

```
af, am, an, ar, as, az, be, bg, bn, br, bs, ca, cs, cy, da, de, dz, el, en, eo, es, et, eu, fa, fi, fo, fr, ga, gl, gu, he, hi, hr, ht, hu, hy, id, is, it, ja, jv, ka, kk, km, kn, ko, ku, ky, la, lb, lo, lt, lv, mg, mk, ml, mn, mr, ms, mt, nb, ne, nl, nn, no, oc, or, pa, pl, ps, pt, qu, ro, ru, rw, se, si, sk, sl, so, sq, sr, sv, sw, ta, te, th, tl, tr, ug, uk, ur, vi, vo, wa, xh, zu
```

以上代号所对应的语言，可见： <a href="https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes" target="_blank">List of ISO 639-1 codes</a>

SCP-079-TEST 中的成员：

- `发送文字消息`：显示分析结果
- `/version`：检查机器人版本

---

**附录：**自建机器人的方法

可先查看<a href="/how-zh/">自建说明书</a>

克隆项目：

```bash
git clone https://github.com/scp-079/scp-079-lang.git ~/scp-079/lang
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
date_reset = [DATA EXPUNGED]
; 此处填写每月重置数据的日期，例如 1st mon ，代表每月第一个星期一
default_group_link = [DATA EXPUNGED]
; 此处填写调试信息中默认的群组链接
lang_all = [DATA EXPUNGED]
; 此处填写可用语言代号，以空格分隔
lang_name = [DATA EXPUNGED]
; 此处填写默认封禁的名称语言代号，以空格分隔
lang_protect = [DATA EXPUNGED]
; 此处填写受保护的语言代号，以空格分隔
lang_sticker = [DATA EXPUNGED]
; 此处填写默认删除的贴纸标题语言代号，以空格分隔
lang_text = [DATA EXPUNGED]
; 此处填写默认删除的文字语言代号，以空格分隔
project_link = [DATA EXPUNGED]
; 此处填写项目网址
project_name = [DATA EXPUNGED]
; 此处填写项目名称
time_ban = [DATA EXPUNGED]
; 建议追踪封禁状态维持的时间，单位为秒
time_punish = [DATA EXPUNGED]
; 惩罚用户的时间，期间用户发送的所有消息将被删除，并且，在此期间内若其发送消息将重新计时
time_new = [DATA EXPUNGED]
; 此处填写判断用户为新用户的入群时长，单位为秒
zh_cn = [DATA EXPUNGED]
; 此处填写 True 或 False，代表程序是否启用简体中文模式

[encrypt]
key = [DATA EXPUNGED]
; 加密字符串所用的密码
password = [DATA EXPUNGED]
; 加密文件所用的密码
```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
<audio id="dooropen079" src="/audio/door/dooropen079.ogg"/>

