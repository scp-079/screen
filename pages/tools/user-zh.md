---
title: SCP-079-USER
---

<link rel="stylesheet" href="/css/chinese.css">
<button onmouseover="PlaySound('totop1')" onmouseout="StopSound('totop1')" onclick="window.location.href = '/user/';" class="en">Click Here to English Page</button>

---

# 此为暂时性文档，以供自建参考

搭建过程中如遇问题，请至 [SCP-079-CHAT](https://t.me/SCP_079_CHAT) 咨询

---

**项目编号：**SCP-079-USER

**项目等级：**Euclid

---

**特殊收容措施：**SCP-079-USER 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-USER 。务必要注意，其应该关闭被陌生人拉入群组的设置，建议只允许某个群组内的用户可将其拉入其他群组中，如果有任何未授权的恶意使用，将可能给其他机器人的工作带来影响。

本机器人所需依赖安装：

- pip: `pip install -r requirements.txt`

此机器人需要加入以下频道：

- **SCP-079-EXCHANGE （必选）**
- **SCP-079-DEBUG （必选）**
- **SCP-079-LOGGING （必选）**
- SCP-079-HIDE
- SCP-079-CRITICAL

> SCP-079-USER 在上述频道中应具有发送消息的权限

此机器人需要加入以下群组：

- SCP-079-CAPTCHA （删除消息的权限）
- SCP-079-TEST

---

**描述：**SCP-079-USER 是一个用于协助、邀请其他 bot 的机器人，其项目位于 GitLab ，镜像同步并开源于 <a href="https://github.com/scp-079/scp-079-user" target="_blank">GitHub</a> 。Demo 机器人本体位于 <a href="https://t.me/SCP_079_USER_BOT" class="079" target="_blank">SCP-079-USER</a> ，仅供经过授权的群组使用。通过该项目建立的机器人有类似的功能：根据群组订阅设置，对某用户进行全局封禁或删除消息；协助其他机器人执行 user-bot 才可实现的功能。机器人将每月定时清除用户数据（黑名单）。

- 此机器人的性质：User Bot，需要使用一个通过手机号码注册的用户帐号

---

**附录：**使用说明

群组中的管理员：

- `/config user`：通过 [SCP-079-CONFIG](/config/) 调整机器人设置，机器人将回报前往设置的链接，5 分钟内设置将被锁定，无法再次更改

除使用 `/config user` 外，管理员也可以通过 `/config_user` 命令在群组中手动调整设置：

- `/config_user show`：显示当前设置
- `/config_user default`：恢复为默认设置
- `/config_user delete off`：关闭协助删除功能，关闭后，将不再响应其他 bot 的协助删除用户全部消息的请求（不推荐，这可能给其他机器人的功能带来影响）
- `/config_user delete on`：开启协助删除功能（默认设置） 
- `待补充`

SCP-079-TEST 中的成员：

- `/mention [id | username]`：通过 ID 或 username 查询用户
- `/version`：检查机器人版本
- `待补充`

---

**附录：**自建机器人的方法

关于搭建机器人的通用说明，请先查看<a href="/how-zh/" target="_blank">自建说明书</a>

克隆项目：

```bash
git clone https://github.com/scp-079/scp-079-user.git ~/bots/scp-079/user
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
captcha_group_id = [DATA EXPUNGED]
; 此处填写 CAPTCHA 专用群组的 ID
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
aio = False
; 此处填写 True 或 False，代表程序是否与其他程序共用同一机器人帐号
backup = False
; 此处填写 True 或 False，代表程序是否为备份副本
date_reset = 1st mon
; 此处填写每月重置数据的日期，例如 1st mon ，代表每月第一个星期一
default_group_link = [DATA EXPUNGED]
; 此处填写 DEBUG 频道信息中默认的群组链接
image_size = [DATA EXPUNGED]
; 此处填写整数，代表分享链接预览中的图片的最大大小，单位为 B
project_link = https://scp-079.org/user/
; 此处填写项目网址
project_name = SCP-079-USER
; 此处填写项目名称
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
