# 大模型 Token 告急？一文教你用 CF 零成本实现“邮箱自由”与多开储备

![图片为一篇关于大模型Token告急解决方案的封面图，以Cloudflare标志为中心，周围环绕着“LLM”“Cloudflare”“Email Freedom”“多开储备”等关键词。背景中展示了大量邮箱图标，右侧是邮箱自由和账号储备库的标识。图片与上下文紧密相关，直观呈现了文章主题，即用Cloudflare实现零成本“邮箱自由”与多开储备，解决大模型Token告急问题。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MTc4YzQwMmRlNjk1OGJmZGM1YmJlNzVjMzk4Y2I4N2JfZjk3MzU1MTJlN2VjNjM1ZjE1OTNlZjRmZGVjYTM3ODVfSUQ6NzY0NTcxNDMxNDQ5MzYyNzYwNl8xNzgyMDk5MTY2OjE3ODIxMDI3NjZfVjM)

昨晚我熬夜实测了几个几十块钱的冷门域名，发现这套野路子不仅行得通，而且防封率极高。

最近 OpenAI 突然对免费用户开放了 Codex (GPT-5.4) 模型，加上今天微信正式接入 OpenClaw，可以预见大家日常的 Token 消耗量会直线上升。

想要不受限制地使用这些顶级模型，最简单粗暴的方法就是多注册几个账号囤 Token。但批量注册最大的门槛是邮箱：自己的几个实名邮箱早就注册完了，去买批量号又要担心随时被封，花钱还不省心。其实不仅是这次的 AI 注册潮，平时试用各种 SaaS 服务、做多账号隔离运营，同样很缺干净的邮箱。

只要你手里有一个闲置域名，完全可以不花一分钱，利用 Cloudflare 的邮件路由功能，给自己搭一个“无限邮箱生成器”。你可以在注册时随便编造无数个前缀（比如 gpt01@你的域名.com），而收到的验证码最后都会自动汇聚到你的一个主邮箱（比如 Gmail）里。

## CF 邮件路由是怎么工作的？

利用 Cloudflare 免费的 Email Routing（邮件路由）服务，能很优雅地解决多账号注册时邮箱不够用的问题。

比如在你注册大模型账号时，可以随手填 chat001@xxx.com、chat002@xxx.com。不管这里填什么，这些接收到的验证码邮件都会瞬间转发到你指定的真实主邮箱收件箱里。

**⚠️** **唯一限制：** 由于是路由转发，这套方案只会作为单向通道——**只能收信，不能发信**。不过对于我们拿来接验证码的需求来说，完全够用了。

## 准备工作

门槛很低，只需要：

1. **一个域名**（几十块钱随便买个便宜后缀就行）
2. **域名 DNS 托管在 Cloudflare**（如果你的网站已经托管在 CF，这一步都不用管）；如果已经有域名，可以参考小墨同学这篇CF域名托管教程。
3. **一个真实可用的主邮箱**（推荐 Gmail 或 Outlook 等），用来接收所有的转发邮件

## 具体配置步骤

第一步：开启域名邮件路由

进入 Cloudflare 控制台，点进你要用的那个域名。 在左侧菜单里依次点击 **“电子邮件服务”** -> **“电子邮件路由”**。

![图片展示的是Cloudflare控制台中“电子邮件路由”页面。左侧菜单栏有“电子邮件路由”选项被红色框突出显示。右侧页面上方显示“电子邮件路由”标题，介绍可创建自定义电子邮件地址并将其路由到验证电子邮件地址或Worker。下方有“Enable Email Routing”提示，强调私密设计、简单免费及可将邮件路由到你最常使用的邮箱。关键部分是页面右上角“Destination Addresses”区域，蓝色按钮“Onward Domain”被红色框突出显示，对应文档中“绑定你的接收邮箱”步骤里点击“Destination address”后填入真实大号邮箱的操作。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YzhkNDgxZmNjZTQ2YmM1ZmFlMTU5OTgzY2Q0M2E2ODRfYmNhNjMyNTQzNjc3Mzc4MzUxMzQzMGNlMWI4ZjhiZDNfSUQ6NzY0NTcxNDMyOTQyOTUxMTM3M18xNzgyMDk5MTY2OjE3ODIxMDI3NjZfVjM)

