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
sudo apt install build-essential git python3-dev vim virtualenv -y
```

## 其他依赖

有些项目需要额外安装其他软件包，请务必查阅项目源代码中的说明文件 `README.md` 的 `Requirements` 一节。

## 创建虚拟环境

注意：如需使用 NOPORN，请根据其 `README.md` 所给出的命令操作。

```bash
cd ~
virtualenv -p python3 scp-079
```

## 环境配置

通过 pip 安装所需要的包，也请查看项目源代码中的说明文件 `README.md` 的 `Requirements` 一节。

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

## 设置 systemd 服务

```bash
mkdir -p ~/.config/systemd/user
```

新建文件：

```bash
vim ~/.config/systemd/user/pm.service
```

添加如下内容：

```bash
[Unit]
Description=SCP-079-PM Telegram Bot Service
After=default.target

[Service]
WorkingDirectory=/home/scp/scp-079/pm
ExecStart=/home/scp/scp-079/bin/python main.py
Restart=on-abort

[Install]
WantedBy=default.target
```

启用项目：

```bash
systemctl --user enable pm
systemctl --user start pm
```

## 设置定时重启

```bash
vim ~/.config/systemd/user/restart.service
```

添加如下内容：

```bash
[Unit]
Description=SCP-079 Schedule Restart Service

[Service]
Type=oneshot
ExecStart=/bin/bash /home/scp/scp-079/.schedule.sh
```

继续新建文件：

```bash
vim ~/.config/systemd/user/restart.timer
```

添加如下内容：

```bash
[Unit]
Description=SCP-079 Reboot

[Timer]
OnCalendar=*-*-* 00:00:00

[Install]
WantedBy=timers.target
```

编写重启脚本：

```bash
vim ~/scp-079/.schedule.sh
```

添加如下内容：

```bash
#!/bin/bash

systemctl --user restart pm
```

给予执行权限：

```bash
chmod +x ~/scp-079/.schedule.sh
```

启用服务：

```bash
systemctl --user enable restart.timer
systemctl --user start restart.timer
```

## 设置便捷命令

```bash
vim ~/.bash_aliases
```

添加如下内容：

```bash
alias scp="deactivate"
alias scp-079="source ~/scp-079/bin/activate"

alias config="~/scp-079/.config.sh"
alias log="~/scp-079/.log.sh"
alias restart="~/scp-079/.restart.sh"
alias status="~/scp-079/.status.sh"
alias start="~/scp-079/.start.sh"
alias stop="~/scp-079/.stop.sh"
alias update="~/scp-079/.update.sh"
```

令其生效：

```bash
source ~/.bash_aliases
```

## 编写便捷命令对应的脚本

### config

```bash
vim ~/bots/scp-079/.config.sh
```

添加如下内容：

```bash
#!/bin/bash

if [ $# -eq 1 ];then
	bot=$1
else
	read -p "Choose a bot: " bot
fi

cd ~/scp-079/$bot

vim config.ini
```

给予执行权限：

```bash
chmod +x ~/scp-079/.config.sh
```

### log

```bash
vim ~/bots/scp-079/.log.sh
```

添加如下内容：

```bash
#!/bin/bash

if [ $# -eq 1 ];then
	bot=$1
else
	read -p "Choose a bot: " bot
fi

cd ~/scp-079/$bot

less log
```

给予执行权限：

```bash
chmod +x ~/scp-079/.log.sh
```

### restart

```bash
vim ~/bots/scp-079/.restart.sh
```

添加如下内容：

```bash
#!/bin/bash

if [ $# -eq 1 ];then
	bot=$1
else
	read -p "Choose a bot: " bot
fi

systemctl --user kill -s SIGKILL $bot
```

给予执行权限：

```bash
chmod +x ~/scp-079/.restart.sh
```

### start

```bash
vim ~/bots/scp-079/.start.sh
```

添加如下内容：

```bash
#!/bin/bash

if [ $# -eq 1 ];then
	bot=$1
else
	read -p "Choose a bot: " bot
fi

systemctl --user restart $bot
```

给予执行权限：

```bash
chmod +x ~/scp-079/.start.sh
```

### status

```bash
vim ~/bots/scp-079/.status.sh
```

添加如下内容：

```bash
#!/bin/bash

if [ $# -eq 1 ];then
	bot=$1
else
	read -p "Choose a bot: " bot
fi

systemctl --user status $bot
```

给予执行权限：

```bash
chmod +x ~/scp-079/.status.sh
```

### stop

```bash
vim ~/bots/scp-079/.stop.sh
```

添加如下内容：

```bash
#!/bin/bash

if [ $# -eq 1 ];then
	bot=$1
else
	read -p "Choose a bot: " bot
fi

systemctl --user stop $bot
```

给予执行权限：

```bash
chmod +x ~/scp-079/.stop.sh
```

### update

```bash
vim ~/bots/scp-079/.update.sh
```

添加如下内容：

```bash
#!/bin/bash

echo -e "\n\033[0;32mUpdating the bot...\033[0m\n"

if [ $# -eq 1 ];then
	bot=$1
else
	read -p "Choose a bot: " bot
fi

cd ~/scp-079/$bot

git pull
source ../bin/activate
pip install -r requirements.txt
deactivate
systemctl --user restart $bot

echo -e "\n\033[0;32mBot $bot Updated!\033[0m\n"
```

给予执行权限：

```bash
chmod +x ~/scp-079/.update.sh
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

更新机器人

```bash
update pm
```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
