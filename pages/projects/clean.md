---
title: SCP-079-CLEAN
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-CLEAN

**项目等级：**Euclid

**特殊收容措施：**SCP-079-CLEAN 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-CLEAN 。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。务必要注意，其只能通过 SCP-079-USER 邀请入群，并由其赋予管理权限，如果有任何未授权的恶意使用，将可能给其他机器人的工作带来影响。其应该作为频道 SCP-079-EXCHANGE 、频道 SCP-079-HIDE 的管理员，并加入 SCP-079-TEST 群组。

**描述：**SCP-079-CLEAN 是一个用于过滤特定类型消息的机器人，其项目位于 <a href="https://gitlab.com/scp-079/scp-079-clean" target="_blank">Gitlab</a> 。机器人本体位于 <a href="https://t.me/SCP_079_CLEAN_BOT" class="079" target="_blank">SCP-079-CLEAN</a> ，仅供经过授权的群组使用，并由群组 SCP-079-MANAGE 中的成员对其进群、退群操作进行管理。其加入了 SCP-079-TEST ，用于测试基本功能的使用。该项目由 ███ 主要负责，基于原有 SCP-079-USER 机器人修改和扩充。通过该项目建立的机器人有类似的功能：根据管理员设置，删除某类型的消息，并对部分类型消息进行评分记录。具体操作详见附录中的使用说明。

**附录：**使用说明

群组中的管理员：

- `/config clean`：通过 [SCP-079-CONFIG](/config/) 调整机器人设置，机器人将回报前往设置的链接，5 分钟内设置将被锁定，无法查看和更改设置

除使用 `/config clean` 外，管理员也可以通过 `/config_clean` 命令在群组中手动调整设置：

- `/config_clean show`：显示当前设置
- `/config_clean default`：恢复为默认设置

开启或关闭过滤某种消息：

- `/config_clean type off`：忽略某类别消息 
- `/config_clean type on`：删除某类别消息

其中，`type` 为以下类别：

- `con`：联系人（默认过滤）
- `via`：通过 Bot 发送的消息
- `ani`：GIF 动图
- `bmd`：以 / 和 ! 为前缀的机器人命令
- `vid`：视频
- `vdn`：圆视频（默认过滤）
- `sti`：贴纸
- `pho`：图片
- `aud`：音频
- `voi`：语音（默认过滤）
- `gam`：游戏
- `ser`：服务类消息，对于加群消息将保留最后一条（默认过滤）
- `ttd`：定时删除贴纸和动图（二至三小时后）
- `sde`：群员可否自助删除自己所发所有消息
- `loc`：定位地址（默认过滤）
- `doc`：文件
- `exe`：EXE、APK、BAT、CMD 文件
- `tcl`：每日定时清除位于群组和黑名单中的 Deleted Account
- `aff`：传统 AFF 链接、支付宝淘宝红包、大陆 APP 的各类活动推广分享
- `sho`：短链接
- `tgl`：TG 链接
- `tgp`：TG 代理
- `iml`：即时通讯软件的邀请链接或联系方式
- `qrc`：二维码

SCP-079-TEST 中的成员：

- `转发图片、贴纸消息`：显示二维码内容
- `/version`：检查机器人版本

**附录：**自建机器人的方法

可先查看<a href="/how/">自建说明书</a>

克隆项目：

```bash
git clone https://gitlab.com/scp-079/scp-079-clean.git ~/bots/scp-079/clean
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

[custom]
default_group_link = [DATA EXPUNGED]
; 此处填写调试信息中默认的群组链接
image_size = [DATA EXPUNGED]
; 分析图片文档的最大大小，超过此大小则不通过下载原文件进行二维码，单位为 B
project_link = [DATA EXPUNGED]
; 此处填写项目网址
project_name = [DATA EXPUNGED]
; 此处填写项目名称
reset_day = [DATA EXPUNGED]
; 此处填写每月重置数据的日期，例如 1st mon ，代表每月第一个星期一
user_name = [DATA EXPUNGED]
; 此处填写 SCP-079-USER 的项目名称

[encrypt]
key = [DATA EXPUNGED]
; 加密字符串所用的密码
password = [DATA EXPUNGED]
; 加密文件所用的密码
```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
<audio id="dooropen079" src="/audio/door/dooropen079.ogg"/>
