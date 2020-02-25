---
title: README
---

<link rel="stylesheet" href="/css/chinese.css">

# SCP-079-README

[![CC BY-SA 4.0][cc-by-sa-shield]][cc-by-sa]

## 简介

本项目提供免费并开源的群组管理机器人，可提供的服务有：

1. 防刷屏
2. 防色情
3. 入群验证
4. 自动防广告
5. 过滤特定语言
6. 防推广（过滤特定类别消息）
7. 群员警告管理（`/warn` 、`/ban`、`/kick`、`/report`、`@admin`）

入群欢迎消息，自定义关键词回复，群组绑定专用入群频道（频道中的群组链接定时刷新）等等。

机器人功能的自由定制度高，可全方位协助管理群组。

## 机器人目录

以下是项目所拥有的机器人列表，群组可以根据自己的需要酌情选用。

注意，群组管理性质的机器人均不会响应任何私聊，所有设置指令均在群组中进行。

有任何疑问请至讨论群 [\@SCP_079_CHAT](https://t.me/SCP_079_CHAT) 提出。

**\*加粗**为必选项

| 名称              | 介绍                                        |
| ----------------- | ------------------------------------------- |
| **SCP-079-USER**  | 集中控制如何对待黑名单用户                  |
| SCP-079-TIP       | 发送入群欢迎消息                            |
| SCP-079-WARN      | 根据群管理的命令警告、封禁、或踢出用户      |
| SCP-079-CLEAN     | 根据群组的设置过滤特定类型的消息            |
| SCP-079-NOSPAM    | 自动封禁广告用户，自动删除广告消息          |
| SCP-079-CAPTCHA **\***  | 提供对新入群用户的验证审核                  |
| ----------------- | ------------------------------------------- |
| SCP-079-LANG      | 可通过本 Bot 删除中东地区使用的语言消息     |
| SCP-079-LONG      | 可通过本 Bot 删除超长消息                   |
| SCP-079-NOFLOOD   | 可通过本 Bot 更加灵活的控制消息发送频率     |
| SCP-079-NOPORN    | 可自动删除包含色情画面的媒体消息            |
| SCP-079-RECHECK   | 对媒体进行严格的色情检查                    |

具体详情请参阅：[bots.md](bots.md)

1. **\* 根据目前的观测结果表明，炸群期间有很多昵称中包含 中东语言 的成员加入**
<br>作为运营建议，建议在引入 SCP-079-CAPTCHA 的同时引入 SCP-079-LANG 和 SCP-079-NOSPAM

## 申请条件

本项目拒绝受理申请的群组范围有：

1. 不约束群员互相辱骂、人身攻击的群组
2. 刚刚建立的群组（或群员不超过 100 人）
3. 以 NSFW 内容为主导的群组（NSFW = Not Safe for Work）
4. 以黑产、灰产、广告、博彩、招聘求职、个人信息曝光为主要话题的群组
5. 东南亚地区的本地群组
6. 具有较为活跃政治话题讨论的群组，除非该群组能够保证有效地约束群员互相辱骂、人身攻击的行为

> 对于 5、6 我们虽然拒绝受理，但如果对方希望自行搭建 SCP-079 实例且有长期运营计划，
>
> 那么我方可以提供帮助搭建 SCP-079 实例，且提供有限度的技术支持或指导意见。

## 申请方法

欢迎群组使用本项目机器人，为保证我们的公开服务质量，我们秉承 [双向选择原则](https://scp-079.org/principles-zh/) ，采取申请制，您需要主动申请使用机器人，并且您的使用申请需要通过审核，是否通过审核由 SCP-079 项目管理员共同判断决定。

1. 点击查看 [机器人目录](#机器人目录)，了解各个机器人的功能，决定自己的群组需要哪些机器人。
2. 点击加入讨论群 [\@SCP_079_CHAT](https://t.me/SCP_079_CHAT)。
<br>在加入的讨论群里，说明自己的群组需要什么功能的机器人，并发送自己的群组链接（请确保您的群组为 supergroup）。
<br>管理员审核通过后会令 [\@SCP_079_USER_BOT](https://t.me/SCP_079_USER_BOT) 加入您的群组。
<br>或者，申请者也可以选择自行添加 [\@SCP_079_USER_BOT](https://t.me/SCP_079_USER_BOT)，
<br>[点击查看如何自行拉入 USER](https://telegra.ph/SCP-079-USER-JOIN-12-04)。
3. 当 [\@SCP_079_USER_BOT](https://t.me/SCP_079_USER_BOT) 加入了自己的群组后，群主需要提升其为管理员并 *赋予如下图所示的这五项权限* （[为什么？](https://telegra.ph/SCP-079-USER-12-04#%E9%97%AE%E4%B8%8E%E7%AD%94)）
<br>![](/images/user-settings.jpg)
4. 权限赋予齐全后，请在讨论群内告知项目管理员，之后 [\@SCP_079_USER_BOT](https://t.me/SCP_079_USER_BOT) 会为您拉入您所申请的机器人。至此，申请流程已成功，群组可正常使用各机器人。
5. 建议申请者在群组置顶，或群组简介里说明机器人申诉方式 —— [\@SCP_079_USER_BOT](https://t.me/SCP_079_USER_BOT)，防止有群员被本项目 demo 服务误封而无处申诉，请至少确保群组管理员们知晓此申诉方式。
6. 建议关注 [\@SCP_079_INFO](https://t.me/SCP_079_INFO) 频道以获取本项目的重要公告 。

## 透明度

| 类型     | 频道                                             |
| -------- | ------------------------------------------------ |
| 公告频道 | [\@SCP_079_INFO](https://t.me/SCP_079_INFO)       |
| 操作记录 | [\@SCP_079_DEBUG](https://t.me/SCP_079_DEBUG)     |
| 错误记录 | [\@SCP_079_ERROR](https://t.me/SCP_079_ERROR)     |
| 证据存放 | [\@SCP_079_LOGGING](https://t.me/SCP_079_LOGGING) |

## 隐私政策

本项目尊重并保护所有使用服务用户及群组的隐私权。本项目将以高度的勤勉、审慎义务对待用户和群组信息。我们收集某些信息是为了获得维持机器人运行所需的基础数据。本项目不会保存，更不会向任何第三方提供、出售、出租、分享或交易您涉及隐私的数据。本项目收集的有关群组和用户的信息和资料将保存在本项目的服务器上，直接涉及具体用户的数据将自动地在每月全部清空。您在提升本项目机器人为管理员之时，即视为您已经同意本隐私权政策全部内容。本项目之代码完全遵循此政策，您可以随时审查我们的源代码：<https://github.com/scp-079/>。

本项目组将于 [\@SCP_079_LOGGING](https://t.me/SCP_079_LOGGING)、[\@SCP_079_DEBUG](https://t.me/SCP_079_DEBUG)、[\@SCP_079_CONFIG](https://t.me/SCP_079_CONFIG) 公开记录本项目组所有机器人的自动操作记录及触发机器人自动操作的消息(部分内容因涉及隐私而不记录) ，和群组管理员对本项目组机器人的操作、配置记录。

本项目组将于 [\@SCP_079_ERROR](https://t.me/SCP_079_ERROR) 记录本项目组机器人的错误的自动操作记录及触发错误的消息。上述频道中的记录如涉及您的隐私，您有权联系 [\@SCP_079_TICKET](https://t.me/SCP_079_TICKET_BOT) 要求删除。

## 免责声明

本项目无法承诺识别出所有的 SPAM、NSFW 及其他符合本项目执行标准的消息，也无法承诺不产生任何错误的处理操作。使用本项目的服务所带来的损失或可能产生的任何责任由申请者自行承担。
本项目的demo服务不能完全代替群组管理员，群组管理员仍需对群组保持一定程度的关注。

## 终止服务

申请者及其群组中相关管理员有权在任意时间移除本项目组相关机器人，终止使用本项目组所提供的服务。本项目组也保留终止为某群组提供服务的权力。

## 执行标准

\**申请使用本项目组 USER 、 CAPTCHA 、 TIP 以外的机器人必读*

提升本项目组 USER 、 CAPTCHA 、 TIP 以外的机器人为群组管理员之时，则视为您已充分了解、理解本项目的执行标准。
本项目组最新版本执行标准请 [查阅此处](rule.md)。

## 联系我们

如您需要对本项目组 demo 服务误判进行申诉，或需要私聊提供建议等，请联系：[\@SCP_079_TICKET_BOT](https://t.me/SCP_079_TICKET_BOT)。

需要帮助？[点击查看申诉及建议方法](https://telegra.ph/SCP-079-TICKET-12-05)

## 招募

我们在征集义士，来作为项目组管理员，协助管理本项目组机器人。

如您有意向参与，请联系：[\@SCP_079_PM_BOT](https://t.me/SCP_079_PM_BOT)

## 自建机器人

我们鼓励用户通过源代码 (<https://github.com/scp-079/>) 进行机器人的私有部署。

对于选择自行搭建 SCP-079 实例的用户，我们通常情况下可予以提供帮助，但需要先明确陈述搭建 SCP-079 实例的动机、缘由、未来安排等细节。

---

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

本项目相关文档采用 [知识共享署名-相同方式共享 4.0 国际许可协议][cc-by-sa] 进行许可。

[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg