---
title: Self Hosting Instructions
---

<button onmouseover="PlaySound('totop1')" onmouseout="StopSound('totop1')" onclick="window.location.href = '/how/';" class="en">Click Here to English Page</button>

---

<link rel="stylesheet" href="/css/chinese.css">

# 自建说明书

这篇文章以建立 SCP-079-PM 为例，用于介绍如何自建 SCP-079 系列机器人。文章所用环境为 Debian 10 ，Python 3.7.3 ，系统的用户名为 `scp` 。

另见：[为什么你应该自行建立机器人](/suggestions-zh/)

## 更新系统

```bash
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove -y
```

## 安装依赖

```bash
sudo apt install build-essential git python3-dev python3-venv vim -y
```

## 其他依赖

有些项目需要额外安装其他软件包，请务必查阅项目源代码中的说明文件 `README.md` 的 `Requirements` 一节。

## 创建虚拟环境

注意：如需使用 NOPORN 或 RECHECK ，请单独根据其 `README.md` 所给出的命令操作。

```bash
mkdir ~/scp-079
python3 -m venv ~/scp-079/venv
```

## 环境配置

通过 pip 安装所需要的包，也请查看项目源代码中的说明文件 `README.md` 的 `Requirements` 一节。

## 设置 systemd 服务

```bash
mkdir -p ~/.config/systemd
git clone https://github.com/scp-079/units.git ~/.config/systemd/user
```

## 配置脚本

mkdir -p ~/scp-079/scripts
git clone https://github.com/scp-079/scripts.git ~/scp-079/scripts
chmod +x ~/scp-079/scripts/*.sh

## 设置便捷命令

```bash
vim ~/.bash_aliases
```

添加如下内容：

```bash
alias scp="deactivate"
alias scp-079="source ~/scp-079/venv/bin/activate"

alias config="~/scp-079/scripts/config.sh"
alias log="~/scp-079/scripts/log.sh"
alias restart="~/scp-079/scripts/restart.sh"
alias status="~/scp-079/scripts/status.sh"
alias start="~/scp-079/scripts/start.sh"
alias stop="~/scp-079/scripts/stop.sh"
alias update="~/scp-079/scripts/update.sh"
```

令其生效：

```bash
source ~/.bash_aliases
```

## 克隆某个项目

例如，使用 `SCP-079-PM` ，根据项目中的[单独使用说明](/pm-zh/)克隆：

```bash
git clone https://github.com/scp-079/scp-079-pm.git ~/scp-079/pm
```

## 更改配置文件

根据需要修改项目的 `config.ini` 文件：

```bash
cp ~/scp-079/pm/config.ini.example ~/scp-079/pm/config.ini
vim ~/scp-079/pm/config.ini
```

`config.ini` 文件中参数代表的含义，可在[单独使用说明](/pm-zh/)中查看。

## 启用机器人服务

```bash
bash ~/scp-079/scripts/enable.sh
start pm
```

## 便捷命令使用方法

配置机器人：

```bash
config pm
```

查看机器人日志：

```bash
log pm
```

强制重启机器人：

```bash
restart pm
```

重启机器人：

```bash
start pm
```

停止机器人：

```bash
stop pm
```

查看机器人服务状态：

```bash
status pm
```

更新机器人：

```bash
update pm
```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
