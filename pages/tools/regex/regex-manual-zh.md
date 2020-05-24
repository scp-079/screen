---
title： SCP-079-REGEX
---

<link rel="stylesheet" href="/css/chinese.css">
<button onmouseover="PlaySound('totop1')" onmouseout="StopSound('totop1')" onclick="window.location.href = '/regex-manual/';" class="en">Click Here to English Page</button>

# SCP-079-REGEX 使用手册


## 概述

SCP-079 工作组 通过 SCP_079_REGEX_BOT 管理着 SCP-079 旗下所有机器人使用的正则表达式。

SCP_079_REGEX_BOT 能方便的控制 SCP-079 系列的机器人的规则，无 SCP_079_REGEX_BOT 配合，SCP_079_NOSPAM_BOT 将无法正常工作。

## 声明

1. [SCP-079-REGEX](https：//github.com/scp-079/scp-079-regex) 项目未公开 [SCP-079-REGEX](https：//t.me/SCP-079_REGEX_BOT) 所使用的正则表达式且暂无公开 [SCP-079-REGEX](https：//t.me/SCP-079_REGEX_BOT) 所使用的正则表达式的计划。
2. 本文不讲述正则表达式的语法，请有管理正则表达式需求者自行学习正则表达式的相关语法。
3. 本文介绍如何使用 SCP-079-REGEX 机器人实例，对应的搭建说明在[此处](/regex/)。
4. 本文中假设 SCP-079 旗下所有机器人的所有功能均被开启，实际上本文所述的所有封禁、删除均受`白名单`、`操作降级`和`群组对机器人的配置`共同调控。
5. 本文中约定使用 "&&" 表示 "且"、“||”表示“或”、"("和“)”表示"运算的优先顺序"

## 规则集说明

### 广告用语

规则集代号：ad ada adb adc add ade ...... adz

注1：本文在此约定使用 ad* 指代ada规则集到adz规则集中的任意一个规则集.

注2：触发 emoji 计数规则的视为触发了 ad*

- SCP-079-NOSPAM：

  - 触发 `(ad 规则集||ad* 规则集)&&(con 规则集||iml 规则集||pho 规则集)` 时，全局封禁触发者，并加入全局黑名单。

  - 触发 `ad* 规则集`中任意两个规则集时，全局封禁触发者，并加入全局黑名单。


### 头像分析

规则集代号：ava


SCP-079-NOSPAM：将使用该类规则分析用户头像 OCR 结果，触发该类规则集将导致全局封禁触发者，并加入全局黑名单。


### 敏感检测

规则集代号：bad

SCP-079-NOSPAM：更新用户评分，自动举报至 SCP-079-WARN 提交至群组管理员处理。


### 自动封禁

规则集代号：ban



SCP-079-AVATAR
SCP-079-CAPTCHA
SCP-079-CLEAN
SCP-079-LANG
SCP-079-LONG
SCP-079-NOPORN
SCP-079-NOSPAM：全局封禁触发者，并加入全局黑名单。
SCP-079-RECHECK
SCP-079-TIP
SCP-079-WATCH




### 简介检查

规则集代号：bio

SCP-079-AVATAR
SCP-079-CAPTCHA
SCP-079-CLEAN
SCP-079-LANG
SCP-079-LONG
SCP-079-NOPORN
SCP-079-NOSPAM：检测用户昵称和简介，全局封禁触发者，并加入全局黑名单。
SCP-079-RECHECK
SCP-079-TIP
SCP-079-WATCH



### 联系方式

规则集代号：con

SCP-079-NOSPAM：触发 `(ad 规则集||ad* 规则集)&&(con 规则集||iml 规则集||pho 规则集)` 时，全局封禁触发者，并加入全局黑名单。

### 自动删除

规则集代号：del

SCP-079-CLEAN
SCP-079-LANG
SCP-079-LONG
SCP-079-NOPORN
SCP-079-NOSPAM：删除触发的消息并更新触发用户评分
SCP-079-RECHECK
SCP-079-WATCH

### 文件名称

规则集代号：fil

SCP-079-CLEAN
SCP-079-LANG
SCP-079-NOPORN
SCP-079-NOSPAM：封禁触发用户并更新用户评分
SCP-079-RECHECK
SCP-079-TIP
SCP-079-WATCH

### IM 链接

规则集代号：iml

SCP-079-NOSPAM：触发 `(ad 规则集||ad* 规则集)&&(con 规则集||iml 规则集||pho 规则集)` 时，全局封禁触发者，并加入全局黑名单。

### 电话号码

规则集代号：pho

SCP-079-NOSPAM：触发 `(ad 规则集||ad* 规则集)&&(con 规则集||iml 规则集||pho 规则集)` 时，全局封禁触发者，并加入全局黑名单。

### 名称封禁

规则集代号：nm

SCP-079-NOSPAM：全局封禁触发者，并加入全局黑名单。

### RM 笑话

规则集代号：rm

SCP-079-TIP：回复触发消息，提示他人谨慎执行该操作。

### 短链接

规则集代号：sho



### 特殊中文

规则集代号：spc



### 特殊英文

规则集代号：spe



### 贴纸删除

规则集代号：sti



### TG 链接

规则集代号：tgl

SCP-079-CLEAN：删除触发消息
SCP-079-NOPORN
SCP-079-NOSPAM：
SCP-079-WATCH

### TG 代理

规则集代号：tgp

SCP-079-CLEAN：
SCP-079-WATCH

### 追踪封禁

规则集代号：wb

