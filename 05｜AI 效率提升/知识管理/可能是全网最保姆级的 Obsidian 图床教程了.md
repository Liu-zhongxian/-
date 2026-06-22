# 可能是全网最保姆级的 Obsidian 图床教程了

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MTQxN2M2ZjVmYzg4N2Y2ODhhOTYyMzgzNTEyYjhmZjFfNjY1ZGY0NDE3ODkwOWE1YzE0NDViMmViMDZkMjhiMzFfSUQ6NzY0NTI2NjI5MTQ2MDU1ODAwMl8xNzgyMDk5MTQ0OjE3ODIxMDI3NDRfVjM)

你的 Obsidian 库多大了？

是不是发现笔记本身没多少，全是图片撑的。截图、贴图、拖进来的参考图，散落在库里各种角落，删也不敢删，整理也整理不动。

同步也越来越慢，换台电脑等半天，手机上打开笔记图还经常加载不出来。

我找了个解决方案，就是给 Obsidian 配了个图床。

粘一张图片进去，它自动上传到云端，笔记里只留一个链接。图片不占本地空间了，库一下子轻了，同步也快了。

整个配的过程很简单，三步： ① 注册腾讯云，开一个存储桶 — 5 分钟 ② 装 PicList，连上腾讯云 — 3 分钟 ③ 装 Obsidian 插件，粘图自动上传 — 1 分钟

腾讯云新用户送 50G 免费空间有效期 180 天，个人用根本花不完。使用完毕之后正常使用的话一年几块钱搞定。

跟着走就行。

𝟭. 注册腾讯云，开一个存储桶

> 看到「腾讯云」三个字别慌。你不需要懂服务器、不需要写代码，整个过程就是注册账号、点几下鼠标、填几个框。跟注册一个网盘没什么区别。

腾讯云的「对象存储 COS」就是一个云端硬盘，你把图片扔上去，它给你一个链接，任何人都能看到。

按顺序来，三步：

𝗦𝘁𝗲𝗽 𝟭: 注册腾讯云账号 [https://cloud.tencent.com/register?s\\\\\\\_url=https%3A%2F%2Fcloud.tencent.com%2F](https://cloud.tencent.com/register?s\_url=https://cloud.tencent.com/)

𝗦𝘁𝗲𝗽 𝟮: 完成实名认证 [https://console.cloud.tencent.com/developer](https://console.cloud.tencent.com/developer)

𝗦𝘁𝗲𝗽 𝟯: 开通 COS 服务 [https://console.cloud.tencent.com/cos5](https://console.cloud.tencent.com/cos5)

点开第三个链接之后，可能会弹出一个安全管理的提醒，不用管，直接点右上角关闭。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=M2FjZjEzYmFiMTEyYzhmMGVjMzI2NjlhYzBhMTY0ZWRfNDU5OTJmYjBlYzA1OTJhNTAzZDBjNjA4NjA0ZjRjOWVfSUQ6NzY0NTI2NjI4OTkwODk3NjgyMF8xNzgyMDk5MTQ0OjE3ODIxMDI3NDRfVjM)

第一次进来会让你开通服务，点开通就行。

开通完你会看到送了一个 50G 的免费存储包，6 个月有效。用完按量付费就行，很便宜。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MTViMmRhMGY4YzMzMWI3ZTVlMmY3YzQ5ZmE2NmZmNTRfOTBkNjNjMGVjNzllNmExZDFhY2QzNzJlODBiYjdkNTFfSUQ6NzY0NTI2NjI4OTk2NTA3NTY0OV8xNzgyMDk5MTQ0OjE3ODIxMDI3NDRfVjM)

然后点「创建存储桶」，三个东西要填：

❶ 所属地域：选离你最近的城市，比如上海、北京、重庆 ❷ 名称：随便起，比如 obsidian-img，系统会自动在后面拼一串数字 ❸ 访问权限：选「公有读私有写」

> ⚠️ 权限这里一定要选对 — 「公有读私有写」的意思是：别人能看你的图片，但只有你能上传。千万别选成「公有读写」，那谁都能往你的桶里扔文件。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NWE4NTJkNjAxMjhiYzZiODEzYjUyODNkYmUzY2E2MzdfMTU0NDU3YmE3YzcxOTk4OWZkMmY2NTNiZTliMDdjMTdfSUQ6NzY0NTI2NjI5MjQxNDIwNTE0M18xNzgyMDk5MTQ0OjE3ODIxMDI3NDRfVjM)

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MmQ4ZTY0MGQyMWMyNWQ4NjhjZGUyOWY4ZDlhZDViYzlfYmRkMThhNjhmMjJiNzY3YjMwMzY4NmUxMzEzMjYzMjdfSUQ6NzY0NTI2NjI5MjA3Mjc5NTMzNV8xNzgyMDk5MTQ0OjE3ODIxMDI3NDRfVjM)

后面的高级配置不用动，一路下一步，确认创建。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NzU4ZjMxYTQ4MzUwMDQyOTU4M2FhZmRjMzBhYmFlODlfMDFjYmRhNTI0NmJkMDU1MzJiNTYzMWQ5ZDk5NWMyMjBfSUQ6NzY0NTI2NjI4OTczNjkxMjA2MF8xNzgyMDk5MTQ0OjE3ODIxMDI3NDRfVjM)

创建完之后，进到存储桶的「概览」页面，记住两个东西：

❶ 存储桶名称 — 类似 obsidian-alin-cos-1257870691 ❷ 所属地域 — 类似 ap-beijing

待会配 PicList 要用。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YTE3YmRkNDk1MGUxY2I4MGYzYWU4NTEyODYwNjhkMzNfZTgxMjg5MjA2YzU3Yjk4OWZmYTc4ZTZmMTJlYTM2OWJfSUQ6NzY0NTI2NjI5MTc0MTY0MTkzM18xNzgyMDk5MTQ0OjE3ODIxMDI3NDRfVjM)

接下来拿密钥。在对象存储左侧找到「密钥管理」，点「访问秘钥」，新建一个。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NjE2ZjliYzcyNGExMjNiYjYyYTYwMDUwMzk3ZThiNDVfNGFmNmM4MjRlOWJjMGJhZDcyMTRjMGRhYzBmYTRiYmJfSUQ6NzY0NTI2NjI5MzMwMTYyODA4Ml8xNzgyMDk5MTQ0OjE3ODIxMDI3NDRfVjM)

这里会提醒你用子账号密钥更安全，个人用不用管，勾「我已知晓」继续就行。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZTIzZDJmZTMyYjM1M2JhOTc2MzcyNmUxMDE4MWU2MzdfNmRjNDE5MmU4NTk2MDM0NjhkNjEzMDQ4YjEwZmZjOGRfSUQ6NzY0NTI2NjI5MjkxNTc4NDkxN18xNzgyMDk5MTQ0OjE3ODIxMDI3NDRfVjM)

创建完会给你两个东西： • SecretId — 相当于你的用户名 • SecretKey — 相当于你的密码

> ⚠️ SecretKey 只显示这一次！建议点「下载 CSV 文件」存到电脑上。丢了只能重新创建。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZWUxOTdhMDY3ZGEyNWIxYWFkNmMxNTkyYzZiZjRmNjFfOWExYmYzNGI5MWMxNDk3MmY0NzY2YTlmYjc1YzIzOGZfSUQ6NzY0NTI2NjI5MjMzNjkzODE5OF8xNzgyMDk5MTQ0OjE3ODIxMDI3NDRfVjM)

然后会让你微信扫码确认。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NjkxYzAwNmE3NTFlYzA3YmJjZGVjODc1YzQ3MTRlZWVfNzViNTI2MzQ2MjEyMGQzNGJjMjQ3MWRiZWY4Y2RmNGFfSUQ6NzY0NTI2NjI5MzUyMzg0NDMwMV8xNzgyMDk5MTQ0OjE3ODIxMDI3NDRfVjM)

