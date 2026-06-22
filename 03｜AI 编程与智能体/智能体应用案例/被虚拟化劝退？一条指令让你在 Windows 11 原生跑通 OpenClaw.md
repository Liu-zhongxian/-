# 被虚拟化劝退？一条指令让你在 Windows 11 原生跑通 OpenClaw

![图片展示的是OpenClaw在Windows 11上的宣传图。画面中，一台显示器被链条环绕，屏幕上显示着Windows 11界面及代码指令，画面右下角有“NATIVE SUCCESS”字样。背景为城市夜景。左侧文字为“OpenClaw：原生力量 在Windows 11上彻底释放OpenClaw”。该图片与文档中“直接在Windows 11原生环境中硬刚”的内容相呼应，强调OpenClaw能在Windows 11原生环境中运行。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YWRhMzE4NzE2MTRlYTFiODhmNmZlYzhjNTc1ZTAyOGRfMmYzZjkyOTM2Y2FhMjQ0YmUyZjc5ZGIzOGJjNDhhNjVfSUQ6NzY0NTcxNTUyMzQ4MDg0OTYyM18xNzgyMDk5MDg4OjE3ODIxMDI2ODhfVjM)

前天，腾讯大楼底下出现了一个关于 AI 圈的奇景：为了推动这场前沿的工具革命，腾讯竟然派出了官方的工程师团队，在总部大楼广场直接“摆摊”，手把手免费为每一个路过的路人安装部署 OpenClaw。

![图片展示的是腾讯大楼广场前的场景。广场上聚集了大量人群，许多人排成队列，似乎在等待参与活动。背景中可见腾讯大楼，其玻璃幕墙在阳光下显得格外明亮。周围还有其他高楼大厦，以及一些树木。图片与上文提到的腾讯工程师团队在总部大楼广场手把手免费为路人安装部署OpenClaw的内容相呼应，直观呈现了这一场景。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=N2RhNTA1MDA0NjAzOTNkYWRlNWY3Y2FmY2Q2YTVjZTdfY2U3ZTVjM2NmYWJjZGE2ZDZkNGQ3MGU1MTMzMTU3OTJfSUQ6NzY0NTcxNTUzNjYyNTkxMzAxOF8xNzgyMDk5MDg4OjE3ODIxMDI2ODhfVjM)

这也难怪，最近眼馋 OpenClaw 的人实在太多了。起初我也想老老实实按照官方推荐走 WSL2 虚拟化路线，结果因为系统环境的各种虚拟化限制被按在地上摩擦。痛定思痛后，我决定转换思路：**直接在 Windows 11 原生环境中硬刚。**

经过一轮踩坑，我跑通了一条不需要虚拟机的原生极简安装路径。这篇文章是对这次成功安装并接入 Telegram 机器人的核心复盘，希望能帮大家少走弯路。

## 避坑核心心法（写在开头）

在正式动手前，请牢记以下三点“血泪教训”：

1. **抛弃 PowerShell**：在之后的 npm 命令执行中，PowerShell 的脚本执行策略极易引发玄学拦截报错。**全程请使用具有管理员权限的经典 cmd 窗口。**
2. **提前备好 Git**：很多人以为直接用 npm 就能拉取所有库，但 OpenClaw 的安装包强依赖 Git 客户端。不提前装好 Git，安装过程必然见红。
3. **网络畅通**：确保你的环境能无障碍访问 GitHub、npm 镜像、OpenAI API 以及 Telegram 服务器。

## 一、底层地基准备 (Node.js 与 Git)

第一步，建立干净的运行底层。打开 cmd 执行微软官方的包管理命令：

**1\\. 安装 Node.js**

```Plain Text
winget install OpenJS.NodeJS

```

（安装完成后，**必须关闭当前窗口并新开一个 cmd**，输入 node -v 和 npm -v 验证是否成功读到环境变量）

![图片展示了在Windows系统下使用cmd命令验证Node.js和npm环境变量是否成功的界面。命令“node -v”显示版本号为25.8.0，“npm -v”显示版本号为11.11.0。该图片与文档中“安装Node.js”步骤相关，用于说明安装完成后，必须关闭当前窗口并新开一个cmd，输入node-v和npm-v验证是否成功读到环境变量，以确保原生底子铺好。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODYwYWQ5YTEwZWM5YjVhMDU5NDMwZDdkZDY5MWE1ZGJfNDBhNjFkODgxMmU4ZTllYWJlYjRkODdlNGFkZjUyMDdfSUQ6NzY0NTcxNTU1MTQzNTg4NTc4NF8xNzgyMDk5MDg4OjE3ODIxMDI2ODhfVjM)

