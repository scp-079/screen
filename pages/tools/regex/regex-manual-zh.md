---
title: SCP-079-REGEX
---

<link rel="stylesheet" href="/css/chinese.css">
<button onmouseover="PlaySound('totop1')" onmouseout="StopSound('totop1')" onclick="window.location.href = '/regex-manual/';" class="en">Click Here to English Page</button>

# SCP-079-REGEX 使用手册

[TOC]

## 概述

SCP-079 工作组 通过 SCP_079_REGEX_BOT 管理着 SCP-079 旗下所有机器人使用的正则表达式。

*注：*

1. [SCP-079-REGEX](https://github.com/scp-079/scp-079-regex) 项目未公开 [SCP-079-REGEX](https://t.me/SCP-079_REGEX_BOT) 所使用的正则表达式且暂无公开 [SCP-079-REGEX](https://t.me/SCP-079_REGEX_BOT) 所使用的正则表达式的计划。
2. 本文不讲述正则表达式的语法，请有管理正则表达式需求者自行学习正则表达式的相关语法。
3. 本文介绍如何使用 SCP-079-REGEX 机器人实例，对应的搭建说明在[此处](/regex/)。

## 规则集说明

### 广告用语

规则集代号：ad ada-adz

#### 情景1
### 头像分析

规则集代号：ava



#### 其他使用者<sup>指除 SCP-079-REGEX-BOT 外使用该规则集的机器人，下同<sup/>

无

#### 触发效果

NOSPAM 将使用该类规则分析用户头像 OCR 结果，触发该类规则将导致封禁。<sup>本文中封禁与删除均指理想状态下的结果，实际环境中的封禁或删除还受白名单和降级操作调控，下同<sup/>


### 敏感检测

规则集代号：bad



#### 其他使用者

SCP-079-NOSPAM

#### 触发效果


SCP-079-NOSPAM 更新用户评分

### 自动封禁

规则集代号：ban


#### 其他使用者

SCP-079-AVATAR
SCP-079-CAPTCHA
SCP-079-CLEAN
SCP-079-LANG
SCP-079-LONG
SCP-079-NOPORN
SCP-079-NOSPAM
SCP-079-RECHECK
SCP-079-TIP
SCP-079-WATCH

#### 触发效果

SCP-079-NOSPAM 全局封禁触发者，并加入全局黑名单。

### 简介检查

规则集代号：bio


#### 其他使用者

SCP-079-AVATAR
SCP-079-CAPTCHA
SCP-079-CLEAN
SCP-079-LANG
SCP-079-LONG
SCP-079-NOPORN
SCP-079-NOSPAM
SCP-079-RECHECK
SCP-079-TIP
SCP-079-WATCH

#### 触发效果



### 联系方式

规则集代号：con



#### 其他使用者



#### 触发效果



### 自动删除

规则集代号：del



#### 其他使用者



#### 触发效果



### 文件名称

规则集代号：fil



#### 其他使用者



#### 触发效果



### IM 链接

规则集代号：iml



#### 其他使用者



#### 触发效果



### 电话号码

规则集代号：pho



#### 其他使用者



#### 触发效果



### 名称封禁

规则集代号：nm



#### 其他使用者



#### 触发效果



### RM 笑话

规则集代号：rm



#### 其他使用者

SCP-079-TIP

#### 触发效果



### 短链接

规则集代号：sho



#### 其他使用者



#### 触发效果



### 特殊中文

规则集代号：spc



#### 其他使用者



#### 触发效果



### 特殊英文

规则集代号：spe



#### 其他使用者



#### 触发效果



### 贴纸删除

规则集代号：sti



#### 其他使用者



#### 触发效果



### TG 链接

规则集代号：tgl



#### 其他使用者



#### 触发效果



### TG 代理

规则集代号：tgp



#### 其他使用者



#### 触发效果



### 追踪封禁

规则集代号：wb



#### 其他使用者



#### 触发效果



### 追踪删除

规则集代号：wd



#### 其他使用者



#### 触发效果



### 测试用例

规则集代号：test



#### 其他使用者

无

#### 触发效果

仅供测试，SCP-070-TEST 群组成员可发送消息至 SCP-070-TEST 群组检测是否匹配正则表达式。