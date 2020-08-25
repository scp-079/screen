---
title: README
---

<link rel="stylesheet" href="/css/chinese.css">

# README

[![CC BY-SA 4.0][cc-by-sa-shield]][cc-by-sa]

<p style="font-family: vt323, monospace; font-size: 20px;">This article mainly introduces the related details and application procedures of the demonstration bots hosted by this project. The demonstration bots are only for Chinese users, so this article will not provide an English version. It is recommended that you <a href="../how/">create your own bots</a> from source code.</p>

![](/images/Confusion_grey.png) 提示：本条目的主题不是 `SCP 基金会`。

---

## 简介

本项目提供免费并开源的群组管理机器人，可提供的服务众多，选其中主要功能罗列如下：

1. 入群验证（可自动叠加、避免验证码刷屏、防炸群，可自动免验证，支持自定义问题、自定义提示）。
2. 可设置自动删除各种类型的消息。除加群消息、入群消息、和其他 Telegram 的基本类型消息外，还能识别并删除推广链接、电话号码、二维码、联系方式等等。
3. 可定时清理已销号用户（Delete Account）、定时清理群组中的贴纸和动图。
4. 可设置允许群员自助删除自己所发的全部消息。
5. 管理员通过命令指定集中删除某范围内的消息。
6. 可设置自动删除文字中包含特定语言的消息，自动封禁昵称 / 简介中包含特定语言的用户，其中，「特定语言」列表可自定义，支持几十余种语言。
7. 可设置自动删除群组指定的消息文字达到特定长度以上的消息。
8. 可设置自动删除刷屏消息，对于判断「刷屏」的发言频率，是群组可以自定义的。
9. 自动删除包含色情画面的媒体消息；自动删除来自 Telegram 官方限制频道的消息。
10. 自动封禁昵称、简介、头像中包含广告的用户；自动封禁发送广告的用户。
11. 可设置自动阻止普通群员拉入机器人。
12. 可设置对新入群用户的发言进行一定限制。
13. 发送自定义的入群欢迎消息（可带按钮，按钮自动排列）。
14. 自定义关键词回复。
15. 可设置群组绑定公开频道，在其中提供定时刷新的私有群组的入群链接。
16. 群员警告管理（`/warn`、`/ban`、`/kick`、`/report`、`/admin`）。

机器人功能的自由定制度高，可全方位协助管理群组。

**注：**对于可供群组申请使用的所有机器人，都本着公开透明、操作可查的[设计和管理原则](/principles-zh/)，确保最大程度地开放，机器人的任何操作都有据可查，便于核对。

---

## 机器人列表

[点击此处](/bots/)可查看本项目 Demo 服务的机器人列表，以及对应的功能及使用手册。

## 公示信息和隐私保护

关于我们如何进行信息公示，以及相关隐私政策，[请查阅此处](/PublicInformationAndPrivacyProtection/)。

## 申请使用

申请条件和申请方法请[点击此处查看](/ApplyForUse/)。

---

## 免责声明

本项目无法承诺识别出所有的 SPAM、NSFW 及其他符合本项目执行标准的消息，也无法承诺不产生任何错误的处理操作。使用本项目的服务所带来的损失或可能产生的任何责任由申请者自行承担。本项目的 Demo 服务不能完全代替群组管理员，群组管理员仍需对群组保持一定程度的关注。

## 终止服务

申请者及其群组中相关管理员有权在任意时间移除 SCP-079 旗下相关机器人，终止使用 SCP-079 所提供的服务。 SCP-079 工作组也保留终止为某群组提供服务的权力。

## 执行标准

\* *申请使用 SCP-079 旗下 USER、CAPTCHA、TIP 以外的机器人必读*

在您提升 SCP-079 旗下 USER、CAPTCHA、TIP 以外的机器人为群组管理员之时，则视为您已充分了解、理解本项目的执行标准。SCP-079 工作组最新版本执行标准请[查阅此处](/rule/)。

---

## 服务状态

[前往此页面](/monitor/)以查看本项目 Demo 机器人所在服务器运行状态。

## 申诉及建议

如需使用工单机器人联系我们，请查看[此指南](/ticket/)。

---

## 招募

希望为本项目作出贡献？请您查看我们的[招募说明](/help-zh/)。

## 自建机器人

我们鼓励用户通过源代码 (<https://github.com/scp-079>) 进行机器人的私有部署（[原因](/suggestions-zh/)）。

对于选择自行搭建 SCP-079 实例的用户，我们通常情况下可予以提供帮助，但需要先明确陈述搭建 SCP-079 实例的动机、缘由、未来安排等细节。

此处列出一些 SCP-079 实例的第三方服务提供者：[公开服务列表](/list/)

---

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

本项目相关文档采用 [知识共享署名-相同方式共享 4.0 国际许可协议][cc-by-sa] 进行许可

[cc-by-sa]: https://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg
