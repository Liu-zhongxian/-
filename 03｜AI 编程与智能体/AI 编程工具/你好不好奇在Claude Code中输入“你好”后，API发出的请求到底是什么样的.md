# 你好不好奇在Claude Code中输入“你好”后，API发出的请求到底是什么样的

​

![图片标题为“Claude Code 请求内幕 一次对话到底发了什么？”，展示了Claude Code请求的界面。界面中呈现了POST /v1/messages的请求信息，包括Content-Type、Authorization等内容，还显示了请求的URL、请求体等。右侧有“文本生成”“代码生成”“代码推理”“代码解释”“代码搜索”等标签。该图片与上下文紧密相关，直观呈现了在Claude Code中输入“你好”后，发送给大模型的请求内容，帮助理解请求内幕。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZWVmMmFmNDk4ZTA3OTA4ODRiZTFjNjlmOTBlMzc2MTBfOTNhN2JiODMxNzA2Nzc2NzJiZDE2OGM4OTdmZmYyNTRfSUQ6NzY0NjMwNTU4NTQxMTg4NjAyMl8xNzgyMTA3MjM2OjE3ODIxMTA4MzZfVjM)

相信有超级多的人都跟我一样，现在每天都在使用Claude Code。可能有很多人跟我一样好奇，在Claude Code中输入消息后，发送给大模型的请求中到底包含了什么哪些信息呢？今天刚好有时间就来研究一下。

本文内容目录如下，可进行选看

- 1、在Claude Code中配置自定义的大模型
- 2、本地安装claude-tap插件
- 3、相关配置说明
- 4、启动Claude Code输入“你好”
- 5、查看插件请求消息
- 6、总结

## 一、在Claude Code中配置自定义的大模型

因为众所周知的原因，很多人无法直接使用Claude Opus 4.7相关的系列大模型。所以这里我准备了配置自己想配置的大模型来进行实操。

![图片展示了在MacBook Pro上使用Claude Code v2.1.121运行的界面。左侧显示了模型信息，包括模型名称“inclusionai/ling-2.6-flash:free”及API使用计费等。右侧是欢迎信息，提示“Welcome back @045-2-hello!”，并有“Tips for getting started”等内容。图片中“你好”二字被红色箭头指向，表明这是输入指令“你好”后系统响应的提示语。该图片与文档中介绍Claude Code在输入“你好”后API请求内容的上下文相关，直观呈现了系统反馈。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Nzk2MzkxMDM4ZTAwN2I4MjMwNGMxYTYxYWIwODYzOGFfOTNlYzZlY2ExOWQwYTdlMzRkNTJkYzg4MmQ2M2I5NTZfSUQ6NzY0NjMwNTYwNzA1NDIzMjU0Ml8xNzgyMTA3MjM2OjE3ODIxMTA4MzZfVjM)

首先通过上图可以发现，我这里使用的是 inclusionai/ling-2.6-flash:free 模型，因为就在昨夜蚂蚁宣布开源了Ling-2.6-flash 模型，一款面向真实Agent 工作流的高效指令模型，我特此机会顺便来体验一下。目前这个模型在openrouter中还是免费状态，免费截止时间是5月7日，想体验的抓紧时间了。

它的实战表现：已在 Nanobot、Kilo Code、autonovel 等框架中验证,可用于网页生成、文档起草、群聊信息提取、长篇小说创作(数十分钟产出百万字草稿)等任务。

开源地址：[https://modelscope.cn/models/inclusionAI/Ling-2.6-flash](https://modelscope.cn/models/inclusionAI/Ling-2.6-flash)

如果你想在Claude Code中配置体验这个模型，可以参考我昨天刚写的文章，在文章的第六节有详细的配置指南。

> 4月28日

## 二、本地安装claude-tap插件

这里我先放上插件的开源地址：[https://github.com/liaohch3/claude-tap](https://github.com/liaohch3/claude-tap)

这个插件需要的是python环境，所以如下图直接在Codex App或者其他AI Agent 客户端中进行检查安装

![图片展示了在Codex App中检查Python和uv安装情况的对话界面。上方有“帮我看看python和uv安装了吗”的输入框。下方显示AI回复，已安装的python3版本为3.9.6，python版本为3.122.0，uv版本为0.11.3，路径分别为/usr/bin/python3、/Users/aehyok/.pyenv/shims/python、/Users/aehyok/.local/bin/uv。该图片与上文提到的在Codex App或其他AI Agent客户端中检查安装插件的内容相关，直观呈现了安装结果。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YzRjMGM3NjNiYjk3NTg4YWQ3ZWM5MmVmOTg0OWQzZjNfNzM4MmM5NzEwMTIzMWM0OWYxMTYwZjNmYzJhNDg4NGNfSUQ6NzY0NjMwNTYyODUyODc0MTMwN18xNzgyMTA3MjM1OjE3ODIxMTA4MzVfVjM)

uv就是用来管理python依赖包和创建虚拟环境的，不懂没关系继续问AI就完事了

然后使用uv命令进行安装插件如下图

![图片显示在AI Agent客户端中使用uv命令安装claude - tap插件的过程。界面中先显示了uv的路径及版本信息，随后输入命令“uv tool install claude - tap”进行安装。下方对话窗口显示“\[AI少年\]安装好了，claude - tap==1.1.36已通过uv tool install claude - tap安装成功”，并给出了命令位置，还测试了“claude - tap --help”命令可正常执行。此图与上文提到的使用uv命令安装claude - tap插件的内容相契合，展示了实际安装操作及成功结果。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OGM3ZjkzYWIzM2RhMTA5MzkxYzNlMzc3MzVmYzJhN2RfNGI2ZDVjNmMyMDU4NzNkNTg0MjE5OGU5N2QzNjM3MmRfSUQ6NzY0NjMwNTY0Njk0NjUwMzY1Ml8xNzgyMTA3MjM2OjE3ODIxMTA4MzZfVjM)

这些简单的安装问题，能让AI搞定的就不要手动了，目前来来看没有任何问题。

## 三、相关配置说明

上面安装其实很简单，但是有些配置我在这里说明一下。首先我这里使用的是mac，window或者其他我不太清楚能不能行。

- 1、第一个先来看看我settings.json中的配置信息

![图片展示了在Mac系统中打开的“查看 settings.json”窗口，显示了Claude Code的配置信息。其中，“env”字段下的“ANTHROPIC\\_BASE\\_URL”地址被移除，需通过命令行单独指定代理。窗口中还呈现了“ANTHROPIC\\_AUTH\\_TOKEN”等其他配置项，如“ANTHROPIC\\_DEFAULT\\_HAIKU\\_MODEL”为“inclusinai/ling - 2.6 - flash: free”等。该图片与文档中介绍Claude Code本地安装插件时展示settings.json配置信息的内容相关，直观呈现了配置详情。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Y2QxOTAwZTQ1OWYwNzAxZjM5ZDYxMTlhZGVlM2FkYWVfYjI2ZjJiOTg3NmQyN2VmZjY3NTQyMTNiZTI3NWVjZDVfSUQ6NzY0NjMwNTY2OTI4OTMzMTY2OF8xNzgyMTA3MjM2OjE3ODIxMTA4MzZfVjM)

ANTHROPIC\\\_BASE\\\_URL这个地址我暂时移除掉了，下面会通过命令行单独来指定代理

\\\* 2、我直接使用ghostty打开了两个命令行窗口

![图片展示了在Mac系统中使用claude-tap插件启动Claude Code的界面。左侧命令行窗口显示了相关命令及代理信息，如“claude-tap --top-no-launch --top-target https://openrouter.ai/api --dangerously-skip-permissions --model 'inclusional/ling-2.6-flash:free'”等。右侧Claude Code终端显示“Welcome back 0405-2-hello!”，并有“bypass permissions on (shift+tab to cycle)”提示，还列出“API Usage Billing”等信息。该图片与文档中介绍在本地安装claude-tap插件并启动Claude Code的内容相关，直观呈现了操作结果。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OTRlZWIzNWYyNDQ4NGUwMjFlMzdlNGFjNmMxMDJhNzZfNDFlNGI4NWI4ZDYwMmFhMTNhZWY4MGMxNWRjMmRlOTJfSUQ6NzY0NjMwNTY5MjgzNTUxNTM2NF8xNzgyMTA3MjM2OjE3ODIxMTA4MzZfVjM)

左侧执行api请求代理服务，请使用如下命令开启

```Bash
claude-tap --tap-no-launch --tap-target https://openrouter.ai/api --tap-port 8080 --tap-live


```

右侧执行开启claude code 终端

```Bash
claude-tap --tap-live --tap-target https://openrouter.ai/api -- --dangerously-skip-permissions --model "inclusionai/ling-2.6-flash:free"


```

这样其实就准备完毕了

## 四、启动Claude Code输入“你好”

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=N2M2YmNlNjUwZmM1YTI3YzllNWE3NWY2OWJiYTA4OWZfMmZjYzRkMjhhYjE0MjExNDU2NjRmMWYwOWVlODFiM2RfSUQ6NzY0NjMwNTcxMTg1MzAxMzk2NF8xNzgyMTA3MjM2OjE3ODIxMTA4MzZfVjM)

如果你想看第一个输入请求结束后，那么就可以直接退出右侧的终端，然后去浏览器查看，其实浏览器上面的命令已经打开了。

如果你想多看几个请求，那么你可以多聊几次，然后再退出右侧的终端。

按道理浏览器已经打开了页面，如果没打开你也可以手动在浏览器中输入上图中的Live viewer 红色箭头所指向的地址。

## 五、查看插件请求消息

首先看到如下图所示的请求，那说明上面的配置应该是没问题了。

右上角可以对语言进行切换为中文，方便查看。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MGUzZmE5OWNmYTQ0ZTVkOTM3ODgwZjcwNTg3ODM0MGJfMWViOGQ1ZDIwMzZiMDFiZGY4ZjQ5Yzg0OGZhYTFhYzhfSUQ6NzY0NjMwNTczMzY4NDY5Mzk4NV8xNzgyMTA3MjM1OjE3ODIxMTA4MzVfVjM)

左侧可以看到所使用的具体的模型信息就是inclusionai/ling-2.6-flash:free，右侧则可以清晰的看到第一次发送请求所附加的详细信息。

那接下来怎么从页面一个一个的信息来细看。

- 1、加上我发送的“你好”，总共的输入token：23849。
- 2、请求的时间还是非常快的：3.4s。
- 3、右侧「工具」中主要包括：本地操作、工作流管理、外部访问、交互设置

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NjU1NzRlMjM0ZjFmMDk2M2FlYTdhMTFmNzQ3NzVmYzRfMzk3NDM4ZGJkNmMwODNiZjkxNGJiNmUxYzkxZTQ0YzdfSUQ6NzY0NjMwNTc1NDMyMDk2NDU1N18xNzgyMTA3MjM2OjE3ODIxMTA4MzZfVjM)