SCP-079-CAPTCHA：
SCP-079-CLEAN：删除触发消息
SCP-079-NOFLOOD：
SCP-079-NOPORN：
SCP-079-NOSPAM：
SCP-079-RECHECK：
SCP-079-TIP：
SCP-079-WATCH：


### 追踪删除

规则集代号：wd

SCP-079-NOSPAM：
SCP-079-WATCH：

### 测试用例

规则集代号：test

SCP-079-REGEX：SCP-070-TEST 群组成员可发送消息至 SCP-070-TEST 群组检测是否匹配正则表达式。

## 基本操作
本章节所有操作均在 SCP-079-REGEX 或 SCP-079-TEST 群组中完成。

### 添加正则表达式
在 SCP-079-REGEX 群组中通过 `/add 任意规则集代号 正则表达式`或`/ad 任意规则集代号 正则表达式` 添加正则表达式，例如：`/add wb 专业引流` `/ad del 1a2b3c4d5e6f`。
如需将相同的正则表达式添加至多个规则集中，可使用 `/same 规则集代号1 规则集代号2 规则集代号3 规则集代号4`完成。

---

示例：
在执行完 `/ad del 1a2b3c4d5e6f` 后`1a2b3c4d5e6f`被添加进了`del 规则集`，此时若需将`1a2b3c4d5e6f`同时加入`nm 规则集`，只需回复`/ad del 1a2b3c4d5e6f`这条消息`/same nm`；若此时又需将`1a2b3c4d5e6f`加入`ad 规则集`和`test 规则集`，只需再次回复`/ad del 1a2b3c4d5e6f`这条消息`/same ad test`即可。
该情景下操作还可进一步简化，SCP-079-REGEX 会读取正则表达式中的注释部分，只需使用注释注明包含该正则表达式的所有规则集即可，例如该情景下使用`/ad del 1a2b3c4d5e6f(?# del nm ad test)`即可一键将`/ad del 1a2b3c4d5e6f(?# del nm ad test)`加入`del 规则集`、`nm 规则集`、`ad 规则集`、`test 规则集`。

---

在同规则集中添加与已有正则表达式近似的正则表达式是会触发

### 删除正则表达式
在 SCP-079-REGEX 群组中通过 `/remove 任意规则集代号 正则表达式`或`/rm 任意规则集代号 正则表达式` 添加正则表达式，例如：`/remove wb 专业引流` `/rm del 1a2b3c4d5e6f`。
如需将相同的正则表达式添加至多个规则集中，可使用 `/same 规则集代号1 规则集代号2 规则集代号3 规则集代号4`完成。
示例：
在执行完 `/rm del 1a2b3c4d5e6f` 后`1a2b3c4d5e6f`被从`del 规则集`中删除，此时若需将`1a2b3c4d5e6f`同时从`nm 规则集`删除，只需回复`/rm del 1a2b3c4d5e6f`这条消息`/same nm`；若此时又需将`1a2b3c4d5e6f`从`ad 规则集`和`test 规则集`中删除，只需再次回复`/rm del 1a2b3c4d5e6f`这条消息`/same ad test`即可。

该情景下操作还可进一步简化，SCP-079-REGEX 会读取正则表达式中的注释部分，只需使用注释注明包含该正则表达式的所有规则集即可，例如该情景下使用`/rm del 1a2b3c4d5e6f(?# del nm rm test)`即可一键将`/rm del 1a2b3c4d5e6f(?# del nm ad test)`从`del 规则集`、`nm 规则集`、`ad 规则集`、`test 规则集`中一键删除。

### 检索正则表达式

SCP-079-REGEX 现已提供多种方式检索正则表达式。

#### 查阅全部

您可使用 `/ls 规则集代号`显示该规则集中的全部内容，该列表默认按照平均触发次数降序排列，使用`/ls 规则集代号 asc`将按照降序显示该规则集。

#### 搜索
您可使用 `/search 规则集代号 内容`、`/s 规则集代号 内容`或`/find 规则集代号 内容` 。除已有的规则集代号外，这三个命令均支持规则集代号`all`来搜索所有规则集。

### 触发测试

SCP-079-TEST 群组中成员可通过发送或转发待测试的消息测试当前文本所触发的正则表达式。

SCP-079-REGEX 将读取消息正文、来源名称、贴纸包标题、贴纸名称，并检查相关正则表达式，并在SCP-079-TEST 群组中输出被触发的正则表达式列表。

### 标签说明

正则表达式使用 `(?#注释内容)`表示注释。SCP-079-REGEX 已使用正则表达式注释语法为正则表达式附加标签信息。

目前，支持的标签有
- 同步标签 `(?# 规则集代号1 规则集代号2 规则集代号3)` 
  - 对含有同步标签的正则表达式进行操作时，SCP-079-REGEX 会在同步标签中的每个规则集中重复执行。
- 临时标签  `(?# temp)`\[**该功能即将被修改**\]
  - SCP-079-REGEX 会自动追踪包含临时标签的正则表达式的触发情况，如该正则表达式连续14日不被触发，将被自动移除。
  - `ban规则集`的任意规则均视为附加了临时标签，如不希望`ban规则集`中的正则表示式因连续14日不被触发而被移除，请使用永久标签`(?# forever)`


## QFA

- 为什么 `pho规则集`与`iml规则集`要从 `con规则集` 中分离呢?
- SCP-079-CLEAN 需要使用 `pho规则集`和 `iml规则集`

- 为什么应该使用`(?#temp)`标签?何时该使用