![图片展示的是Cloudflare控制台中“电子邮件路由”页面。页面上方显示“Email Routing”及创建自定义邮箱地址的说明。关键部分是“Zone”区域，其中“u.xyz”部分被红色框突出显示。下方有“Everything looks good”提示，表明设置无误，可点击“Done”开始使用电子邮件路由。该图片与文档中“第二步：绑定你的接收邮箱”内容相关，直观呈现了在Cloudflare控制台进行电子邮件路由设置时，填写目标地址的区域位置。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZWQzZjBlNTZlNTU0M2RlYzMxN2I0YjNjOGY4ODg4YWNfMWYwZWIzYmU1YWZlMTBkOTY0NzExNWIxNzQwOWM1MGJfSUQ6NzY0NTcxNDMzODc3MDI0Mjc0OF8xNzgyMDk5MTY2OjE3ODIxMDI3NjZfVjM)

**第二步：绑定你的接收邮箱**

所有的影子邮箱都需要一个真实邮箱来接信。

1. 点击 **Destination address**（目标地址）。
2. 在这里填上你的真实大号邮箱（比如你的 Gmail）。

**提醒**：如果这个接收邮箱和你登录 Cloudflare 是同一个邮箱，系统会直接放行。如果是别的独立的邮箱，CF 会发一次验证邮件过去，你去点下确认链接即可。

![图片展示的是Cloudflare的Email Routing页面。页面上方有“Email Routing”标题，下方说明可创建自定义邮箱地址并路由邮件至验证邮箱或Worker。页面中有“Destination Addresses”和“Onboard Domain”按钮，以及“Name”输入框，其中“Name”框内显示了“xxxxx.xyz”。该图片与文档中“第三步：创建自定义前缀”内容相关，用于指导用户在Cloudflare中配置邮箱前缀，是配置步骤中的关键展示页面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Y2QzNWJmMzg2YWVhNDViNDU3NjI3NWQ4NWI4ZjAwNmZfZWE2Y2EyN2EwMWU2NTJjNGIzYTA3NTc3OTE3ODcxYmVfSUQ6NzY0NTcxNDM1NTQ2MzM5MjQ2MV8xNzgyMDk5MTY2OjE3ODIxMDI3NjZfVjM)

![图片展示的是Cloudflare账户中“Destination Address”页面。页面上方显示“Destination Address”及可管理地址用于路由自定义地址等信息，右上角有“Add Address”按钮。中间部分有“Search”搜索框和“Add destination addresses to route emails”提示。下方表格区域显示“Email Address”“Status”“Created”等列，当前无结果。该图片与文档中“第三步：创建自定义前缀”内容相关，用于指导用户在Cloudflare中添加邮箱前缀。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MmY2OThmMTQ2N2Y2OGYwMjg3NTJiZTgxMDZkZjE0YmJfNjhhNzhlNjhmNTNhZWI5NDdjNjMzMTVhMTA5ZTlmNzlfSUQ6NzY0NTcxNDM2Mzc5MzM2MjA5OF8xNzgyMDk5MTY2OjE3ODIxMDI3NjZfVjM)

![图片展示的是Cloudflare账户中“Destination Address”页面，用于管理用于路由自定义地址的地址。页面显示已验证的邮箱地址“xxxx@gmail.com”，状态为“Verified”，创建时间为3月21日。页面右上角有“Add Address”按钮，左上角有“Search”搜索框。该图片与上文“第三步：创建自定义前缀”相关，说明在Cloudflare中已成功添加邮箱地址，为后续配置邮箱前缀做准备。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MWQ5MjViNGIzMTBiNjI3MDk5ZDBkZDgwZjFhYjE2NTZfOWExZTVkODEwMDkyMTY5ZGY4Yjg4YzkzODA1NzY0NjRfSUQ6NzY0NTcxNDM3MzQ2MTMzMTE2MV8xNzgyMDk5MTY2OjE3ODIxMDI3NjZfVjM)

**第三步：创建自定义前缀**

现在开始给自己配邮箱前缀。

1. 切换到 **Routes**（路由规则）标签页。
2. 点击 **Create address**（创建地址）。
3. 自定义前缀随便填（比如 gpt-token、contact）。
4. 在目标邮箱处，选刚才验证过的那个真实邮箱。

![图片展示的是Cloudflare管理界面中Routing Rules页面。页面上方有Overview、Activity Log、Routing Rules、Destination Workers、Settings五个选项卡，当前选中Routing Rules。页面中部显示了Catch-all地址设置，可为该区域所有电子邮件地址设置操作，但仅适用于区域级域名，不能为每个子域名创建Catch-all规则。下方有Custom Address区域，可创建自定义电子邮件地址并设置接收邮件的操作，右侧有“Create Address”按钮。该图与文档中“第五步：开启Catch-all（重点推荐）”的内容相关，用于说明开启Catch-all的操作界面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Y2QxOTQ2NDljNDM2YjBlYTI2M2U4MDJkYzIyNGNiYzJfNzhiNDFmNjI3OGQ4ODlhN2E5NzgxYTYyMjMyYWZiZWVfSUQ6NzY0NTcxNDM4ODkwMDY0NjA3OV8xNzgyMDk5MTY2OjE3ODIxMDI3NjZfVjM)