到这里腾讯云搞定了。三个东西记好：存储桶名称、地域、密钥（SecretId + SecretKey）。

𝟮. 装 PicList，连上腾讯云

PicList 是一个图床管理工具，负责把图片上传到腾讯云。说白了就是个上传器。

去 GitHub 下载：[https://github.com/Kuingsmile/PicList](https://github.com/Kuingsmile/PicList)

Mac 用户也可以终端敲一行：

```Bash
brew install piclist --cask

```

装完打开。

打开 PicList，左边找到「图床」，展开后点「腾讯云COS」，新建一个配置。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NTZlOTY4MmNkNjI5MmY2OWRmNWY0NTdkNmExYjBjY2FfMGY5Y2I4Njc0N2FkMjQzMjNlY2MyOGI5MzgyOGY2NzJfSUQ6NzY0NTI2NjI5MjA5MzgxNTk5M18xNzgyMDk5MTQ0OjE3ODIxMDI3NDRfVjM)

先说一下存储桶名称怎么填。你在腾讯云看到的名称是一长串，比如 obsidian-alin-cos-1257870691，最后那串纯数字 1257870691 是你的 AppId。PicList 里 Bucket 和 AppId 都要填。

只需要填这 6 个字段，其他全部留空：

❶ 配置名：随便填，比如 obsidian ❷ 设定 SecretId：填刚才拿到的 SecretId ❸ 设定 SecretKey：填刚才拿到的 SecretKey ❹ 设定 Bucket：填完整的存储桶名称，比如 obsidian-alin-cos-1257870691 ❺ 设定 AppId：填存储桶名称最后那串数字，比如 1257870691 ❻ 设定存储区域：填 ap-城市名，比如 ap-beijing（⚠️ 注意别拼错）

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YzI2YWFkZGRlNWVlNjdkMDUyZjZjNWNlYTlmMWFmYThfMGViY2Y1YzQ4NTM1ODVjNjg5ODY5YWE2ZWQ5NWM0NDlfSUQ6NzY0NTI2NjI5MzY4NzUyMDQ3Ml8xNzgyMDk5MTQ0OjE3ODIxMDI3NDRfVjM)

后面的存储路径、自定义域名等全部留空，不用管。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NmZlZGQ4ODU1ZmRlNjRlMzZiNDgwNGE2ODZlMjRiYTdfMTMzNDIzNjVkMWNkMjM3YTI1Y2E4OTAzNjE2MzEyNDhfSUQ6NzY0NTI2NjI5MDUyOTU1MzYzMl8xNzgyMDk5MTQ0OjE3ODIxMDI3NDRfVjM)

填完点「设为默认图床」。

试一下能不能用 — 切到 PicList 的「上传」页面，随便拖一张图片进去。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZTQwNmNiNTIwMjRjNjI0MGQ3NjJlYTJjNzA5YWNiMTBfNGRhYmRlODA4ZGY2MTZjMjMxMzQ5ZDM2YWE4OTU3ZjdfSUQ6NzY0NTI2NjI5MjQxMjU1MDM0N18xNzgyMDk5MTQ0OjE3ODIxMDI3NDRfVjM)

如果上传成功，下面会显示一个链接，类似： [https://obsidian-alin-cos-1257870691.cos.ap-beijing.myqcloud.com/xxx.png](https://obsidian-alin-cos-1257870691.cos.ap-beijing.myqcloud.com/xxx.png)

复制链接到浏览器打开，图片能下载下来就说明通了。

💡 浏览器会直接下载而不是显示图片，这是腾讯云新桶的默认行为，不影响使用。图片嵌在文章里时，公众号和 X 都能正常显示。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZjQ4ODI0ZTczNTU0Nzg3Mjc2MWRiZjc3NDc2YTcwNWJfOTZkZGMyYjZkYmNlYjEzYjdmMWM2M2QwY2EyZDRiN2JfSUQ6NzY0NTI2NjI5MjI3NDEzODMxNl8xNzgyMDk5MTQ0OjE3ODIxMDI3NDRfVjM)

