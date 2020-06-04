---
title: Changelog 20200604
author: Xiao
---

<link rel="stylesheet" href="/css/chinese.css">

# 更新日志 20200604

---

## 注意

请注意：各 bot 都需要采取独立的 Python 虚拟环境，若使用同一虚拟环境，程序运行会发生一些问题。您可藉由 `build.sh` [脚本](https://github.com/scp-079/scripts/)分别创建（已搭建的机器人也可利用此脚本重新创建，只要和之前通用搭建说明所推荐的环境和文件路径一致即可），具体细节请再次参照更新后的[搭建说明](https://scp-079.org/how-zh/)，此处不再赘述。

`再次注意`：依赖包 `OpenCC` 有 breakchange，所以请务必分别使用独立 Python 虚拟环境。**否则其他机器人将无法正常启动。**

---

## SCP-079-CAPTCHA

CAPTCHA 更新至 0.6.0

主要的更改有：

- 支持群组设置自定义问题
- 扩展 /pass 命令的使用方式

此两种功能的详情请见手册：<https://scp-079.org/captcha-manual-zh/>

升级前，请务必在终端执行以下命令，如参照了推荐方式部署机器人，可将以下代码块`一次性全部复制`到 shell 中并粘贴执行：

```bash
cd ~/scp-079/scripts
git pull

cat <<'TEXT' > ~/scp-079/scripts/qns.py
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import pickle

with open("../captcha/data/user_ids", "rb") as f:
    user_ids = pickle.load(f)

for uid in list(user_ids):
    user_ids[uid]["qns"] = {}
    print(f"User {uid} done")

with open("../captcha/data/user_ids", "wb") as f:
    pickle.dump(user_ids, f)

print("\nDone!\n")
TEXT

stop captcha && python3 ~/scp-079/scripts/qns.py && update captcha

rm ~/scp-079/scripts/qns.py
```

更新完毕，可查看服务运行状态。

---

## 联系我们

如更新遇到问题，请您反馈至[讨论群组](https://t.me/SCP_079_CHAT)中。
