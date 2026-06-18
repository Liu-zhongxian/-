# Hermes Agent 从零手把手安装使用指南

# Hermes Agent 从零手把手安装使用指南

​

![图片展示了一张宣传海报，背景为深色，前景有科技感的画面，包括城市、车辆等元素。画面左侧有OpenClaw的标志，右侧是一位带有科技风格装饰的女性形象。海报上以白色和黄色大字写着“OpenClaw之后又一现象级的产品 Hermes Agent横空出世”。这张图片位于介绍Hermes Agent的文档开头部分，起到了突出Hermes Agent是继OpenClaw之后的又一重要产品，吸引读者关注的作用。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MmIzYTNmYTJkZDAwMTQ1MjZjYmI3YmJmNjUyNTM3MmRfMDU3NzYzZjZjZWMwYTJkMWNhZGM5OGVlNDhmZDk4YzhfSUQ6NzY0NjMwMzA2NTQ2NDk4MjQ5MF8xNzgxNzcwOTE4OjE3ODE3NzQ1MThfVjM)

Hermes Agent 是 Nous Research 开源的自改进 AI Agent 框架，目前已经拥有31.3K star。而且目前可以通过 OAuth 直连 Claude，不像OpenClaw还需要中间一层联入Claude Code，体验略差。至于Claude 后面会不会也封禁，目前尚不得知了。

如果你想了解一下它是什么可以看看下面这个链接

> 4月8日

项目开源地址：