**2\\. 安装 Git**

```Plain Text
winget install --id Git.Git -e

```

（同样，重启 cmd 并在新窗口验证 git --version）

![图片展示的是在Windows系统的管理员命令提示符窗口中，验证Git是否安装成功的操作。窗口中输入了“git --version”指令，下方反馈显示Git版本为2.33.0.windows.1。此图片与文档上下文紧密相关，是在文档提到安装Git并重启cmd后，于新窗口进行版本验证步骤的直观呈现，印证了文档中关于安装Git后需验证版本这一操作说明，展示了输入指令及得到反馈版本信息的具体画面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MjUwMjA2NjczZDE5YTgxYTUwMTBmMjFjOTZiMDg2MGNfMTM3MGE1NmE3M2QxNGI1Y2NiMTk3ZjMxZTM3NjRhMjBfSUQ6NzY0NTcxNTU2NDc5OTEwMjE1NV8xNzgyMDk5MDg4OjE3ODIxMDI2ODhfVjM)

至此，原生的底子铺好了。

## 二、安装 OpenClaw：一条关键的护身符指令

如果你直接使用常规的 npm install -g openclaw@latest，在 Windows 下十有八九会因为库依赖树的冲突报错。

**在这里，原生环境能够强制安装成功的“护身符”是追加 --legacy-peer-deps 参数：**

```Plain Text
npm install -g openclaw@latest --legacy-peer-deps

```

![图片展示了在Windows系统下使用npm install -g openclaw@latest --legacy-peer-deps指令安装OpenClaw时的命令行界面。界面中显示了npm缓存验证和压缩信息，以及添加了531个包等安装进度。该图片与文档中介绍在Windows下安装OpenClaw时使用此指令的内容相关，直观呈现了指令执行后的实际效果。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODEzYTk1ZTEyMmM2YmEzNGIwMzQwMmM1OGQ5OWYzZTFfYjFjNzZkZjI3Njc3ZmQ0MGE4ZDgyODE2YzQyMzQwOTNfSUQ6NzY0NTcxNTU3ODQyNjIzMjAxMl8xNzgyMDk5MDg4OjE3ODIxMDI2ODhfVjM)

这条指令能让 npm 在解析依赖时忽略那些会导致冲突的对等依赖树，强行把 OpenClaw 的核心模块塞进你的系统里。 跑完后，新开一个 cmd 执行 openclaw --version，只要不报错，最难的一关就过了。

![图片展示了在Windows系统cmd命令行中执行openclaw --version指令的界面。界面中显示了npm安装531个包耗时9分钟等信息，以及93个包正在寻找资金支持等提示。关键部分是红框突出显示的“openclaw --version”指令及执行结果“2026.3.2”，表明已成功安装OpenClaw并显示其版本号。该图片与上文介绍在Windows下安装OpenClaw时使用--legacy-peer-deps参数成功安装并验证版本的内容相呼应。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NmNiMDNiNzc5MjdkYTA0MTM2MWFhZjQ1Nzk3OTAzOWJfZTZhMjQ4NWQxNDFjNGEwNjI4OTM1YmFjOTNiZWE1Y2RfSUQ6NzY0NTcxNTU5NDUxMTI4OTU1Nl8xNzgyMDk5MDg4OjE3ODIxMDI2ODhfVjM)

## 三、初始化与 Telegram 挂载机制

1\\. 稳健的向导配置

在 cmd 中输入指令启动配置向导：

```Plain Text
openclaw onboard

```

接下来的交互中，我摸索出了一套最稳的“极简起步配置”：

![图片展示了在cmd中输入指令启动配置向导后，配置向导的交互界面。界面中以红色框突出显示了安全确认、模式、模型渠道、认证方式等关键信息，如安全确认选“yes”，模式选“QuickStart”，模型渠道为“OpenAI”，认证方式为“OpenAI Codex (ChatGPT OAuth)”。界面底部还显示了默认模型设置为“openai - codex/gpt - 5.3 - codex”。该图片与上文介绍的初始化与Telegram挂载机制中，使用指令启动配置向导并进行相关配置的内容紧密相关，直观呈现了配置过程中的关键步骤和信息。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODM2NzAzMWFiNDZhOGIyYWFmZGIyMjRiM2E5OTcwZjRfMzk0NTA2Y2NhZDlhODk5MGE0NjhkYjQ1ZWViMmNiN2FfSUQ6NzY0NTcxNTYwOTU4NTc4MTk3NV8xNzgyMDk5MDg4OjE3ODIxMDI2ODhfVjM)

- **安全确认**: 毫不犹豫选 Yes
- **模式**: 选 QuickStart（新手起步不建议选繁冗的进阶模式）
- **模型渠道**: OpenAI
- **认证方式**: 选择 OpenAI Codex (ChatGPT OAuth)，此时会弹出一个浏览器网页让你完成授权。完成后，默认模型保留推荐的 openai-codex/gpt-5.3-codex。
- **通信渠道 (Channel)**: 选择 Telegram (Bot API)。随后按提示填入你从 [@BotFather](https://x.com/@BotFather) 那里申请来的 Bot Token。

![图片展示的是Telegram Bot API创建成功后的提示信息。内容包括祝贺新Bot创建成功，可访问其网址，可添加描述、关于部分和头像，以及Bot命令列表等。还提示在完成Bot创建后，若需更好的用户名可联系Bot Support，强调Bot Token需安全保管，因它可被任何人用于控制Bot。最后给出Bot API的描述链接。该图片与文档中初始化与Telegram挂载机制的上下文相关，是Bot创建成功后的操作指引。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Nzg1MmI5ZGQ5YmFiZTA1YTU1ZDBmNGE5MWQ2ZDVlN2NfYzRjM2FkMjE2YjU1ZmQyMWI1NTNlZDRiOTQwYzA1YzJfSUQ6NzY0NTcxNTYyMjYzMDA1MTAyN18xNzgyMDk5MDg4OjE3ODIxMDI2ODhfVjM)

接下来的 **技能(Skills)** 和 **钩子(Hooks)** 配置，**全部选 No 或 Skip for now**。第一天千万别贪多，先把主链路打通最重要！

![图片展示的是OpenClaw在Windows 11原生环境下的初始化与Telegram挂载机制相关界面。画面中突出显示了“Enter Telegram bot token”（输入Telegram机器人令牌）和“Configure skills now? (recommended)”（现在配置技能？推荐）两处内容，前者要求输入Telegram机器人令牌，后者提示推荐配置技能。此外，还显示了“Selected channels”（选定频道）等信息，以及“Gateway service runtime”（网关服务运行时）等设置选项。该图片与文档中初始化与Telegram挂载机制的上下文紧密相关，直观呈现了操作步骤中的关键提示。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NzNkZDliOTc4ZGE5MDBiMDU2OTU0MWZkNDY4NjVhZTFfNWQzOWEzYzFkZWVkZmZmNDgxZTI1MWVmYTQ0MDNjNTJfSUQ6NzY0NTcxNTYzODg3MDIzMjI2M18xNzgyMDk5MDg4OjE3ODIxMDI2ODhfVjM)

**2\\. 隐藏的最后一步：完成配对授权**

这是教程里极少提及的一个“坑”：哪怕你在向导里填对了 Token，你的 Telegram 机器人依然可能不会搭理你。

**你必须进行一次跨端配对：**

1. 拿起手机，打开 Telegram，给你的这个机器人随便发一句消息（比如 hello）。
2. 机器人会在这时生成并回复你一串 **pairing code（配对码）**。
3. 复制这串验证码，回到电脑的 cmd 窗口，输入：

```Plain Text
openclaw pairing approve telegram <配对码>

```

![图片展示了在Windows系统cmd窗口中执行指令后，Telegram与OpenClaw完成配对互信的界面。窗口中红框突出显示了“openclaw pairing approve telegram DU...”指令及“Approved telegram sender 1...”的响应信息，表明配对成功。这与文档中“你必须进行一次跨端配对”的内容相呼应，即在手机Telegram给机器人发消息后，机器人会回复配对码，复制该码回到电脑cmd窗口执行指令，完成配对互信，使机器人正式苏醒。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=N2YzN2NiZTI5OTY3OGY3ODgzNWQyNjMwNThiZjVjMDRfYzE5YjNmNTM4NmI0MGFhM2Y5ZmI1OTQ0ZjhmZDBjZWVfSUQ6NzY0NTcxNTY1MTc1MDk3MjU5NV8xNzgyMDk5MDg4OjE3ODIxMDI2ODhfVjM)

当这条指令通过后，Telegram 才是真正与你电脑里的 OpenClaw 完成了绑定互信，机器人正式苏醒。能看到界面打招呼就稳了。

![图片展示了Telegram聊天界面中OpenClaw机器人与用户之间的对话。左侧显示机器人回复“你好～我在👋”，并告知其Telegram用户ID为134xxxx，配对码为DUIxxxx，还提示用户向机器人主人申请批准。右侧用户回复“你好啊”，并询问如何称呼机器人，可选择“靠谱助手/技术搭子/有点幽默的电子伙伴”。该图片与上文“你必须进行一次跨端配对”内容相关，直观呈现了配对操作后的机器人回复及用户互动情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZGY3MzNiNTZhZTM3ZGZmZDY1MzBmOTZjNjM3OWI1ZjJfZTZlODM2Y2EyZTk1Mzc1ZDZiYjlmZDgzNTg0ZTBhZDdfSUQ6NzY0NTcxNTY2NTM0MDU1MDMzM18xNzgyMDk5MDg4OjE3ODIxMDI2ODhfVjM)

## 四、进阶：权限切换与网关重启

如果你希望 OpenClaw 在 Windows 上具备更完整的办公能力，可以先把工具权限基线切到 full，cmd 窗口输入下面四条命令：

```Plain Text
openclaw config set tools.profile full
openclaw config validate
openclaw doctor
openclaw gateway restart

```

这 4 条可以理解为 Windows 上让 OpenClaw 进入更适合办公状态的核心命令：

- openclaw config set tools.profile full：把工具权限基线切到更完整的工作档
- openclaw config validate：校验当前配置是否合法，避免错误配置导致网关起不来
- openclaw doctor：检查当前环境、服务状态和常见问题
- openclaw gateway restart：让新配置真正生效，并重启网关服务

![图片展示了在Windows 11系统中使用OpenClaw工具的命令执行界面。画面中突出显示了四条关键指令：将工具权限基线切到full的“openclaw config set tools.profile full”、校验配置的“openclaw config validate”、检查环境等的“openclaw doctor”以及重启网关服务的“openclaw gateway restart”。这些指令对应文档中提到的让OpenClaw进入更适合办公状态的核心命令，直观呈现了操作过程。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=N2NiNWY1YTA5YWQ2MzdjZGZhYWIxMTQ1NjgzOTkwNDVfNjFjMzBhNTIxMTZjODkzMTk4MDljYzQwMjYzMzcxYzlfSUQ6NzY0NTcxNTY4MTYwMTgwMTM5Nl8xNzgyMDk5MDg4OjE3ODIxMDI2ODhfVjM)

![图片展示了在Windows系统下执行“openclaw gateway restart”指令的命令行界面。界面中显示了OpenClaw的相关信息，如版本号、运行状态等。下方有“Doctor warnings”部分，提示了几个警告信息，如“channels.telegram.groupPolicy”配置问题等。还显示了重启的调度任务、发现的僵死网关进程等信息，以及网关重启超时等日志内容。该图片与上文提到的在Windows上让OpenClaw进入更适合办公状态的核心命令相关，直观呈现了执行指令后的反馈结果。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YjQwMDU5MWNkMGZiZDM5Mjg2N2RlZTdkZjJiYTBkZDdfYWNmNGNiZjk4MGFmZDcxYjA5MjUzMzFlZDVjYWJjYzZfSUQ6NzY0NTcxNTY5MTg4MTk5MTM2OV8xNzgyMDk5MDg4OjE3ODIxMDI2ODhfVjM)

如果你想额外确认配置是否已经写入，也可以再执行：

```Plain Text
openclaw config get tools.profile

```

这里的 tools.profile = full，表示把 OpenClaw 的工具能力切换到更完整的默认工作档，更适合个人电脑上的文件处理、命令执行和日常办公辅助场景。

![图片展示了OpenClaw在Windows 11上的权限状态。当前能力包括能执行主机命令、读写工作区文件、做安全审计、用浏览器/网络相关工具、Telegram通道可用等。当前风险点有tools.elevated和gateway.nodes.denyCommands。一句话结论是权限已足够，比标准L2稍高。该图与上文提到的将OpenClaw工具权限基线切到full，校验配置，检查环境及重启网关服务等内容相关，直观呈现了操作后的权限状态。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZTU1YmYxMTgxZWUyZWMyM2VjMmJkZWQ0ZTZhOGQwYzhfODNmNGMyN2RkMDE4ODVjNmEyM2FjNGIwN2VmNGZjZGNfSUQ6NzY0NTcxNTcwNjcyMzA3NzMxMV8xNzgyMDk5MDg4OjE3ODIxMDI2ODhfVjM)

需要注意的是，full 并不等于无限制提权。它表示 OpenClaw 内部工具策略更完整，但仍然会受到网关配置、频道策略、沙箱设置和实际系统权限的影响。

## 五、写在最后：关于那个“不能关”的黑框

环境全部跑通后，OpenClaw 会在后台拉起两个东西：

- 一个让你在浏览器里查看状态的本地管理网关网页（如有防火墙拦截提示，请务必点击“允许”）。

![图片展示的是OpenClaw在浏览器中显示的本地管理网关网页界面。左侧有“OpenClaw”标识及“OpenClaw Gateway”等选项。右侧上方有“Start Session”按钮，下方有“Message API to send”输入框，提示“Shift+Enter for line breaks, paste images”。右上角有“Stop”按钮。该网页是OpenClaw在后台拉起的用于查看状态的本地管理网关，与文档中提到的在浏览器里查看OpenClaw状态的本地管理网关网页内容对应。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Y2IxMzIxYjE3NjRhZjI2ZDY3NzQyMjIxYzEzMjAzZDlfNzk0ZmRjMGM1ZWUwZjY0ZDgzNTNiZDkxMTlmNTQ5YmNfSUQ6NzY0NTcxNTcyMTEyODg0MDQwMV8xNzgyMDk5MDg4OjE3ODIxMDI2ODhfVjM)

**一个全黑的 OpenClaw Gateway 命令行窗口进程**。

![图片展示的是Windows PowerShell界面，显示OpenClaw 2026.3.2版本信息及医生警告。警告内容指出，channels.telegram.groupPolicy是“allowlist”但groupAllowFrom（和allowFrom）为空，所有群消息将被静默丢弃，建议添加发送者ID到channels.telegram.groupAllowFrom或channels.telegram.allowFrom，或设置groupPolicy为“open”。界面还显示了OpenClaw Gateway、Telegram等服务的启动信息及部分日志内容。该图片与文档中介绍OpenClaw在后台拉起的全黑OpenClaw Gateway命令行窗口进程相关，直观呈现了其运行状态。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NjAxMzFmMDE4NDI4M2Q0NmM3MzhiN2Y3ZDI0YTBjNDlfOGZiYWM4ODczYzhkNjVmNzU5Y2ZiMGZkYjAxNjU5MzNfSUQ6NzY0NTcxNTczMzYzNjU0OTg0N18xNzgyMDk5MDg4OjE3ODIxMDI2ODhfVjM)

**注意：在此后的任何时候，都绝对不要随手点叉关掉这个命令行窗口！** 它是 OpenClaw 持续运行的命脉心脏，承载着网关和 Telegram 长连接服务。一旦关闭，机器人秒断线。

为了日后能随时快速优雅地拉起环境，我强烈建议你在 Windows 桌面上新建一个文本文件，重命名为 start-openclaw.bat，并填入以下保活脚本：

```Plain Text
@echo off
title OpenClaw Gateway
set PATH=%PATH%;%APPDATA%\npm
openclaw gateway --port 18789 --verbose
pause

```

保存后，以后每次只要双击这个图标，所有的代码魔法就会立刻在水下恢复流转。

**最后说两句：** 原生 Windows 环境搞开发确实多灾多难，但放弃繁重的 WSL2 换来的原生轻盈感是极其治愈的。为了跑通这条最简路径，我几乎把 npm 所有的玄学报错都见了个遍。**特别提醒因OpenClaw权限很高，一定要把重要数据进行备份！**

如果这篇带着血泪史的实战指南帮你省下了半天的折腾时间，**请务必顺手点个赞 / 转发**，让更多被 WSL2 劝退的新手看到这条逃生通道！

另外，OpenClaw 跑通只是第一步。**大家下一步准备给它接什么神仙 Skill（技能插件）？或者你卡在了哪一步？欢迎在评论区留言交流！**