![图片展示了Gmail中创建自定义邮箱地址的界面。在“Create custom address”部分，输入了“yuge”作为自定义邮箱地址，右侧显示了对应的域名“yuge.xyz”；在“Action”下拉菜单中选择了“Send to an Email”；在“Destination”处输入了“yuge@gmail.com”。界面右下角有“Save”按钮。该图片与文档中“第四步：发邮件测一下”内容相关，用于说明配置完后，拿其他邮箱往刚建好的地址发测试邮件的操作界面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZDc3ODRjMDkwZWQ0ZGQ4MTNkODVmNDQxYTQzZDEwYjhfZTIyZGU4MzNhZGNmZTA0MDZlMWJkYmJjNTY0YjFlMTlfSUQ6NzY0NTcxNDM5ODYzMTM2NTg0MV8xNzgyMDk5MTY2OjE3ODIxMDI3NjZfVjM)

![图片展示的是Gmail邮箱的“Destination Workers”页面设置界面。页面上方有“Overview”“Activity Log”“Routing Rules”“Destination Workers”“Settings”等选项卡。下方“Catch-all address”部分显示“Catch All”地址的Action为“Drop”，Status为“Disabled”。在“Custom address”部分，有“Create Address”按钮，下方列表中“yuge@...yz”地址的Action为“Send to an email”，Destination为“...@gmail.com”，Status为“Active”。该图片与文档中介绍Gmail邮箱配置步骤的内容相关，展示了相关设置界面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZWRhYThkNjk2NDdkZmE1YTBlZjIwM2EzZGU4MTk1MGFfODhiNDE1NTViMTFlZTAxMzRhMWNmMDNlOGJiZDZkZjJfSUQ6NzY0NTcxNDQwODY1NTc2ODc3Ml8xNzgyMDk5MTY2OjE3ODIxMDI3NjZfVjM)

配置完之后，转发规则其实就是这样的：

![图片展示了配置完转发规则后，真正收到邮件的地方。左侧是注册时填的地址，如chat001@yourdomain.com、chat002@yourdomain.com、contact@yourdomain.com等；右侧是真正收到邮件的地址，均为your-gmail@gmail.com。该图片与上文“发邮件测一下”步骤相关，用于说明配置完成后，邮件会转发到指定邮箱，帮助用户验证配置是否成功。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YTE4ZTY2YjNlZWRiZjY3YWU4NDQ3ZTU2MGQ4ZDMwNmRfMTNiOGFkZmIwNTUyNTdmNDNmYWUyNTI4MWY5MjM3ZjhfSUQ6NzY0NTcxNDQyMjUyNzk1NDE0MV8xNzgyMDk5MTY2OjE3ODIxMDI3NjZfVjM)

**第四步：发邮件测一下**

配置完保险起见，拿别的朋友邮箱或者你自己的小号，往刚建好的地址（如 chat001@yourdomain.com）发封测试邮件。然后去你的 Gmail 等着看能不能收到（如果是第一次配，偶尔可能会进垃圾箱，注意看下一眼）。

![图片展示的是Gmail收件箱界面，显示一封来自“yu Han”的邮件，邮件内容为“test”。界面中弹出提示框，显示“此邮件似乎是用英语撰写的”，并有“翻译成中文”选项。该图片与文档中“第四步：发邮件测一下”内容相关，用于说明在配置完转发规则后，拿别的朋友邮箱或小号往刚建好的地址发测试邮件，然后去Gmail查看能否收到邮件的情况，若偶尔可能会进垃圾箱，需注意查看。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NWQ5MzFlOTFkY2UyNjhlNTU3NTM1NmFhZDE5NGJhYWRfMzM5ZDQwYjg4ZWZlMWM1MzRlMTc2OWQ1ZGMxYzc1NzJfSUQ6NzY0NTcxNDQzNjkzODA0MjU1Nl8xNzgyMDk5MTY2OjE3ODIxMDI3NjZfVjM)

**第五步：开启 Catch-all（重点推荐）**

如果每次要用新邮箱都得回 CF 后台配一条规则，那也稍微有点麻烦。Cloudflare 有个一劳永逸的功能：**Catch-all（万能接收地址）**。

