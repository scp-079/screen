---
title: SCP-079-REGEX
---

<link rel="stylesheet" href="/css/chinese.css">

**项目编号：**SCP-079-REGEX

**项目等级：**Safe

**特殊收容措施：**SCP-079-REGEX 建议在 Linux 环境下运行。Python 3.6 及以上版本可以使用 SCP-079-REGEX。运行所需要安装的第三方模块已在 `requirements.txt` 中列出。

**描述：**SCP-079-REGEX 是一个用于管理正则表达式的机器人，其项目位于 <a href="https://gitlab.com/scp-079/scp-079-regex" target="_blank">Gitlab</a> 。机器人本体位于 <a href="https://t.me/SCP_079_REGEX" class="079" target="_blank">SCP-079-REGEX</a> ，目前仅供 SCP-079 内部使用，由 SCP-079-REGEX-1 群组的成员管理，所操作的正则模式提供给其他机器人使用。其附属的 SCP-079-REGEX-2 频道，用于测试文字所匹配的正则情况。该项目由 ███ 主要负责，基于原有 █████████ 机器人修改。通过该项目建立的机器人有类似的功能：管理不同种类的正则表达式，检查可能的重复，并与项目数据交换频道进行交互。具体操作详见附录中的使用说明。

**附录：**使用说明

SCP-079-REGEX-1 中的成员：

基本样式：`/operation type pattern`

- 例子一：`/list_nick`
- 例子二：`/add_bio 出售银行卡`

对于样式：`/operation_type pattern`

`operation` 应为以下任意一个：

- `add`、`ad`：添加一个规则
- `list`、`ls`：列出所有规则
- `remove`、`rm`：删除一个规则
- `search`、`s`、`find`：通过关键字查询规则

`type` 应为以下任意一个：

- `ava`：头像分析，avatar
- `bad`：敏感检测
- `ban`：自动封禁
- `bio`：简介封禁
- `del`：自动删除，delete
- `eme`：应急模式，emergency
- `nm`：昵称封禁，name
- `wb`：追踪封禁，watch ban
- `wd`：追踪删除，watch delete
- `sti`：贴纸删除，sticker

`pattern` 只能在 `add`、`remove`、`search` 操作下出现

更多例子：

- `/ls bad`
- `/add wb 专业引流`
- `/remove ban 测试`
- `/find nm 微信`

附加说明：

使用了 Python 中的 <a href="https://docs.python.org/3/library/re.html" target="_blank">re</a> 模块

```python
compiled = re.compile(pattern, re.I | re.M | re.S)
compiled.search(text)
```

**附录：**建立机器人的方法

克隆项目：

```bash
mkdir -p scp-079
git clone https://gitlab.com/scp-079/scp-079-regex.git scp-079/regex
cd scp-079/regex
```

依赖安装（考虑是否需要 virtualenv 等创建环境）：

```bash
pip install -r requirements.txt
```

创建配置文件：

```bash
cp config.ini.example config.ini
```

修改配置文件：

需要对 `config.ini` 文件中内容为 `[DATA EXPUNGED]` 的全部键值进行修改。 API ID 与 API Hash 在 https://my.telegram.org 处获取。

运行：

```bash
python3 main.py
```

**文件#config.ini：**

```ini
[pyrogram]
api_id = [DATA EXPUNGED] 
api_hash = [DATA EXPUNGED]
; 以上两条信息从官网申请获得

[proxy]
enabled = False
; 可根据需要自行决定是否启用 SOCKS5 代理
hostname = 127.0.0.1
port = 1080

[plugins]
root = plugins
include =
    handlers.callbacks
    handlers.commands
    handlers.messages

[custom]
channel_id = [DATA EXPUNGED]
; 此处填写测试频道 SCP-079-REGEX-2 的 ID
creator_id = [DATA EXPUNGED]
; 此处填写自己帐号的 ID
exchange_id = [DATA EXPUNGED]
; 此处填写数据交换频道 SCP-079-EXCHANGE 的 ID
group_id = [DATA EXPUNGED]
; 此处填写操作群组 SCP-079-REGEX-1 的 ID
password = [DATA EXPUNGED]
; 加密文件所用的密码
per_page = 15
; 每页显示的词组数量
prefix = /!！
; 命令前的字符
reload_path = [DATA EXPUNGED]
; 如果 upate 的类型设置为本地加载 (reload)，则在此输入 compiled 文件的路径
token = [DATA EXPUNGED]
; 此处填写在 Bot Father 处获得的 token
update_to = USER WATCHER
; 需要接受数据的对象，空格分隔
update_mode = reload
; 其他机器人更新数据的方式
; reload 代表本地加载
; download 代表从交换频道中下载

```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
<audio id="dooropen079" src="/audio/door/dooropen079.ogg"/>
