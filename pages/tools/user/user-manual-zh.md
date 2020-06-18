群组中的管理员：

- `/config user`：通过 [SCP-079-CONFIG](/config/) 调整机器人设置，机器人将回报前往设置的链接，5 分钟内设置将被锁定，无法再次更改

除使用 `/config user` 外，管理员也可以通过 `/config_user` 命令在群组中手动调整设置：

- `/config_user show`：显示当前设置
- `/config_user default`：恢复为默认设置
- `/config_user delete off`：关闭协助删除功能，关闭后，将不再响应其他 bot 的协助删除用户全部消息的请求（不推荐，这可能给其他机器人的功能带来影响）
- `/config_user delete on`：开启协助删除功能（默认设置） 
- `待补充`

SCP-079-TEST 中的成员：

- `/mention [id | username]`：通过 ID 或 username 查询用户
- `/version`：检查机器人版本
- `/mention`：待补充
- `/print`：待补充
- `待补充`