开启后，别人往 [@yourdomain](https://x.com/@yourdomain).com 发送任何前缀的邮件（哪怕你从来没在后台设置过这个前缀），CF 也会照单全收，并且原封不动地全部转发到你的主邮箱。

1. 在 **Routes** 页面往下拉，找到 **Catch-all address**。
2. 点击 **Edit**。
3. 把操作选为 **Send to an email**（发送到电子邮件）。
4. 指定你的那个接收目标邮箱。

![图片展示的是Route53的Routing Rules页面。页面上方有Overview、Activity Log、Routing Rules、Destination Workers、Settings等选项卡。在Routing Rules页面中，有“Catch-all address”相关说明，提示可为该区域所有其他电子邮件地址设置操作。下方表格中显示“Catch All”地址，Action为Drop，Status为Disabled，右侧有三个点的图标被红色框突出显示。该图片与上文配置发送到电子邮件的操作步骤相关，展示了操作后的页面情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODExNGIyMGI1M2RhMmYwNmIzZTQxYjMxMWE1M2JiOWVfNDUzYzlmYmY1NDdlOGRmZGY5YzA3NjJiMGMzYmY2MmNfSUQ6NzY0NTcxNDQ1MzE5MDgyMzEyOV8xNzgyMDk5MTY2OjE3ODIxMDI3NjZfVjM)

![图片展示了Route4Me的“Create custom address”页面，用于设置自定义邮箱地址及接收邮件的操作。页面中“Action”下拉框选中“Send to an Email”，“Destination”处显示邮箱地址，右下角有“Save”蓝色按钮。该图片与文档中配置邮箱接收邮件的步骤相关，对应步骤3，即指定接收目标邮箱，步骤4是点击“Save”按钮保存配置。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MTc0MjRhN2RkNTZkOTViYzA2NzFiYzE1NzY2MmUwNjNfN2JhOGRmYTE5NjJlMzNmMjUzNzg3MTk3MWJmOTAxMWNfSUQ6NzY0NTcxNDQ2MDk3MTIyNDI1MF8xNzgyMDk5MTY2OjE3ODIxMDI3NjZfVjM)

最后一步，别忘了回到页面上方点击 **Active** 激活配置（系统会自动帮你把必需的 DNS 解析记录加上）：

![图片展示的是Cloudflare的Routes页面中Catch-all address配置界面。页面上方有“Activity Log”“Routing Rules”“Destination Workers”“Settings”选项卡。下方说明启用Catch-all地址可为该区域的其他电子邮件地址设置操作，但仅适用于区域级域名，不能为每个子域名创建。表格中显示“Catch All”为自定义地址，操作为“Send to an email”，目的地为“hanmu55103@gmail.com”，状态为“Active”（用红色框突出显示），右侧有三个点的图标。该图与上文配置步骤相关，是最后一步激活配置的展示。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NDNlNmZhMWEyNzEyMWIyYmEwNTU1OGJhMDkxOTYzYWFfZGEwZTUxNWI3MTY4ZjBjOGNlNmViYWYwMTIwZTZmNTZfSUQ6NzY0NTcxNDQ3NzA0Nzk5MTUxNV8xNzgyMDk5MTY2OjE3ODIxMDI3NjZfVjM)

## FAQ

**Q: 从平台发验证码过来，延迟大吗？** A: 基本在几秒到一分钟以内就能收到，体验很丝滑。

**Q: 会不会漏信？能收带图的附件吗？** A: 稳定性不错。单封邮件最高支持 **25MB** 的附件转发，接点普通带图邮件没问题。

**Q: 能不能用这些自建邮箱对外发邮件？** A: **不行**。CF Email Routing 只有接收和转发功能。如果有真实的双向收发邮件需求，得去搭配 Resend 或 AWS SES 这种专业的发信服务。

**Q: 可以把不同前缀的邮件，分发给几个不同的邮箱吗？** A: 可以。你可以给同一个域名建无数条路由规则（比如把 gpt@ 的邮件转发给邮箱 A，wechat@ 的邮件转发给邮箱 B）。

## 写在最后

用 Cloudflare 的邮件路由，基本算是零成本解决了大模型多账号注册缺邮箱的燃眉之急。

那么问题来了，**你会用今天这套“无限发号器”囤多少个大模型账号，准备用来做些什么硬核应用呢？欢迎在下方评论区告诉我，我们一起交流探讨。**

如果觉得这篇教程有用，**记得点个赞或分享给身边被“Token 焦虑”困扰的朋友。关注我，持续分享更多实用的效率技巧！**
