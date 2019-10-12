---
title: Self Hosting Instructions
---

<button onmouseover="PlaySound('totop1')" onmouseout="StopSound('totop1')" onclick="window.location.href = '/how-zh/';" class="zh">点此转至中文页面</button>

---

# Self Hosting Instructions

This article takes SCP-079-PM as an example to show how to build your own SCP-079 series bots. The environment used in the article is Debian 10, Python 3.7.3, and the user name of the system is `scp`.

See also: [The Reason Why You Should Host Your Own Bots](/suggestions/)

## Upgrade the System

```bash
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove -y
```

## Install Dependencies

```bash
sudo apt install build-essential git python3-dev python3-venv vim -y
```

## Other Dependencies

Some projects require installation of additional packages. Be sure to check the `Requirements` section of the documentation `README.md` in the project source code.

## Create Virtual Environment

Note: To use NOPORN, follow the commands given by its `README.md`.

```bash
mkdir ~/scp-079
python3 -m venv ~/scp-079/venv
```

## Install modules

Install the required packages via pip, also see the `Requirements` section of the documentation `README.md` in the project source code.

## Clone

For example, use `SCP-079-PM` and clone according to the [Separate Instructions](/pm/) of the project:

```bash
git clone https://github.com/scp-079/scp-079-pm.git ~/scp-079/pm
```

## Modify Configuration File

Modify the project's `config.ini` file as needed:

```bash
cp ~/scp-079/pm/config.ini.example ~/scp-079/pm/config.ini
vim ~/scp-079/pm/config.ini
```

The meaning of the parameters in the `config.ini` file can be viewed in the [Separate Instructions](/pm/).

## Set the systemd Service

```bash
mkdir -p ~/.config/systemd/user
```

Create a new file:

```bash
vim ~/.config/systemd/user/pm.service
```

Add the following:

```bash
[Unit]
Description=SCP-079-PM Telegram Bot Service
After=default.target

[Service]
WorkingDirectory=/home/scp/scp-079/pm
ExecStart=/home/scp/scp-079/venv/bin/python main.py
Restart=on-abort

[Install]
WantedBy=default.target
```

Enable and start the service:

```bash
systemctl --user enable pm
systemctl --user start pm
```

## Set a Scheduled Restart

```bash
vim ~/.config/systemd/user/restart.service
```

Add the following:

```bash
[Unit]
Description=SCP-079 Schedule Restart Service

[Service]
Type=oneshot
ExecStart=/bin/bash /home/scp/scp-079/scripts/schedule.sh
```

Create a new file:

```bash
vim ~/.config/systemd/user/restart.timer
```

Add the following:

```bash
[Unit]
Description=SCP-079 Reboot

[Timer]
OnCalendar=*-*-* 00:00:00

[Install]
WantedBy=timers.target
```

Write a restart script:

```bash
mkdir ~/scp-079/scripts
vim ~/scp-079/scripts/schedule.sh
```

Add the following:

```bash
#!/bin/bash

for bot in $(ls ~/scp-079); do
  if [ "$bot" != "scripts" ] && [ "$bot" != "venv" ]; then
    systemctl --user restart $bot
  fi
done 
```

Give execute permission:

```bash
chmod +x ~/scp-079/scripts/schedule.sh
```

Enable and start the service:

```bash
systemctl --user enable restart.timer
systemctl --user start restart.timer
```

## Set Convenient Commands

```bash
vim ~/.bash_aliases
```

Add the following:

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

Let it take effect:

```bash
source ~/.bash_aliases
```

## Write a Script Corresponding to the Convenient Command

### config

```bash
vim ~/scp-079/scripts/config.sh
```

Add the following:

```bash
#!/bin/bash

if [ $# -eq 1 ]; then
	bot=$1
else
	read -p "Choose a bot: " bot
fi

cd ~/scp-079/$bot

vim config.ini
```

### log

```bash
vim ~/scp-079/scripts/log.sh
```

Add the following:

```bash
#!/bin/bash

if [ $# -eq 1 ]; then
	bot=$1
else
	read -p "Choose a bot: " bot
fi

cd ~/scp-079/$bot

less log
```

### restart

```bash
vim ~/scp-079/scripts/restart.sh
```

Add the following:

```bash
#!/bin/bash

if [ $# -eq 1 ]; then
	bot=$1
else
	read -p "Choose a bot: " bot
fi

systemctl --user kill -s SIGKILL $bot
```

### start

```bash
vim ~/scp-079/scripts/start.sh
```

Add the following:

```bash
#!/bin/bash

if [ $# -eq 1 ]; then
	bot=$1
else
	read -p "Choose a bot: " bot
fi

systemctl --user restart $bot
```

### status

```bash
vim ~/scp-079/scripts/status.sh
```

Add the following:

```bash
#!/bin/bash

if [ $# -eq 1 ]; then
	bot=$1
else
	read -p "Choose a bot: " bot
fi

systemctl --user status $bot
```

### stop

```bash
vim ~/scp-079/scripts/stop.sh
```

Add the following:

```bash
#!/bin/bash

if [ $# -eq 1 ]; then
	bot=$1
else
	read -p "Choose a bot: " bot
fi

systemctl --user stop $bot
```

### update

```bash
vim ~/scp-079/scripts/update.sh
```

Add the following:

```bash
#!/bin/bash

echo -e "\n\033[0;32mUpdating the bot...\033[0m\n"

if [ $# -eq 1 ]; then
	bot=$1
else
	read -p "Choose a bot: " bot
fi

cd ~/scp-079/$bot

git pull

if [ "$bot" = "recheck" ]; then
	eval "$(conda shell.bash hook)"
  conda activate scp-079
	pip install -r requirements.txt
	conda deactivate
else
	source ~/scp-079/venv/bin/activate
	pip install -r requirements.txt
	deactivate
fi

systemctl --user restart $bot

echo -e "\n\033[0;32mBot ${bot^^} Updated!\033[0m\n"
```

### Give Execute Permission

```bash
chmod +x ~/scp-079/scripts/*.sh
```

## Convenient Command Usage

Configure the bot:

```bash
config pm
```

View the bot log:

```bash
log pm
```

Force the bot to restart:

```bash
restart pm
```

Restart the bot:

```bash
start pm
```

Stop the bot:

```bash
stop pm
```

View the bot service status:

```bash
status pm
```

Update the bot:

```bash
update pm
```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
