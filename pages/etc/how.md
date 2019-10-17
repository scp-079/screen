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

Note: To use NOPORN or RECHECK, follow the commands given by its `README.md`.

```bash
mkdir ~/scp-079
python3 -m venv ~/scp-079/venv
```

## Install modules

Install the required packages via pip, also see the `Requirements` section of the documentation `README.md` in the project source code.

## Set the systemd Service

```bash
mkdir -p ~/.config/systemd
git clone https://github.com/scp-079/units.git ~/.config/systemd/user
```

## Set the scripts

```bash
mkdir -p ~/scp-079/scripts
git clone https://github.com/scp-079/scripts.git ~/scp-079/scripts
chmod +x ~/scp-079/scripts/*.sh
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

## Enbale Services

```bash
bash ~/scp-079/scripts/enable.sh
start pm
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