> 什么，你说报错了？别慌，帮大家考虑到了 👇

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MmFhZjI0ZjcwMjU3YzJmNGUyOGI2ZDdmNjc2YzFlOWVfNmMxNWM0OTVhZTYyYWUzZDJkNDZkM2I1MGU3ZWM2MThfSUQ6NzY0NTI2NjI5MzI1OTU1NDAxNl8xNzgyMDk5MTQ0OjE3ODIxMDI3NDRfVjM)

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MTlhZjZmODEyZjliZDUyOWE0YWY3ZTU5NjBkMmIyMmFfYTFjNmRhZjFlMWMxNmE4MzQ5ZWQxM2I5ZWNlM2MzYTBfSUQ6NzY0NTI2NjI5MzU5NTE5NjYxN18xNzgyMDk5MTQ0OjE3ODIxMDI3NDRfVjM)

碰到问题不要慌，把报错信息丢给 AI 帮你解决。

𝟯. 装 Obsidian 插件

最后一步，让 Obsidian 粘图片的时候自动走 PicList 上传。

打开 Obsidian → 设置 → 第三方插件 → 浏览，搜 "Image auto upload"。

装 renmu123 那个（12 万人在用），装完点启用。不用改任何设置。

搞定，试试效果。

确保 PicList 在后台开着（⚠️ 这个很重要，PicList 必须开着插件才能工作，建议设成开机自启）。

然后在 Obsidian 里随便打开一篇笔记，复制一张图片，粘贴。

你会发现笔记里不再是 !\\[\\[本地图片.png\\]\\]，而是变成了一个云端链接：

!\\\[\\\]([https://obsidian-alin-cos-xxx.cos.ap-beijing.myqcloud.com/xxx.png](https://obsidian-alin-cos-xxx.cos.ap-beijing.myqcloud.com/xxx.png))

看，粘进去的图片自动变成了云端链接 👇

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODFmYmQxYmJkOTc0YWNhZWZkMWIwYzY3ZTRkZWQzN2NfOTFjM2IzMWE5OTBkMjU5NTBlN2M4ODQzZjc0MDE4NzVfSUQ6NzY0NTI2NjI5MjcxNDM0MzYyM18xNzgyMDk5MTQ0OjE3ODIxMDI3NDRfVjM)

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NzJiNDNmNzE4ZDVjZWJjY2Q4OGMzNGE2MWI1YzQ0YzhfMDFiYTU0MzlkOGE4MmUzYzcxZmU0MzBlZjhjYTc5NTFfSUQ6NzY0NTI2NjI5MDQ4NzYyNjkzN18xNzgyMDk5MTQ0OjE3ODIxMDI3NDRfVjM)

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NGVkMDE4YzQ2NTJkMzAzZGZjMTk1MjI4NjgyZTc2NmVfNWNmNDMzMjM5NjkwMzQwMDQyZWUyZDc4MmI0NDg0YTVfSUQ6NzY0NTI2NjI5MjkxNTc1MjE0OV8xNzgyMDk5MTQ0OjE3ODIxMDI3NDRfVjM)

以后你写的每篇文章，图片都自动在云端了。发公众号、发 X、发博客，图片都能正常显示。

就这样，三步搞定：

① 腾讯云开个存储桶，拿到密钥 ② PicList 填上密钥，连通腾讯云 ③ Obsidian 装个插件，粘图自动上传

以后粘图片就是上传图片，写完直接发。

💡 几个小贴士：

• PicList 必须开着才能自动上传，建议设成开机自启动 • 腾讯云 50G 免费空间只包含存储费用，请求和流量另算，但别慌 — 个人用一个月也就几毛钱。充个几块钱够用很久 • 已经写好的文章里那些本地图片不会自动上传，只有新粘贴的才会。老图片可以用 PicList 的批量上传功能手动处理（最好的方式其实是让 AI 帮你自动上传并且替换链接）
