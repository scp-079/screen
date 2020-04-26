---
title: Self Hosting Instructions
---

<link rel="stylesheet" href="/css/chinese.css">
<button onmouseover="PlaySound('totop1')" onmouseout="StopSound('totop1')" onclick="window.location.href = '/how-zh/';" class="en">Click Here to English Page</button>

---

# 自建说明书

SCP-079 系列机器人的搭建涉及多个频道、群组、机器人帐号、用户帐号的创建。以下是对自建完整实例的所需要的频道、群组、帐号的说明，当然，您可根据所需要的功能只自行搭建某一个或某几个机器人，此时则可对照各机器人[单独的介绍页面](/tools-zh/)来创建频道、群组等。

本项目完整实例所需的公开频道有：

- SCP-079-CAPTCHA
- SCP-079-CONFIG
- SCP-079-CRITICAL
- SCP-079-DEBUG
- SCP-079-ERROR
- SCP-079-LOGGING

本项目完整实例所需的私有频道有：

- SCP-079-EXCHANGE
- SCP-079-HIDE
- SCP-079-M
- SCP-079-WATCH

本项目完整实例所需的私有群组有：

- SCP-079-CAPTCHA
- SCP-079-MANAGE
- SCP-079-REGEX
- SCP-079-TEST
- SCP-079-TICKET

本项目完整实例所需的常规 Bot 有：

- SCP-079-CAPTCHA
- SCP-079-CLEAN
- SCP-079-CONFIG
- SCP-079-HIDE
- SCP-079-LANG
- SCP-079-LONG
- SCP-079-MANAGE
- SCP-079-NOFLOOD
- SCP-079-NOPORN
- SCP-079-NOSPAM
- SCP-079-PM
- SCP-079-RECHECK
- SCP-079-REGEX
- SCP-079-TICKET
- SCP-079-WARN

本项目完整实例所需的 User Bot 有：

- SCP-079-AVATAR
- SCP-079-USER
- SCP-079-WATCH

> 其中，SCP-079-USER 是项目所有在群组中工作的机器人的核心，它们都要求 SCP-079-USER 在群组内协助工作

对于各机器人的频道、群组加入情况的具体要求请参见相应机器人[单独的介绍页面](/tools-zh/)。
这篇文章仅以建立 [SCP-079-PM](/pm-zh/) （私聊转发机器人）为例，用于介绍自建 SCP-079 系列机器人所需的通用步骤。

此文示例所用的环境为：

- Debian 10
- Python 3.7.3
- 系统的用户名为 `scp`

另见：[为什么你应该自行建立机器人](/suggestions-zh/)

---

## 更新系统

首先，请确保系统环境为最新，执行以下命令：

```bash
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove -y
```

## 安装搭建所需基本软件包

安装 vim、git 等工具：

```bash
sudo apt install build-essential git python3-dev python3-venv vim -y
```

如需搭建完整实例，可在此时安装其他依赖：

```bash
sudo apt install caffe-cpu fonts-arphic-gkai00mp fonts-freefont-ttf libzbar0 opencc tesseract-ocr tesseract-ocr-chi-sim tesseract-ocr-chi-tra -y
```

> 注：对于 NOPORN，请参照其源代码中 `fix.py` 内的描述，对系统环境做些许更改。

如仅需搭建部分实例，则请查看各项目源代码中的 `README.md` 中的描述进行依赖的安装。

---

## 配置脚本

除有更新 scripts 的必要，下次搭建其他机器人时，无需重复克隆：

```bash
mkdir -p ~/scp-079
git clone https://github.com/scp-079/scripts.git ~/scp-079/scripts
```

## 设置便捷命令

下次搭建其他机器人无需重复设置：

```bash
vim ~/.bash_aliases
```

添加如下内容：

