---
title: SCP-079-REGEX
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-REGEX

**项目等级：**Safe

**特殊收容措施：**SCP-079-REGEX 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-REGEX 。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。其应该作为频道 SCP-079-CRITICAL 、频道 SCP-079-EXCHANGE 、频道 SCP-079-HIDE 的管理员，并加入 SCP-079-REGEX 、 SCP-079-TEST 群组。

**描述：**SCP-079-REGEX 是一个用于管理正则表达式的机器人，其项目位于 GitLab ，镜像同步并准备（尚未）开源于 <a href="https://github.com/scp-079/scp-079-regex" target="_blank">GitHub</a> 。机器人本体位于 <a href="https://t.me/SCP_079_REGEX_BOT" class="079" target="_blank">SCP-079-REGEX</a> ，仅供 SCP-079 内部使用，并由同名群组 SCP-079-REGEX 的成员管理，所操作的正则模式将提供给其他机器人使用。其加入了 SCP-079-TEST ，用于测试文字所匹配的正则情况。该项目由 ███ 主要负责，基于 █████████ 机器人修改。通过该项目建立的机器人有类似的功能：管理不同种类的正则表达式、检查可能的重复、检索正则、显示正则命中频率，并与项目数据交换频道进行交互。具体操作详见附录中的使用说明。

---

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
- `search`、`s`、`find`：通过关键字查询规则，除所列出的 `type` 外，还可以查询 `all` 类型，如未指定有效的 `type` ，则默认为 `all`

`type` 应为以下任意一个：

- `ad`：广告用语
- `aff`：推广链接
- `ava`：头像分析，avatar
- `bad`：敏感检测
- `ban`：自动封禁
- `bio`：简介封禁
- `con`：联系方式，contact
- `del`：自动删除，delete
- `eme`：应急模式，emergency
- `iml`：IM 链接，IM link
- `nm`：昵称封禁，name
- `rm`：RM 类笑话
- `sho`：短链接，short
- `spc`：特殊中文字符，special chinese character
- `spe`：特殊英文字符，special english character
- `sti`：贴纸删除，sticker
- `tgl`：TG 链接，telegram link
- `tgp`：TG 代理，telegram proxy（MTProxy）
- `wb`：追踪封禁，watch ban
- `wd`：追踪删除，watch delete
- `test`：测试用例

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

- `/ask new`：对应按钮 “另增新词”
- `/ask replace`：对应按钮 “全部替换”
- `/ask cancel`：对应按钮 “取消”
- `/page previous`：对应按钮 “上一页”
- `/page next`：对应按钮 “下一页”

其他命令：

- `/count`：要求其他机器人立刻回报当日统计数据
- `/ls`：后面不跟类别，显示已有的所有类别及代号
- `/push [word_type]`：手动推送某类规则，若 `[word_type]` 为 `all`，则推送全部规则
- `/reset [word_type]`：清除某类规则计数数据，若 `[word_type]` 为 `all`，则清除全部规则计数
- `/s 关键词`：忽略类别，则默认搜索所有类别含关键词的规则

关于列表中规则下方数字的解释：

- `0.0 / 0 / 0`：分别为自添加以来每日的触发平均条数、前一日的触发条数（若当日手动要求更新计数，则此数值相应增加，次日此数值相应减少）、总触发条数

SCP-079-TEST 中的成员：

- 直接发送测试消息
- `/version`：检查机器人版本

附加说明：

使用了 Python 中的 <a href="https://docs.python.org/3/library/re.html" target="_blank">re</a> 模块

```python
re.search(pattern, text, re.I | re.M | re.S)
```

机器人收到的词组已经是转义后的结果，例如用户发送了 `\b`，机器人收到的为 `\\b`

---

**附录：**自建机器人的方法

可先查看<a href="/how/">自建说明书</a>

克隆项目：

```bash
git clone https://github.com/scp-079/scp-079-regex.git ~/bots/scp-079/regex
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
critical_channel_id = [DATA EXPUNGED]
; 此处填写紧急频道 SCP-079-CRITICAL 的 ID
debug_channel_id = [DATA EXPUNGED]
; 此处填写调试频道 SCP-079-DEBUG 的 ID
exchange_channel_id = [DATA EXPUNGED]
; 此处填写数据交换频道 SCP-079-EXCHANGE 的 ID
; 关于数据交换频道的详情，请查看 https://scp-079.org/exchange/
hide_channel_id = [DATA EXPUNGED]
; 此处填写数据交换备份频道 SCP-079-HIDE 的 ID
regex_group_id = [DATA EXPUNGED]
; 此处填写操作群组 SCP-079-REGEX 的 ID
test_group_id = [DATA EXPUNGED]
; 此处填写测试群组 SCP-079-TEST 的 ID

[custom]
per_page = 10
; 每页显示的词组数量
project_link = [DATA EXPUNGED]
; 此处填写项目网址
project_name = [DATA EXPUNGED]
; 此处填写项目名称

[encrypt]
key = [DATA EXPUNGED]
; 加密字符串所用的密码
password = [DATA EXPUNGED]
; 加密文件所用的密码
```

---

**附录：**开发备忘

1. 在 SCP-079-EXCHANGE 频道中等待来自其他机器人的计数更新
2. 向其他机器人推送更新，不同类别不同推送接收者

REGEX 能够向 BACKUP、CLEAN、LONG、NOFLOOD、NOPORN、NOSPAM、WATCH 发送数据

情形 1：向 BACKUP 传送数据备份文件。每日 UTC 时间 20:00 。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="REGEX",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="pickle",
    data="ad_words"
)
```

情形 2：向 BACKUP 汇报在线状态。每个小时的第 30 分钟：

```python
exchange_text = format_data(
    sender="REGEX",
    receviers=[
        "BACKUP"
    ],
    action="backup",
    action_type="status",
    data="awake"
)
```

情形 3：向其他 Bot（CLEAN、LONG、NOFLOOD、NOPORN、NOSPAM、WATCH）推送正则更新文件。`exchange_text` 文本作为该文件的 `caption`

```python
exchange_text = format_data(
    sender="REGEX",
    receviers=[
        "CLEAN",
        "WATCH"
    ],
    action="regex",
    action_type="update",
    data="aff_words"
)
```

情形 4：向其他 Bot（CLEAN、LONG、NOFLOOD、NOPORN、NOSPAM、WATCH）要求更新正则使用计数

```python
exchange_text = format_data(
    sender="REGEX",
    receviers=[
        "CLEAN",
        "LONG",
        "NOFLOOD",
        "NOPORN",
        "NOSPAM",
        "WATCH"
    ],
    action="regex",
    action_type="count",
    data="ask"
)
```

特殊情形：向所有 bot 发送数据交换频道转移指令

```python
exchange_text = format_data(
    sender="REGEX",
    receviers=[
        "EMERGENCY"
    ],
    action="backup",
    action_type="hide",
    data=True
)
```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
<audio id="dooropen079" src="/audio/door/dooropen079.ogg"/>