[https://github.com/NousResearch/hermes-agent](https://github.com/NousResearch/hermes-agent)

## 1、安装

[https://hermes-agent.nousresearch.com/docs/getting-started/quickstart](https://hermes-agent.nousresearch.com/docs/getting-started/quickstart)

官网上有安装命令，你也可以直接复制我下面的指令。

首先在电脑上打开终端命令行工具，输入如下命令

> 注意目前命令支持：Linux、macOS、WSL2（Windows 原生好像还不支持），尽量还要确保本设备Git已可以使用，可以使用git verion命令进行检查

```Bash
## 检查git是否可用

git version



## 打开终端输入如下命令

bashcurl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash


```

这里我看了一下要安装的东西不少，如果网络不好，可能要多等待一会儿。

> 比如 Python 、Node.js、ffmpeg 等所有依赖、仓库克隆，并创建全局 hermes 命令

![图片展示了在终端命令行中执行安装Hermes Agent命令的界面。命令为“curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash”。安装过程中，检测到macos系统，检查uv包管理器并安装，检查Python 3.11.15并安装，检查Git 2.50.1并安装，检查Node.js 24.14.1并安装，检查ripgrep并安装，最后检查ffmpeg。安装完成后显示“everything's installed!”，并列出已安装的uv、Python、Git、Node.js、ripgrep和ffmpeg版本。该图片与文档中安装Hermes Agent的步骤相关，直观呈现了安装过程。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NzFiMzQ4YmNlZjMxM2VkYjdmMjE4OWUzN2NlZDM3ZmZfMTBjMjhjMjk3NDZjZWNiNmU2MzMyYjExZjFiZGZiYjFfSUQ6NzY0NjMwMzA5MDExMDc2MTkyN18xNzgxNzcwOTE4OjE3ODE3NzQ1MThfVjM)

安装完毕之后就可以进行设置了

![图片展示的是Hermes Agent安装完毕后的设置界面。界面上方显示“python - -m hermes_cli.main setup”，下方提示“你想要如何设置Hermes？”并给出两个选项：Quick setup - provider, model & messaging (recommended)和Full setup - configure everything。其中Quick setup被红色箭头指向，且上下文提到选择Quick setup模式，可直接选择大模型，如OpenAI Codex，且能读取本地授权配置，操作较为便捷。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NTA2NWM3ZWVlOGRiYTdlMGNhOWEyMjI1MDI4MmNiMjRfY2MxNjllNWNjZjBkODM1OTdlMDFmOGVjZGM3N2RkNDhfSUQ6NzY0NjMwMzExMDk4OTk0MTcxOF8xNzgxNzcwOTE4OjE3ODE3NzQ1MThfVjM)

这里我选择Quick setup模式

![图片展示的是Hermes Agent安装完毕后进行设置时的界面。界面上方显示“Select provider:”，下方列出多个提供商选项，包括Nous Portal、OpenRouter、Anthropic、openAI Codex、GitHub Copilot、Hugging Face Inference Providers等，其中openAI Codex被红色箭头指向。该图片与上下文紧密相关，上下文提到安装完毕后选择Quick setup模式，此图正是在介绍选择大模型提供商的步骤，直观呈现了选择提供商的界面及当前选中的提供商。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NWU5ZGFhMTcwYzY2MDIzYjRiYTg4NmNlYWFlNDZhZTlfOTFkNmU1ZWQ4Y2JjNjViMjA4MGZlYjNhOWZmYmM2NTZfSUQ6NzY0NjMwMzEzMDU2NTQ2Mjk3MV8xNzgxNzcwOTE4OjE3ODE3NzQ1MThfVjM)

然后进行选择大模型,你可以直接选择Claude、OpenAI等，这里我直接选择OpenAI Codex，这里选择完毕，它直接读取我原来本地的OpenAI Codex的授权配置了，有点方便。

![图片展示的是Hermes Agent安装完毕后的设置界面。界面上方提示是否连接消息平台，有“Set up messaging now (recommended)”和“Skip - set up later with 'hermes setup gateway'”两个选项。当前选中的是“Set up messaging now (recommended)”。该图片与上下文紧密相关，上下文提到安装完毕后可进行设置，这里展示了设置时的初始界面，用户可根据自身需求选择是否立即设置消息平台。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZTFkNTU5NmE2NDVmMGM4ZmJlMWFjODY3OTE3MmVjZjZfYzYzYWFhYjk4Nzc1MWUwOTFkOTE1MjE0YjdlZTc0N2JfSUQ6NzY0NjMwMzE1NDY5MDg1MzgyNF8xNzgxNzcwOTE4OjE3ODE3NzQ1MThfVjM)

这里如果选择第二个跳过，然后可以直接终端命令行中输入命令hermes，就可以看到如下界面，直接在命令行中进行聊天了。

说明我们的Hermes初步安装完毕。

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NmI4MDYzNmRhYTY1Y2M2Y2IzYzlmMTZkMGI5OTgxNThfZGQ3NDM0ZDdhNDEyMjU1NGJkNmQzM2YzMmE0NWRiNTdfSUQ6NzY0NjMwMzE3NDI5MDU0MTU0MF8xNzgxNzcwOTE4OjE3ODE3NzQ1MThfVjM)

如果你想继续配置聊天机器人可以重新运行命令

```Bash
hermes gateway setup


```

同样会跳转到配置聊天机器人的相关配置

## 2、配置聊天机器人

上面如果我们没有选择Skip，选择Set up messaging now, 也就是对接IM 聊天工具

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZDQ3NzBhZjRmOGY1NTFlYzAyZDAzODdkM2VkYzM0YjVfYzQ1ZDFkNTZmNTM3YWZhYTFjODk3YjBjOGNkMzdkODdfSUQ6NzY0NjMwMzE5NzM3MTg5NDcyNl8xNzgxNzcwOTE4OjE3ODE3NzQ1MThfVjM)

这里我就选择最简单的Telegram来进行配对, 看下图的1234就知道需要先到Telegram进行配置了。

设置完毕再回来设置这个Bot token

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZGY3YjU2ZmFiMzJlOWE1MjFmYzg4M2U1NzUzZGU1YjNfYzY3YmRiZWY5YTAyYjIxZmE4NzJkYmVlMmJjMDMzMGVfSUQ6NzY0NjMwMzIxODg1MDg0MzYxOF8xNzgxNzcwOTE4OjE3ODE3NzQ1MThfVjM)

根据上面这个截图的四部开始

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MzVjMTM1YjkzNzMyZjcwNmFjMGQxYzExNWQ3NjVjNzhfODg3YjZiZDk1ZWM0MTUxYjAyYjg3OTBjZDU1OWRlZDZfSUQ6NzY0NjMwMzIzNzk1Mzg1MDMxMF8xNzgxNzcwOTE4OjE3ODE3NzQ1MThfVjM)

1、打开Telegram，搜索BotFather

2、输入/newbot，设置两个name