```bash
alias base="deactivate"
alias build="bash ~/scp-079/scripts/build.sh"
alias venv="source ~/scp-079/scripts/venv.sh"

alias config="bash ~/scp-079/scripts/config.sh"
alias log="bash ~/scp-079/scripts/log.sh"
alias restart="bash ~/scp-079/scripts/restart.sh"
alias status="bash ~/scp-079/scripts/status.sh"
alias start="bash ~/scp-079/scripts/start.sh"
alias stop="bash ~/scp-079/scripts/stop.sh"
alias update="bash ~/scp-079/scripts/update.sh"

alias disable="bash ~/scp-079/scripts/disable.sh"
alias enable="bash ~/scp-079/scripts/enable.sh"
alias refresh="bash ~/scp-079/scripts/refresh.sh"
alias show="bash ~/scp-079/scripts/show.sh"
alias shut="bash ~/scp-079/scripts/shut.sh"
alias upgrade="bash ~/scp-079/scripts/upgrade.sh"
```

令其生效：

```bash
source ~/.bash_aliases
```

至此，便携命令设置完毕。

---

## 创建机器人

以 SCP-079-PM 为例：

```bash
build
```

按要求分别输入 SCP-079 的某个项目代号（小写，例如：`pm`，本文示例填写的是 `pm`），自定义的名称（小写，无空格，例如：`ticket`，本文示例填写的是 `pm`），之后此脚本将根据预设配置相应文件。

准备工作结束后，将要求用户修改 `config.ini` 文件。

## 更改配置文件

需要对 `config.ini` 文件中内容为 `[DATA EXPUNGED]` 的全部键值进行修改，`config.ini` 文件中参数代表的含义，可在各机器人的[单独使用说明](/pm-zh/)中 `文件#config.ini` 一节查看。

注意：部分机器人需要在 `[encrypt]` 中填写 `key` 值，整体项目统一使用相同的 `key`，其需要通过程序生成，获取方式如下：

```bash
python3
```

```python3
from cryptography.fernet import Fernet
key = Fernet.generate_key()
print(key.decode())    # 接着复制打印出的 key，填写至 config.ini 文件中
```

文件 `config.ini` 修改结束后，请妥善保存并退出。

## 设置每日定时重启

```bash
enable 00:00:00
```

请务必确保参数格式与示例一致，例如 `00:00:00` 代表在系统时间的 0 点 0 分 0 秒重启所有机器人。

可根据需要自行调整此参数，建议将重启时间设置为机器人负载较低的时间段。

## 需采取的额外操作

有些机器人可能需要一些额外的更改，例如：CAPTCHA 可以添加自定义的图片文件。

因此，请先查阅[各项目单独使用说明](/tools-zh/)中 `附录：自建机器人的方法` 一节的说明，确保必要的操作被正确执行。

---

## 启用机器人服务

对于常规普通机器人，比如本文的 SCP-079-PM，可直接启动服务：

```bash
start pm
```

对于使用普通用户帐号的 User Bot，则需先进行登录操作（以 SCP-079-USER 为例）：

```bash
venv user    # 切换到虚拟环境
cd ~/scp-079/user
python main.py    # 临时启动程序
```

此时，将提示登录帐号，按要求操作即可，注意手机号输入时中间无空格、符号，省略最前方的加号。如登录成功，则按 Ctrl + C 退出程序，接着，启动服务：

```bash
base    # 退出虚拟环境
start user
```

至此，机器人应已成功运行。

---

## 便捷命令使用方法

配置机器人：

```bash
config pm
```

查看机器人日志：

```bash
log pm
```

重启机器人：

```bash
start pm
```

停止机器人：

```bash
stop pm
```

强制重启机器人：

```bash
restart pm
```

查看机器人 systemd 服务状态：

```bash
status pm
```

更新机器人：

```bash
update pm
```

停用所有机器人：

```bash
disable
```

启用所有机器人，并指定每日定时重启的时间：

```bash
enable 00:00:00
```

重启所有机器人：

```bash
refresh
```

输出所有机器人的日志：

```bash
show
```

停止所有机器人的运行：

```bash
shut
```

更新所有机器人：

```bash
upgrade
```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
