---
title: SCP-079-REGEX
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-REGEX

**项目等级：**Safe

**特殊收容措施：**SCP-079-REGEX 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-REGEX 。运行所需要安装的第三方模块已在 `requirements.txt` 中列出，另外还需在系统中安装 `opencc` ，如在 Ubuntu 下，执行 `sudo apt update && sudo apt install opencc` 。其应该作为频道 SCP-079-EXCHANGE 的管理员，并加入 SCP-079-TEST 群组。

**描述：**SCP-079-REGEX 是一个用于管理正则表达式的机器人，其项目位于 <a href="https://gitlab.com/scp-079/scp-079-regex" target="_blank">Gitlab</a> 。机器人本体位于 <a href="https://t.me/SCP_079_REGEX_BOT" class="079" target="_blank">SCP-079-REGEX</a> ，仅供 SCP-079 内部使用，并由同名群组 SCP-079-REGEX 的成员管理，所操作的正则模式提供给其他机器人使用。其加入了 SCP-079-TEST ，用于测试文字所匹配的正则情况。该项目由 ███ 主要负责，基于原有 █████████ 机器人修改。通过该项目建立的机器人有类似的功能：管理不同种类的正则表达式、检查可能的重复、检索模式，并与项目数据交换频道进行交互。具体操作详见附录中的使用说明。

**附录：**使用说明

SCP-079-REGEX 中的成员：

基本样式：`/operation type pattern`

- 例子一：`/list nm`
- 例子二：`/add bio 出售银行卡`

对于样式：`/operation type pattern`

`operation` 应为以下任意一个：

- `add`、`ad`：添加一个规则
- `list`、`ls`：列出所有规则
- `remove`、`rm`：删除一个规则，在回复某条由同一管理员发送的有效 `add` 命令时，后面可以不跟参数
- `same` ： 用于回复某条由同一个管理员发送的有效 `add` 或 `remove` 命令，后面跟一种或几种 `type` ，代表这些 `type` 需要与被回复的命令一样，对某个模式执行相同的操作
- `search`、`s`、`find`：通过关键字查询规则，除所列出的 `type` 外，还可以查询 `all` 类型

`type` 应为以下任意一个：

- `ad`：广告用语
- `aff`：推广链接
- `ava`：头像分析，avatar
- `bad`：敏感检测
- `ban`：自动封禁
- `bio`：简介封禁
- `del`：自动删除，delete
- `eme`：应急模式，emergency
- `nm`：昵称封禁，name
- `rm`：RM 类笑话
- `sho`：短链接，short
- `tgl`：TG 链接，telegram link
- `tgp`：TG 代理，telegram proxy（MTProxy）
- `wb`：追踪封禁，watch ban
- `wd`：追踪删除，watch delete
- `sti`：贴纸删除，sticker
- `test` ：测试用例

`pattern` 只能在 `add`、`remove`、`search` 操作下出现

更多例子：

- `/ls bad`
- `/add wb 专业引流`
- `/remove ban 测试`
- `/find nm 微信`
- `/s all 四件套`

按钮：

- `另增新词`：另外增加新的规则，不替换已有的、可能重复的规则
- `全部替换`：用新的规则替换所有可能重复的规则
- `取消`：取消本次添加规则的操作
- `<<`：上一页
- `>>`：下一页

按钮对应的命令，以此命令回复带按钮的消息以获得相同操作效果：

- `/ask new`：对应 “另增新词”
- `/ask replace`：对应 “全部替换”
- `/ask cancel`：对应 “取消”
- `/page previous`：对应 “上一页”
- `/page next`：对应 “下一页”

SCP-079-TEST 中的成员：

- 直接发送测试消息
- `/version` ：检查机器人版本

附加说明：

使用了 Python 中的 <a href="https://docs.python.org/3/library/re.html" target="_blank">re</a> 模块

```python
regex = ["regex1", "regex2"]
pattern = "|".join(regex)
compiled["type"] = re.compile(pattern, re.I | re.M | re.S)
compiled.search("text")
```

机器人收到的词组已经是转义后的结果，例如用户发送了 `\b`，机器人收到的为 `\\b`

**附录：**自建机器人的方法

可先查看<a href="/how/">自建说明书</a>

克隆项目：

```bash
git clone https://gitlab.com/scp-079/scp-079-regex.git ~/bots/scp-079/regex
```

依赖安装：

```bash
sudo apt update && sudo apt install opencc
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

[channels]
exchange_channel_id = [DATA EXPUNGED]
; 此处填写数据交换频道 SCP-079-EXCHANGE 的 ID
hide_channel_id = [DATA EXPUNGED]
; 此处填写数据交换备份频道 SCP-079-HIDE 的 ID
regex_group_id = [DATA EXPUNGED]
; 此处填写操作群组 SCP-079-REGEX 的 ID
test_group_id = [DATA EXPUNGED]
; 此处填写测试群组 SCP-079-TEST 的 ID

[custom]
per_page = 15
; 每页显示的词组数量
reload_path = [DATA EXPUNGED]
; 如果 upate 的类型设置为本地加载 (reload)，则在此输入 compiled 文件的路径
update_type = reload
; 其他机器人更新数据的方式
; reload 代表本地加载
; download 代表从交换频道中下载

[encrypt]
key = [DATA EXPUNGED]
; 加密字符串所用的密码
password = [DATA EXPUNGED]
; 加密文件所用的密码
```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
<audio id="dooropen079" src="/audio/door/dooropen079.ogg"/>
