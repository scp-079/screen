---
title: SCP-079-TIP
---

<link rel="stylesheet" href="/css/chinese.css">
<button onmouseover="PlaySound('totop1')" onmouseout="StopSound('totop1')" onclick="window.location.href = '/tip-en/';" class="en">Click Here to English Page</button>

---

**项目编号：**SCP-079-TIP

**项目等级：**Safe

---

**特殊收容措施：**SCP-079-TIP 建议在 Debian 系统下运行。Python 3.6 及以上版本可以使用 SCP-079-TIP。务必要注意，其只能通过 SCP-079-USER 邀请入群，并由其赋予管理权限，如果有任何未授权的恶意使用，将可能给其他机器人的工作带来影响。

---

**描述：**SCP-079-TIP 是一个用于提供入群欢迎、离题提醒、关键词回复、取消或保持频道置顶消息、绑定入群频道功能的机器人，其项目开源于 [GitHub](https://github.com/scp-079/scp-079-tip)。Demo 机器人本体位于 <a href="https://t.me/SCP_079_TIP_BOT" class="079" target="_blank">SCP-079-TIP</a>，仅供授权的群组使用。

- 所有自定义的回复消息，均可设置多个包含链接的按钮。
- 所有回复消息，都默认采取定时回收机制，不干扰群组内消息流。
- 可发送自定义的入群欢迎消息，并默认只在用户通过 CAPTCHA 入群验证后才发送欢迎消息。
- 群组可自定义多个关键词回复。
- 具体关键词的回复可单独自定义触发时采取的操作，例如：仅发送预设回复消息、删除原消息、移除用户、禁言用户（可自定义时长）、封禁用户（可自定义时长）。
- 具体关键词的回复可单独自定义何人可触发，例如：普通成员、管理员、所有人。
- 具体关键词的回复可单独自定义判断触发的多种模式，例如：包含匹配、全匹配、大小写敏感、仅对媒体消息的附文触发、仅对用户名和转发来源名触发、过滤名称内干扰符号、仅对转发的消息触发、使用正则匹配模式。
- 具体关键词的回复可单独自定义销毁时间。
- 支持用户点击消息按钮后，机器人自动发送群组预设消息。
- 对于自定义关键词，将保留触发的统计数据以供查询。
- 采取频率限制机制，避免关键词被群员试探大量触发而造成刷屏。
- 保持或取消群组内的置顶。
- 自定义离题警告。
- 自定义判断并触发 RM 笑话警告。
- 可设置群组绑定公开频道，在其中提供定时刷新的私有群组的入群链接。

---

**附录：**[使用手册](https://manuals.scp-079.org/bots/tip/)

---

**附录：**[自建文档](https://docs.scp-079.org/bots/tip/)

<audio src="/audio/door/dooropenpage.ogg" autoplay></audio>
<audio id="dooropen079" src="/audio/door/dooropen079.ogg"/>
