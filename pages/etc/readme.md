---
title: README
---

<link rel="stylesheet" href="/css/chinese.css">

# README

[![CC BY-SA 4.0][cc-by-sa-shield]][cc-by-sa]

<p style="font-family: vt323, monospace; font-size: 20px;">This article mainly introduces the related details and application procedures of the demonstration bots hosted by this project. The demonstration bots are only for Chinese users, so this article will not provide an English version. It is recommended that you <a href="../how/">create your own bots</a> from source code.</p>

---

## 简介

本项目提供免费并开源的群组管理机器人，可提供的服务有：

1. 阻止消息刷屏
2. 防色情
3. 入群验证（可避免验证码刷屏，可自动免验证）
4. 自动防广告（可检查消息内容、消息链接预览、头像、昵称、简介中的广告）
5. 过滤指定语言的消息（可选多种语言）；过滤长度过大的消息
6. 定时清理 Delete Account；定时清理群组中的贴纸和动图
7. 管理员通过命令指定集中删除某范围内的消息；群员自助删除自己发送的所有消息
8. 过滤指定类别消息（可选 Telegram 链接、AFF 链接、语音、游戏等等）
9. 群员警告管理（`/warn` 、`/ban`、`/kick`、`/report`、`@admin`）
10. 入群欢迎消息
11. 自定义关键词回复
12. 群组绑定专用入群频道（频道中的群组链接定时刷新）

机器人功能的自由定制度高，可全方位协助管理群组。

## 机器人目录

以下是项目所拥有的机器人列表，群组可以根据自己的需要酌情选用。

注意：群组管理性质的机器人均不会响应任何私聊，所有设置指令均在群组中进行。

有任何疑问请至讨论群 [\@SCP_079_CHAT](https://t.me/SCP_079_CHAT) 提出。

| 名称              | 介绍                                        |
| ----------------- | ------------------------------------------- |
| SCP-079-USER<sup>[1]<sup/>  | 集中控制如何对待黑名单用户                  |
| SCP-079-TIP       | 发送入群欢迎消息                            |
| SCP-079-WARN      | 根据群管理的命令警告、封禁、或踢出用户      |
| SCP-079-CLEAN     | 根据群组的设置过滤特定类型的消息            |
| SCP-079-NOSPAM    | 自动封禁广告用户，自动删除广告消息          |
|SCP-079-CAPTCHA<sup>[2]<sup/> | 提供对新入群用户的验证审核                  |
| SCP-079-LANG      | 可通过本 Bot 删除中东地区使用的语言消息     |
| SCP-079-LONG      | 可通过本 Bot 删除超长消息                   |
| SCP-079-NOFLOOD   | 可通过本 Bot 更加灵活的控制消息发送频率     |
| SCP-079-NOPORN    | 可自动删除包含色情画面的媒体消息            |
| SCP-079-RECHECK   | 对媒体进行严格的色情检查                    |

1. 本项目任意其他机器人都需要 SCP-079-USER 配合，SCP-079-USER 为必选项
2. 根据目前的观测结果表明，炸群期间有很多昵称中包含`中东语言`的成员加入。作为运营建议，建议在引入 SCP-079-CAPTCHA 的同时引入 SCP-079-LANG 和 SCP-079-NOSPAM
- 详情请参阅：[Bots](/bots/)

## 公示信息和隐私保护
关于我们如何进行信息公示，以及相关隐私政策，[请查阅此处](/PublicInformationAndPrivacyProtection/)。

## 申请使用
申请条件和申请方法在[此处查看](/ApplyForUse/)。



## 免责声明

本项目无法承诺识别出所有的 SPAM、NSFW 及其他符合本项目执行标准的消息，也无法承诺不产生任何错误的处理操作。使用本项目的服务所带来的损失或可能产生的任何责任由申请者自行承担。本项目的 Demo 服务不能完全代替群组管理员，群组管理员仍需对群组保持一定程度的关注。

## 终止服务

申请者及其群组中相关管理员有权在任意时间移除本项目组相关机器人，终止使用本项目组所提供的服务。本项目组也保留终止为某群组提供服务的权力。

## 执行标准

\* *申请使用本项目组 USER、CAPTCHA、TIP 以外的机器人必读*

提升本项目组 USER、CAPTCHA、TIP 以外的机器人为群组管理员之时，则视为您已充分了解、理解本项目的执行标准。本项目组最新版本执行标准请[查阅此处](/rule/)。

## 联系我们

如您需要对本项目组 Demo 服务误判进行申诉，或需要私聊提供建议等，请联系：[\@SCP_079_TICKET_BOT](https://t.me/SCP_079_TICKET_BOT)。

如您需要帮助请[点击查看申诉及建议方法](https://telegra.ph/SCP-079-TICKET-12-05)

欢迎您加入 [\@SCP_079_CHAT](https://t.me/SCP_079_CHAT)，交流讨论本项目相关内容。

## 招募

我们在征集义士，来作为项目组管理员，协助管理本项目组机器人。

如您有意向参与，请联系：[\@SCP_079_PM_BOT](https://t.me/SCP_079_PM_BOT)

## 自建机器人

我们鼓励用户通过源代码 (<https://github.com/scp-079>) 进行机器人的私有部署。（[原因](/suggestions-zh/)）

对于选择自行搭建 SCP-079 实例的用户，我们通常情况下可予以提供帮助，但需要先明确陈述搭建 SCP-079 实例的动机、缘由、未来安排等细节。

---

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

本项目相关文档采用 [知识共享署名-相同方式共享 4.0 国际许可协议][cc-by-sa] 进行许可

[cc-by-sa]: https://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg
