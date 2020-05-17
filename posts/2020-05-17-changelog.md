---
title: Changelog 20200517
author: Xiao
---

<link rel="stylesheet" href="/css/chinese.css">

# 更新日志 20200517

我们建议自建用户跟进此次的更新

---

## 注意

请注意：各 bot 都需要采取独立的 Python 虚拟环境，若使用同一虚拟环境，程序运行会发生一些问题。您可藉由 `build.sh` [脚本](https://github.com/scp-079/scripts/)分别创建（已搭建的机器人也可利用此脚本重新创建，只要和之前通用搭建说明所推荐的环境和文件路径一致即可），具体细节请再次参照更新后的[搭建说明](https://scp-079.org/how-zh/)，此处不再赘述。

## SCP-079-CAPTCHA

CAPTCHA 更新至 0.5.0

主要的更改有：

- 只有一名用户待验证的时候，默认显示该用户 ID，并简化按钮（只提供「前往验证」）
- 接受来自 USER 和 NOSPAM 的设置同步（每小时），能更好地配合 USER 和 NOSPAM 的工作
- 备选答案的按钮在某些情况下考虑自动变为两排或三排
- 允许群组自定义只有一名用户待验证时入群的提示语（类似 TIP 可使用 $mention_name 等）
- 允许群组自定义手动触发验证时的提示语
- 允许群组自定义 NOSPAM 降级时触发验证的提示语
- 允许群组自定义加群轰炸时置顶消息的提示语
- 对加群轰炸期间验证失败的用户集中处理，期间不占用 EXCHANGE 频道和 DEBUG 频道的资源
- 因轰炸置顶消息时，在消息中提供前往原置顶的按钮链接

升级时应当注意 config.ini 文件的格式发生变化，请参照 [CAPTCHA 搭建说明](https://scp-079.org/captcha-zh/) 修改，此处提及几个需要注意的点：

- [bots] 下新增 index_id ，此为预留 ID，请填写任意非零整数
- [channels] 下新增 logging_channel_id ，同时要求 CAPTCHA 加入 LOGGING 频道中，具有发送消息的权限
- [mode] 下的 failed
- [limit] 中 limit_static 改名为 limit_flood ，请留意

CAPTCHA 的使用手册也已全面更新，请见：<https://scp-079.org/captcha-manual-zh/>

## 其他

其他机器人也略有修改，主要是为配合本次 CAPTCHA 升级所做的临时修改。若需升级 CAPTCHA，请务必同时升级 AVATAR、HIDE、LANG、NOSPAM、**USER** 。

除 [AVATAR](https://scp-079.org/avatar-zh/) 外，其余四个机器人的 config.ini 并未发生变化。

由于其余四个机器人只是临时性的修改，并未正式释出更新，因此简略介绍：其中的 NOSPAM 对用户名广告中间的干扰字符现象作出一定调整；其他机器人的修改主要围绕配合新版 CAPTCHA 的工作。
