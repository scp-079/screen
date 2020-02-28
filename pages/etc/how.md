---
title: Self Hosting Instructions
---

<button onmouseover="PlaySound('totop1')" onmouseout="StopSound('totop1')" onclick="window.location.href = '/how-zh/';" class="zh">点此转至中文页面</button>

---

# Self Hosting Instructions

The construction of SCP-079 series bots involves the creation of multiple channels, groups, bot accounts, and user accounts. The following is a description of the channels, groups, and accounts needed to build a complete instance. Of course, you can build only one or a few bots according to the required functions, and you can create channels, groups, etc. by referring to the [individual introduction pages](/tools/) of each bot.

The public channels required for a complete instance of this project are:

- SCP-079-CAPTCHA
- SCP-079-CONFIG
- SCP-079-CRITICAL
- SCP-079-DEBUG
- SCP-079-ERROR
- SCP-079-LOGGING

The private channels required for a complete instance of this project are:

- SCP-079-EXCHANGE
- SCP-079-HIDE
- SCP-079-M
- SCP-079-WATCH

The private groups required for a complete instance of this project are:

- SCP-079-CAPTCHA
- SCP-079-MANAGE
- SCP-079-REGEX
- SCP-079-TEST
- SCP-079-TICKET

The usual bots required for a complete instance of this project are:

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

The user bots required for the complete instances of this project are:

- SCP-079-AVATAR
- SCP-079-USER
- SCP-079-WATCH

> Among them, SCP-079-USER is the core of all bots working in the group. They all require SCP-079-USER to assist in the group

Please refer to the [separate introduction page](/tools/) of the corresponding bot for the specific requirements of the channel and group joining status of each bot. This article only takes the establishment of [SCP-079-PM](/pm/) (private chat bot) as an example to introduce the general steps required to build a SCP-079 series bot.

The system environment used in this example is:

- Debian 10
- Python 3.7.3
- The user name of the system is `scp` (please note the path issues affected by the user name, such as the path in the systemd unit file)

See also: [The Reason Why You Should Host Your Own Bots](/suggestions/)

---

## Upgrade the System

First, make sure the system environment is up to date, execute the following command:

```bash
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove -y
```

## Install Basic Packages

Install vim, git and other tools:

```bash
sudo apt install build-essential git python3-dev python3-venv vim -y
```

## Other Dependencies

Some projects require installation of additional packages. Be sure to check the description in each project's [individual page](/tools/).

## Create Virtual Environment

Bots can generally share the same virtual environment, and usually do not need to be created again.

Note: To use NOPORN or RECHECK, follow the commands given by its `README.md` or [individual page](/tools/).

```bash
mkdir ~/scp-079
python3 -m venv ~/scp-079/venv
```

---

## Set the systemd Service

Except for the need to update units, there is no need to repeat cloning next time to build other bots:

```bash
mkdir -p ~/.config/systemd
git clone https://github.com/scp-079/units.git ~/.config/systemd/user
```

## Set the scripts

Except for the need to update scripts, there is no need to repeat cloning next time to build other bots:

```bash
git clone https://github.com/scp-079/scripts.git ~/scp-079/scripts
```

## Set Convenient Commands

The next time you build another robot, you don’t need to repeat the settings:

```bash
vim ~/.bash_aliases
```

Add the following:

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

Let it take effect:

```bash
source ~/.bash_aliases
```

---

## Clone

For example, use `SCP-079-PM` and clone according to the [separate instruction](/pm/) of the project:

```bash
git clone https://github.com/scp-079/scp-079-pm.git ~/scp-079/pm
```

## Install Dependencies Using pip

```bash
scp-079    # Switch to virtual environment
pip install -r ~/scp-079/pm/requirements.txt
deactivate    # Exit the virtual environment
```

## Modify Configuration File

Modify the project's `config.ini` file as needed:

```bash
cp ~/scp-079/pm/config.ini.example ~/scp-079/pm/config.ini
config pm
```

You need to modify all the key values ​​in the `config.ini` file with the content `[DATA EXPUNGED]`. The meaning of the parameters in the `config.ini` file can be viewed in the [separate instruction](/pm/)'s `Document #config.ini`.

Note: Some bots need to fill in the `key` value in `[encrypt]`. The entire project uses the same key. It needs to be generated by the program. Get the key as follows:

```bash
python3
```

```python3
from cryptography.fernet import Fernet
key = Fernet.generate_key()
print(key.decode())    # Then copy the printed key and fill it into the config.ini file
```

## Additional Actions to Take

Some bots may require additional changes, such as changes to the environment, downloading required models, adding custom files, and more. Please refer to the description in the section of  `Appendix: Steps to Create a Bot On Your Own` in [individual introduction pages](/tools/) of each bot.

---

## Enbale Services

For ordinary bots, such as SCP-079-PM in this article, services can be started directly:

```bash
bash ~/scp-079/scripts/enable.sh
start pm
```

For user bot with user account, you need to log in first (take SCP-079-USER as an example):

```bash
scp-079    # Switch to virtual environment
cd ~/scp-079/user
python main.py    # Start the program temporarily
```

At this time, you will be prompted to log in to the account, and you can do as required. Note that there is no space or symbol in the middle of the mobile phone number input, and the front plus sign is omitted. If the login is successful, press Ctrl + C to exit the program, and then start the service:

```bash
deactivate    # Exit the virtual environment
bash ~/scp-079/scripts/enable.sh
start user
```

---

## Convenient Command Usage

Configure the bot:

```bash
config pm
```

View the bot log:

```bash
log pm
```

Restart the bot:

```bash
start pm
```

Stop the bot:

```bash
stop pm
```

Force the bot to restart:

```bash
restart pm
```

View the bot systemd service status:

```bash
status pm
```

Update the bot:

```bash
update pm
```

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
