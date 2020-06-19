群组中的管理员：

- `/config clean`：通过 [SCP-079-CONFIG](/config/) 调整机器人设置，机器人将回报前往设置的链接，5 分钟内设置将被锁定，无法再次更改
- `/clean`：删除三小时内群组内的贴纸和 GIF 动图
- `/dafm yes` 或 `/dafm y`：命令机器人删除自己发送的所有消息
- `/purge`：回复某条消息，删除自被回复消息开始，到当前消息结束的所有消息。注意，使用该命令只能最多删除基于消息 ID 的最近 1000 条消息，大于此数值将不会做出应答

除使用 `/config clean` 外，管理员也可以通过 `/config_clean` 命令在群组中手动调整设置：

- `/config_clean show`：显示当前设置
- `/config_clean default`：恢复为默认设置
- `/config_clean delete off`：关闭协助删除功能
- `/config_clean delete on`：开启协助删除功能（默认设置）
- `/config_clean friend off`：关闭放行友情群组链接的功能
- `/config_clean friend on`：开启放行友情群组链接的功能（默认设置）

忽略或过滤某种消息、关闭或开启某种功能：

- `/config_clean [type] off`：忽略某类别消息、关闭某个功能
- `/config_clean [type] on`：删除某类别消息、开启某个功能

其中，`[type]` 应为以下类别之一：

- `con`：联系人（默认过滤）
- `loc`：定位地址（默认过滤）
- `vdn`：圆视频（默认过滤）
- `voi`：语音（默认过滤）
- `ast`：动态贴纸
- `aud`：音频
- `bmd`：以 / 为前缀，且不带有参数的机器人命令（默认过滤）
- `doc`：文件
- `gam`：游戏
- `gif`：GIF 动图
- `via`：通过 Bot 发送的消息
- `vid`：视频
- `ser`：服务类消息，对于加群消息将保留最后一条（默认过滤）
- `sti`：贴纸
- `aff`：传统 AFF 链接、中国大陆各类活动推广分享
- `exe`：可执行文件，例如 APK、BAT、CMD、COM、EXE、PIF、SCR、VBS 文件
- `iml`：即时通讯软件的邀请链接或联系方式
- `sho`：短链接
- `tgl`：Telegram 链接，包括带 Telegram 域名的链接和 `@mention`，只过滤非当前群组 `username` 的 `@mention` 、非群组成员 `@mention`
- `tgp`：代理链接
- `qrc`：二维码
- `sde`：群员可否自助删除自己所发所有消息
- `tcl`：每日定时清除位于群组和黑名单中的 Deleted Account
- `ttd`：定时删除贴纸和动图（三小时后）

群组中的普通成员：

- `/dafm yes` 或 `/dafm y`：如果群组设置允许，删除自己在该群所发的全部消息

SCP-079-TEST 中的成员：

- `发送消息`：如有匹配，显示判断内容
- `/version`：检查机器人版本
