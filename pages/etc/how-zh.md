---
title: Self Hosting Instructions
---

<link rel="stylesheet" href="/css/chinese.css">
<button onmouseover="PlaySound('totop1')" onmouseout="StopSound('totop1')" onclick="window.location.href = '/how/';" class="en">Click Here to English Page</button>

---

# 自建说明书

SCP-079 系列机器人的搭建涉及多个频道、群组、机器人帐号、用户帐号的创建，具体要求请参见各机器人[单独的介绍页面](/tools/)，这篇文章仅以建立 [SCP-079-PM](/pm-zh/) （私聊转发机器人）为例，用于介绍自建 SCP-079 系列机器人所需的通用步骤。

此文示例所用的环境为：

- Debian 10
- Python 3.7.3
- 系统的用户名为 `scp` （请注意用户名涉及到的路径问题，例如 systemd unit 文件中的路径）

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

## 其他软件包

有些项目需要额外安装其他软件包，请务必查阅各项目[单独页面](/tools/)中的描述。

## 创建虚拟环境

机器人一般可共用同一个虚拟环境，通常情况下无需额外创建。

注意：如需使用 NOPORN 或 RECHECK ，请单独根据其源代码中 `README.md` 或[单独页面](/tools/)中所给出的命令操作。

```bash
mkdir ~/scp-079
python3 -m venv ~/scp-079/venv
```

---

## 设置 systemd 服务

除有更新 units 的必要，下次搭建其他机器人无需重复克隆：

```bash
mkdir -p ~/.config/systemd
git clone https://github.com/scp-079/units.git ~/.config/systemd/user
```

## 配置脚本

除有更新 scripts 的必要，下次搭建其他机器人无需重复克隆：

```bash
git clone https://github.com/scp-079/scripts.git ~/scp-079/scripts
```

## 设置便捷命令

下次搭建其他机器人无需重复设置：

```bash
vim ~/.bash_aliases
```

添加如下内容：

```bash
alias scp-079="source ~/scp-079/venv/bin/activate"
alias config="bash ~/scp-079/scripts/config.sh"
alias log="bash ~/scp-079/scripts/log.sh"
alias restart="bash ~/scp-079/scripts/restart.sh"
alias status="bash ~/scp-079/scripts/status.sh"
alias start="bash ~/scp-079/scripts/start.sh"
alias stop="bash ~/scp-079/scripts/stop.sh"
alias update="bash ~/scp-079/scripts/update.sh"
```

令其生效：

```bash
source ~/.bash_aliases
```

---

## 克隆某个项目

例如，使用 `SCP-079-PM` ，根据项目中的[单独使用说明](/pm-zh/)提供的地址克隆：

```bash
git clone https://github.com/scp-079/scp-079-pm.git ~/scp-079/pm
```

## 使用 pip 安装依赖

```bash
scp-079    # 切换到虚拟环境
pip install -r ~/scp-079/pm/requirements.txt
deactivate    # 退出虚拟环境
```

## 更改配置文件

根据需要修改项目的 `config.ini` 文件：

```bash
cp ~/scp-079/pm/config.ini.example ~/scp-079/pm/config.ini
config pm
```

需要对 `config.ini` 文件中内容为 `[DATA EXPUNGED]` 的全部键值进行修改，`config.ini` 文件中参数代表的含义，可在各机器人的[单独使用说明](/pm-zh/)中`文件#config.ini`一节查看。

注意：部分机器人需要在 `[encrypt]` 中填写 `key` 值，整体项目统一使用相同的 `key`，其需要通过程序生成，获取方式如下：

```bash
python3
```

```python3
from cryptography.fernet import Fernet
key = Fernet.generate_key()
print(key.decode())    # 接着复制打印出的 key，填写至 config.ini 文件中
```

## 需采取的额外操作

有些机器人可能需要一些额外的更改，例如对环境的更改、下载所需模型、添加自定义文件等。请参照[各项目单独使用说明](/tools/)中 `附录：自建机器人的方法` 一节的说明。

---

## 启用机器人服务

对于常规普通机器人，比如本文的 SCP-079-PM，可直接启动服务：

```bash
bash ~/scp-079/scripts/enable.sh
start pm
```

对于使用普通用户帐号的 User Bot，则需先进行登录操作（以 SCP-079-USER 为例）：

```bash
scp-079    # 切换到虚拟环境
cd ~/scp-079/user
python main.py    # 临时启动程序
```

此时，将提示登录帐号，按要求操作即可，注意手机号输入时中间无空格、符号，省略最前方的加号。如登录成功，则按 Ctrl + C 退出程序，接着，启动服务：

```bash
deactivate    # 退出虚拟环境
bash ~/scp-079/scripts/enable.sh
start user
```

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

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