\\\* 4、右侧「系统提示词」这个包含的内容比较多

第一部分

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YjVlMzM1ZmZmMjk2ZTdjYjg2ZWEyMTliZjM2N2RjNDBfYTk1NDQ2ZmM5MTdkMmFiZGQ2NjBkOWQxMDUyMDEyNjJfSUQ6NzY0NjMwNTc3NjYyNTY1MDYzMV8xNzgyMTA3MjM2OjE3ODIxMTA4MzZfVjM)

第二部分

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZjNjZThlNGVlNjRjODE1MmQ5OTE1YTllN2MyYjBkMjBfNmY4MWI3OGJiM2ZlZDNmZjEwZWU4YjhkZmMxOWMyOGRfSUQ6NzY0NjMwNTgwMDIwOTc5NjA0NV8xNzgyMTA3MjM2OjE3ODIxMTA4MzZfVjM)

第三部分

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODZiYmY3YTkzNmMzN2E3ZGVkNjRjMTcxYWU3MzcxYzBfMzc0MGM5MDlhOGE5NGQ4Mjk5NDk4MWRiZWU5MTliZGFfSUQ6NzY0NjMwNTgxOTc4NTA3MTU4OF8xNzgyMTA3MjM1OjE3ODIxMTA4MzVfVjM)

第四部分

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NGUwNGUwMzhmMDc4Yzg5ZWUzNzIwMmZlYjdmZDY1MmZfNGRhMzc0NjAxN2I0OTlhYjNkNGJjNzljMWRjMmE5ZDZfSUQ6NzY0NjMwNTg0MjE2OTg5MTgwNF8xNzgyMTA3MjM1OjE3ODIxMTA4MzVfVjM)

- 5、「消息」消息中除了包含我们发送的“你好”，还包括如下图所示的内容

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NmYxMGJlZTFiOGU5ZjA3YThmNWFjMzZiZWNhYWQ1M2ZfMzgzOTZmOWFmNDc4YWY0YTRhMDdkYzMxYzUyNDNhZDNfSUQ6NzY0NjMwNTg2MTY4NjA3MDIwNF8xNzgyMTA3MjM2OjE3ODIxMTA4MzZfVjM)

- 6、响应：就是大模型api返回给我们展示的数据，这个没什么好讲的。
- 7、SSE和JSON可以不用考虑，主要就是上面所有的内容

## 六、总结

但是最后发现了一个问题，缓存问题好像没有生效还是跟什么配置有关系，这个有时间再继续进行研究一下。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NWU4NWI3NGYxOTk2NDVhMTFhODNkYTg0MjkzMjU3ZWNfMjJkMTczMGNkMTZiYTZlODEyMmE5NTk0ZGRkMjcwZDVfSUQ6NzY0NjMwNTg4MzA2NDcxNjIxOV8xNzgyMTA3MjM1OjE3ODIxMTA4MzVfVjM)

输入token有了，输出token也能对的上，但是下面两个cache相关的完全没有值，有没有知道的老铁，告知我一下？

> 💡 **互动时间**：你在开发中还想让哪些 AI 工具协作？有没有遇到什么奇葩的"AI 管理 AI"场景？欢迎在评论区分享 👉 想获取更多 AI 实操干货、工具资源和最新玩法，欢迎加入AI Spark「限时免费」社群 ！一起学习交流 + 资源共享，添加小助理v：rivanow，名额有限，先到先得\~

---

> 来源：飞书 · AI Spark 知识库 ｜ 原文（最新版）：<https://lcnniolukk80.feishu.cn/wiki/K4m7wfjpkiwMr2koy1pcHB0SnXo> ｜ 归档：2026-06-01
