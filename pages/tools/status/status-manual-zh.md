---
title: SCP-079-AVATAR
---

<link rel="stylesheet" href="/css/chinese.css">
<button onmouseover="PlaySound('totop1')" onmouseout="StopSound('totop1')" onclick="window.location.href = '/status-manual/';" class="en">Click Here to English Page</button>

---

# SCP-079-STATUS 使用手册

本文介绍如何使用 SCP-079-STATUS 的机器人实例，对应的搭建说明在[此处](/status-zh/)。

---

## 运作流程

以下介绍机器人的工作流程，在进行使用和设置前，建议您了解此流程。

---

### 加入频道

机器人需加入 `critical_channel_id` 所指定的频道中，并具有发送消息的权限。

### 发送消息

由 `creator_id` 指定的用户向机器人私聊发送 `/send` 命令，机器人将依照 `report.txt` 所指定的内容，在频道中发送一条所在服务器状态信息。

### 编辑消息

机器人将每隔 `interval` 秒在 `/send` 发送的频道消息基础上进行编辑更新。

---

## 实用命令

以下介绍本机器人可响应的文字命令。

---

### 机器人的所有者

- `/start`：查看帮助说明
- `/send`：发送一条服务状态消息（初始化）
- `/new`：重新发送一条新的状态消息，删除原有消息

---

## 问与答

常见问题汇总。

---

**Q：日志中显示大量的 Sleep for n second(s) 是怎么回事？**

A：说明所设置的 `interval` 过小，建议不要小于 3 。
