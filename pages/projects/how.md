---
title: How to setup
---

<link rel="stylesheet" href="/css/chinese.css">

# 自建说明书

这篇文章以建立 SCP-079-REGEX 为例，用于介绍如何自建 SCP-079 机器人。文章所用环境为 Ubuntu 18.04 ，Python 3.6.7 ，用户名为 `ubuntu`

## 更新软件库

```bash
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove -y
```

## 安装依赖

```bash
sudo apt install build-essential git python3-dev vim virtualenv -y
```

## 根据项目的说明安装依赖

有些项目需要额外安装其他软件包，请查看项目的说明文件 `README.md` 中 `Requirements.txt` 一节

## 创建虚拟环境

```bash
mkdir -p ~/bots
cd ~/bots
virtualenv -p python3 scp-079 # 如需使用 NOPORN，请根据其 README.md 的命令操作
```

## 克隆某个项目

例如，使用 `SCP-079-REGEX` ，根据项目中的[单独使用说明](/regex/)克隆：

```bash
git clone https://github.com/scp-079/scp-079-regex.git ~/bots/scp-079/regex
```

## 更改配置文件

根据需要修改项目的 `config.ini` 文件：

```bash
cp ~/bots/scp-079/regex/config.ini.example ~/bots/scp-079/regex/config.ini
vim ~/bots/scp-079/regex/config.ini
```

## 设置便捷命令

```bash
vim ~/.bash_aliases
```

添加如下内容：

```bash
alias scp-079-regex-log="less ~/bots/scp-079/regex/log"
alias scp-079-regex-restart="systemctl --user kill -s SIGKILL scp-079-regex"
alias scp-079-regex-status="systemctl --user status scp-079-regex"
alias scp-079-regex-start="systemctl --user restart scp-079-regex"
alias scp-079-regex-stop="systemctl --user stop scp-079-regex"
alias scp-079-regex-update="~/bots/scp-079/regex/update.sh"
```

令其生效：

```bash
source ~/.bash_aliases
```

## 编写更新脚本

```bash
vim ~/bots/scp-079/regex/update.sh
```

添加如下内容：

```bash
#!/bin/bash

cd ~/bots/scp-079/regex
git pull
source ../bin/activate
pip install -r requirements.txt
deactivate
systemctl --user restart scp-079-regex
echo -e "\n\033[0;32mSCP-079-REGEX Updated!\033[0m\n"
```

给予执行权限：

```bash
chmod +x ~/bots/scp-079/regex/update.sh
```

## 设置 systemd 服务

```bash
mkdir -p ~/.config/systemd/user
```

新建文件：

```bash
vim ~/.config/systemd/user/scp-079-regex.service
```

添加如下内容：

```bash
[Unit]
Description=SCP-079-REGEX Telegram Bot Service
After=default.target

[Service]
WorkingDirectory=/home/ubuntu/bots/scp-079/regex
ExecStart=/home/ubuntu/bots/scp-079/bin/python main.py
Restart=on-abort

[Install]
WantedBy=default.target
```

启用项目：

```bash
systemctl --user enable scp-079-regex
```

## 设置定时重启

```bash
vim ~/.config/systemd/user/scp-079-restart.service
```

添加如下内容：

```bash
[Unit]
Description=SCP-079 Restart Service

[Service]
Type=oneshot
ExecStart=/bin/bash /home/ubuntu/bots/scp-079/restart.sh
```

继续新建文件：

```bash
vim ~/.config/systemd/user/scp-079-restart.timer
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
vim ~/bots/scp-079/restart.sh
```

添加如下内容：

```bash
#!/bin/bash

systemctl --user restart scp-079-regex
```

给予执行权限：

```bash
chmod +x ~/bots/scp-079/restart.sh
```

启用服务：

```bash
systemctl --user enable scp-079-restart.timer
systemctl --user start scp-079-restart.timer
```

## 启用机器人

```bash
scp-079-regex-update
```

查看机器人服务状态：

```bash
scp-079-regex-status
```

查看机器人日志：

```bash
scp-079-regex-log
```

重启机器人：

```bash
scp-079-regex-start
```

停止机器人：

```bash
scp-079-regex-stop
```

强制重启机器人：

```bash
scp-079-regex-restart
```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
