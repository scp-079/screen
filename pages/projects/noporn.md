---
title: SCP-079-NOPORN
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-NOPORN

**项目等级：**Euclid

**特殊收容措施：**SCP-079-NOPORN 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-NOPORN 。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。务必要注意，其只能通过 SCP-079-USER 邀请入群，并由其赋予管理权限，如果有任何未授权的恶意使用，将可能给其他机器人的工作带来影响。其应该作为频道 SCP-079-EXCHANGE 的管理员，并加入 SCP-079-TEST 群组。

**描述：**SCP-079-NOPORN 是一个用于群组成员管理的机器人，其项目位于 <a href="https://gitlab.com/scp-079/scp-079-noporn" target="_blank">Gitlab</a> 。机器人本体位于 <a href="https://t.me/SCP_079_NOPORN_BOT" class="079" target="_blank">SCP-079-NOPORN</a> ，仅供经过授权的群组使用，并由群组 SCP-079-MANAGE 中的成员对其进群、退群操作进行管理。其加入了 SCP-079-TEST ，用于测试分析结果。该项目由 ███ 主要负责，基于原有 SCP-079-USER 机器人修改。通过该项目建立的机器人有类似的功能：删除群组中的 NSFW 消息，对于在多个群组中以 NSFW 内容 spam 的用户进行封禁，根据管理员的设置，过滤转发自受 Telegram 官方限制频道的消息，并提供双方案评价媒体消息的媒体复查功能。具体操作详见附录中的使用说明。

**附录：**使用说明

群组中的管理员：

- `/config noporn`：通过 SCP-079-CONFIG 调整机器人设置，机器人将回报前往设置的链接

除使用 `/config noporn` 外，管理员也可以通过 `/noporn_config` 命令在群组中手动调整设置：

- `/noporn_config show`：显示当前设置
- `/noporn_config default`：恢复为默认设置
- `/noporn_config channel off`：关闭过滤受限频道消息功能
- `/noporn_config channel on` 打开过滤受限频道消息功能（默认设置）
- `/noporn_config recheck off`：关闭媒体复查功能（默认设置）
- `/noporn_config recheck on`：打开媒体复查功能

SCP-079-TEST 中的成员：

- `/version` ：检查机器人版本

**附录：**自建机器人的方法

可先查看<a href="/how/">自建说明书</a>

克隆主要项目：

```bash
git clone https://gitlab.com/scp-079/scp-079-noporn.git ~/bots/scp-079/noporn
```

依赖安装：

```bash
sudo apt update && sudo apt install caffe-cpu -y
```

克隆复查项目：

```bash
git clone -b recheck --single-branch https://gitlab.com/scp-079/scp-079-noporn.git ~/bots/scp-079/recheck
```

依赖安装：

```bash
sudo apt update && sudo apt install libatlas-base-dev libblas-dev libhdf5-dev liblapack-dev -y
```

**文件#config.ini：**

（主要版本）

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
logging_channel_username = [DATA EXPUNGED]
; 此处填写 SCP-079-LOGGING 频道的链接名（不带 @）

[custom]
default_group_link = [DATA EXPUNGED]
; 此处填写调试信息中默认的群组链接
image_size = [DATA EXPUNGED]
; 分析图片文档的最大大小，超过此大小则不下载文件进行 NSFW 分析，单位为 KB
project_link = [DATA EXPUNGED]
; 此处填写项目网址
project_name = [DATA EXPUNGED]
; 此处填写项目名称
reset_day = [DATA EXPUNGED]
; 此处填写每月重置数据的日期，例如 1st mon ，代表每月第一个星期一
threshold_porn = [DATA EXPUNGED]
; 判断 NSFW 的阈值，0 至 1 之间的小数，大于此阈值则认为图片为 NSFW
time_ban = [DATA EXPUNGED]
; 建议追踪封禁状态维持的时间，单位为秒
user_name = [DATA EXPUNGED]
; 此处填写 SCP-079-USER 的项目名称

[encrypt]
key = [DATA EXPUNGED]
; 加密字符串所用的密码
password = [DATA EXPUNGED]
; 加密文件所用的密码
```

（复查版本）

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
logging_channel_username = [DATA EXPUNGED]
; 此处填写 SCP-079-LOGGING 频道的链接名（不带 @）

[custom]
default_group_link = [DATA EXPUNGED]
; 此处填写调试信息中默认的群组链接
image_size = [DATA EXPUNGED]
; 分析图片文档的最大大小，超过此大小则不下载文件进行 NSFW 分析，单位为 KB
project_link = [DATA EXPUNGED]
; 此处填写项目网址
project_name = [DATA EXPUNGED]
; 此处填写项目名称
reset_day = [DATA EXPUNGED]
; 此处填写每月重置数据的日期，例如 1st mon ，代表每月第一个星期一
threshold_drawings = [DATA EXPUNGED]
; 判断 drawing 的阈值，0 至 1 之间的小数，大于此阈值可能判断图片为 drawing
threshold_drawings_hentai = [DATA EXPUNGED]
; 判断 drawing 和 hentai 加和的阈值，0 至 2 之间的小数，大于此阈值可能判断图片为 NSFW
threshold_hentai = [DATA EXPUNGED]
; 判断 hentai 的阈值，0 至 1 之间的小数，大于此阈值可能判断图片为 NSFW
threshold_porn = [DATA EXPUNGED]
; 判断 porn 的阈值，0 至 2 之间的小数，大于此阈值则认为图片为 NSFW
time_ban = [DATA EXPUNGED]
; 建议追踪封禁状态维持的时间，单位为秒
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
