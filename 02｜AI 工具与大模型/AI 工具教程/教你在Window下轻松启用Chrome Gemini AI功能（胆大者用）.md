# 教你在Window下轻松启用Chrome  Gemini AI功能（胆大者用）

​

![图片展示了通过OpenCode开启Chrome Gemini AI功能的过程。画面左侧，人物坐在电脑前，准备让OpenCode帮忙开启功能，前提是需使用美国IP，并参考开源项目。中间部分，OpenCode与人物对话交流，准备开启Windows系统的相关功能，随后自动配置。右侧显示配置成功后，Chrome AI与Gemini已启用，还介绍了三开页面玩法，可在右键选项中开启体验升级，以及通过高级设置解决疑难杂症。图片直观呈现了文档中提及的开启Chrome AI功能的操作流程。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YmUxNjRmZTdlOWZhZmE1YjBhYmUyZGNmMGQ0NGY2Y2FfZTUwZTYwNTM3ZTg0ZTNlMDRhNzViMjQ4MzIzOTRhYWJfSUQ6NzY0NjMwOTQ3MzUzNDkzODA0NF8xNzgyMTA3MDA0OjE3ODIxMTA2MDRfVjM)

我看很多AI 教父们，折腾了好久都没成功的。由于最近我算是重度使用OpenCode这个客户端，所以我抱着试试的态度继续打开了OpenCode。

[https://github.com/lcandy2/enable-chrome-ai](https://github.com/lcandy2/enable-chrome-ai) ,首先你可以去看看这个开源项目，然后跟着步骤一步一步操作，应该也是可以开启的。

但我是这么做的，打开OpenCode客户端叫他来帮我完成。当然有个前提哈，你如果在国内那么你尽量使用美国的IP哈。

简单通过几轮回话就轻松搞定开启功能，可以看看我下面的对话过程。

第一步：先问问他这个开源项目用来干什么的

![图片展示了Chrome AI项目用途与功能的说明。内容为图片展示了了Chrome AI项目用途与功能的说明。内容为一个Python工具，用于修改本地Chrome用户配置（Local State）里的字段，将variations_country、variations_permanent_consistency_country设为us，并将is_glic_eligible设为true，从而在不清除数据、不重装的情况下启用Chrome内置AI功能（如Gemini、历史记录AI搜索、DevTools很正常。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MDBiZTM1MDQ4MjRjOWIzMTM2OTY4YjYxNjI3MDE5NGJfZmY2NDIzZGFjODk1YzlkY2FkNjg5YzZhNzkzYjNiM2VfSUQ6NzY0NjMwOTQ4OTYzNzg4NjkzNF8xNzgyMTA3MDA0OjE3ODIxMTA2MDRfVjM)

第二步:看看开源项目具体做了哪些实现

![图片展示了Chrome Gemini AI功能的实现步骤。核心实现在main.py，逻辑直白。包括定位用户数据目录、关闭Chrome、读取版本号、修改Local State、重启Chrome等操作。如按平台枚举Chrome路径，用psutil找进程并kill，读取User Data/Last Version文件，将is_glic_eligible设为true等。最后重启Chrome，等待确认。此图与上文“看看具体这呢实现”相呼应，详细说明了实现过程。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Zjg0NTQ4MDcxZjJkZjhhMWJlNTdlZTZiOTYyNWZmYmRfYmM1OWYxMzk2NWM2NjViOTk5ZDhhMWM0NTU2MWQ3ZTZfSUQ6NzY0NjMwOTUxMDc5OTQ5NDA5Ml8xNzgyMTA3MDA0OjE3ODIxMTA2MDRfVjM)

第三步：告诉他我准备开启

![图片展示的是一个对话界面，用户询问如何在Window下启用Chrome Gemini AI功能，AI回复称可直接执行步骤，但需告知系统和Chrome版本渠道，推荐默认Windows + Stable。AI还提醒在回复前先说明脚本会关闭Chrome并修改User Data/Local State，建议先备份User Data目录。该图片位于文档中介绍启用Chrome Gemini AI功能步骤的上下文，是AI给出的步骤说明部分。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NWMzZWY2ZTdhYmM1ZThkMzVhZGUxMTUwMTU5MDU4MDNfNjZjZTE4NmZmMTA1OTc3MjdjNmIzYTM1NmFkOWViYTVfSUQ6NzY0NjMwOTUyOTIyMzc5MzU5Ml8xNzgyMTA3MDA0OjE3ODIxMTA2MDRfVjM)

他告诉我步骤，想让我自己干，还建议我先备份。

第四步：我告诉他是window系统，你直接开干就完事了。

![图片展示的是一个代码界面，上方显示“window 。不用备份直接干”，下方有“显示步骤 · 40秒”的提示。回复内容提到已帮跑完并打补丁，Chrome被关闭并重启，Local State也已写入，脚本最后等待回车，因无交互输入报了EOFError，不影响前面修改。结果部分显示is_glic_eligible已设为true，variations_country已设为“us”，variations_permanent_consistency_country已更新。最后提示可直接打开Chrome试用内置AI功能，还可验证Local State是否已写入或处理其他渠道。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NGQ5MWVlNjk3NWRkMWUxZGY1MTQ4ZWYxOWM3NDQ2NDZfYWEwYmVmZGNjYTRjYzU2ZTQ3MDZhZDM5ZDExNTMwMGJfSUQ6NzY0NjMwOTU0OTc4ODM2NzgxMl8xNzgyMTA3MDA0OjE3ODIxMTA2MDRfVjM)

如果顺利的话，你会像我一样再次打开Chrome浏览器就看到成功的界面

![图片展示的是Chrome浏览器启用Gemini AI功能后的成功界面。界面上方有Chrome图标和蓝色星形图标，中间文字为“在Chrome中使用Gemini帮助您处理标签页和任务”。下方有两条信息，一是页面内容分享以获取更相关答案，可随时在设置中关闭；二是活动改善Google AI，聊天被审查并用于改进AI，位置信息也与活动一起存储。底部有“不，谢谢”和“是的，我同意”两个按钮。该图与上文介绍启用Chrome Gemini AI功能的步骤相关，是步骤成功后的提示界面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZDllZWQxN2U0ZjRiN2ZmMWFmODIxOTdlZTk3YjVmZGNfZGYxZjI3MTBhZGNhZjI2ZGVlMTNhYjY5MmM5MzE4OGRfSUQ6NzY0NjMwOTU3MTEzNzAxNDcyNl8xNzgyMTA3MDA0OjE3ODIxMTA2MDRfVjM)

然后浏览器的右上角也能看到和使用Gemini了。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Njc1ZDVhYzMxYTVkYzcwYjRiMTBjNjI0YTMzODA1YjhfMGE5OTg4MmI0ZWYyMDY1ZWE0MGJiZWNkYTk4ZDBjNzNfSUQ6NzY0NjMwOTU4ODEwODg3MjY0Nl8xNzgyMTA3MDA0OjE3ODIxMTA2MDRfVjM)

第五步：如果你上面没成功也没关系，放大招

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NDljMDVlMTJlN2FkZjNmZjY3OWU4ZWE0M2U5YmI1MzZfZjk2ZmVkMTQ2NmE2MGI5MTJiZTdlNDMyZTk1ZDNjZTZfSUQ6NzY0NjMwOTYxMTMzNTI1NzAyNF8xNzgyMTA3MDA0OjE3ODIxMTA2MDRfVjM)

按照上图后设置基本大部分人都可以开启了。

第七步:发现了一个三开页面的玩法，真的太棒了。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZDNlY2MxMjUzNDM3ODYzNjlmZDZiNjFjNzUzYWExZWZfOWVkMTI2Yzg2ZjI1ZTNkYzU3Yzg3YTE0ZjBhMDdiYzJfSUQ6NzY0NjMwOTYzMTA1MzA3MzMzOF8xNzgyMTA3MDA0OjE3ODIxMTA2MDRfVjM)

也不清楚它什么时候更新的，反正好用，如何开启呢？

选中Tab 右键中有选项

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NDI0NzVlMmYzMGFmZDg5OGMyZDU2ZDljOTAzZjYyMGJfZWUzMWVlODRiOThmMGJlMGQyM2QzMzM4MzA3MDdlNjRfSUQ6NzY0NjMwOTY1MzE5ODM5MjI4MF8xNzgyMTA3MDA0OjE3ODIxMTA2MDRfVjM)

以后Gemini不用单开Tab 这个体验真的非常棒，好了本文主要内容暂时就到这里了。

你成功开启了吗？

最后在说一下OpenCode我平常用的也蛮多的，尤其是客户端。我也看到它的更新频率非常之高，有时候一天都会上好几个版本，但是你可以不更新，或者每次去更新看看它到底改了什么。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YjE1OGI5NGM3OWMzNGJiMTgxNDA1ODBlYTBjN2U5NDNfYjJkMmFkODEwYjA5ODE4N2U0ZTYzNDAxYzk2NmFiM2FfSUQ6NzY0NjMwOTY3Mzc4ODY3Mjk3M18xNzgyMTA3MDA0OjE3ODIxMTA2MDRfVjM)

现在比半个月前应该完善了很多了。希望国产OpenCode继续保持战略前线，保持好现有的优势。我是怎么开启的呢

---

> 来源：飞书 · AI Spark 知识库 ｜ 原文（最新版）：<https://lcnniolukk80.feishu.cn/wiki/Lb89wEMX5iufMrk9Z8ccK3DOnNh> ｜ 归档：2026-06-01
