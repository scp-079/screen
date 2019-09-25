---
title: Suggestions
---

<button onmouseover="PlaySound('totop1')" onmouseout="StopSound('totop1')" onclick="window.location.href = '/suggestions-zh/';" class="zh">点此转至中文页面</button>

---

# Suggestions

## Use Public Services with Care

## Group bots

A bot with the `Ban users` permission can: Kick off all members of the group when you are not paying attention.

A bot with the `Delete messages` permission can: delete all messages in the group when you are not paying attention.

For security reasons, you should not use any group management bots that are not yours, or even you should not use the public demo services hosted by us. With third-party bots, in addition to possible damage to group members and messages, internal rules or models that the bot cannot be completely transparent to public can be suspected of misconduct. You should be aware that even if the bot's owner open the source code, it does not mean that the public service it is hosting is running this code, which means that its bot is entirely likely to have additional behaviors.

### Private Chat Bot

Needless to say, if you use a third-party hosted private chat bot, the content of your private conversations with other people will no longer be private, and the conversation will be completely transparent to the service custodian. This not only brings inconvenience, but also greatly increases the risk of privacy leakage and relationship disclosure.

## Build Your Own Bots

### WHY

As mentioned above, third-party bots are not controllable. And if you create and host your own bots based on the source code, this risk will be greatly reduced. You should not trust others, nor should you believe in us, but you can trust yourself to some extent.

### HOW TO

The SCP-079 Project provides [source code](/projects/), and detailed [instructions](/how/), as well as a [separate introduction](/tools/) to each bot project, according to which you can quickly build your own bot. If you have technical problems, you can also [contact us](/contact/).

### Protection

The basic security protections that your server needs to take include, but are not limited to: finding a trusted VPS service provider, changing the SSH default port, disabling the root user from logging in, disabling password login, logging in with a key, and requiring two-step authentication when logging in, opening the SSH port only, the VPS should be mainly used only to run SCP-079 bot programs, and upgrading or maintaining the system regularly.

### Privacy

Some of the channels required for SCP-079 bots to operate may have a risk of spreading user privacy, and it is recommended to carefully review the joining personnels.

### Management

You should invite some reliable friends as the service administrators. Or the entire service is managed by youself.

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