将我上面标红的HTTP API也就是 Bot token 复制到命令行工具中

> 注意粘贴后是看不到消息的，直接回车就可以了

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OTFlNGZjNmVmNGM1Nzg0YzcwNTViYTRjYmNjMWJhYzVfZTc0ODJlZmJhYWViNjMwOTAxOWIxMmE2NDliYjQxZjRfSUQ6NzY0NjMwMzI2NDA5ODk3ODc0NF8xNzgxNzcwOTE4OjE3ODE3NzQ1MThfVjM)

这个 user IDs就是前面HTTP API 前面的数字部分，同样复制即可

进入下一步

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZDk2ZmE3YTc4ZDcyYjgwM2I2ZjdiNzEwM2Q0YzMwNGRfNzllMTBiYmFjOTk4MjAwNzY3ZWU5NDVjOGZkZjEyZDZfSUQ6NzY0NjMwMzI4NDcyMjI1Njg1NF8xNzgxNzcwOTE4OjE3ODE3NzQ1MThfVjM)

安装过OpenClaw的可能都熟悉就是要进行配对了

那接下来回到Telegram 工具

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YTY3MDg2MGM1Yzk4NWJlZWY2MzA5NGNkZDJlMjkwMWNfYzYyMTM4NWIxZjE0ZWFiMzVlMmQwMjIxOTY2MDFmOTJfSUQ6NzY0NjMwMzMwODAzMDIwMDc3NV8xNzgxNzcwOTE4OjE3ODE3NzQ1MThfVjM)

点击箭头的链接跳转到聊天机器人

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NjBmYzg5OTFlYThiMGI5YTE3MTQwNzEzZjI4Y2ZlZDdfMDE3YzczMTQ0NzU4ZDI2NzcwOTNhYzk5NmU2ODIzM2VfSUQ6NzY0NjMwMzMyNzY1MTQwMDY3NF8xNzgxNzcwOTE4OjE3ODE3NzQ1MThfVjM)

然后复制上面的命令到终端命令行中执行，执行完毕就可以聊天了

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NjIyYjcyMDA1MWI1MjM0OTMzMzAyODVkODIyMmExYThfYTk2MmRiOTFhZjUwNDJlZTQ0NGVkZjQ5NzFkZWZhYmZfSUQ6NzY0NjMwMzM1MzMwMzYwMDA2MF8xNzgxNzcwOTE4OjE3ODE3NzQ1MThfVjM)

## 3、其他机器人配置

其他聊天机器人同理跟OpenClaw其实没什么区别，详情可以直接参考官网的安装指南，像飞书、企业微信、叮叮等都已支持

[https://hermes-agent.nousresearch.com/docs/user-guide/messaging/](https://hermes-agent.nousresearch.com/docs/user-guide/messaging/)

## 4、命令行指南

可直接命令行输入hermes -h查看指南

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Njg2OTU0MzFkMTY4N2ZiOWE1Y2FhZWRkOTIwMDM2M2NfMmEwOTk2OTU2MjdiZjY5NzVlYjk1NDkxOTJkM2EzOTVfSUQ6NzY0NjMwMzM3Njg2MjQ4MTMzOV8xNzgxNzcwOTE4OjE3ODE3NzQ1MThfVjM)

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZWIzZTA3ZWVlMzUxODY2NDRkOWFlODY5NDU1YjYxZGFfZGUyYzNmZGQ4M2RlMGVjZjc1ZTc5YmU1NDVkMTFmOWNfSUQ6NzY0NjMwMzM5NTA1Mzc1MTI2Ml8xNzgxNzcwOTE4OjE3ODE3NzQ1MThfVjM)

## 5、最后

可以使用命令 hermes doctor 进行检查

![](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZGQyYzg0NzRiZTk1ODE5ZTlmZGQzZDBmNzEzMTY5NzZfZTRjMDU5YjMyMjMyMjQwNWY5NDUzOTc1NjQ1NWQ1NDNfSUQ6NzY0NjMwMzQxNjYyNTE3MTM4NF8xNzgxNzcwOTE4OjE3ODE3NzQ1MThfVjM)

还支持从OpenClaw进行迁移配置，很多命令其实跟OpenClaw大同小异。后续将会继续分享关于hermes-agent的精彩内容。
