# mac下安装体验OpenCode，四个维度对比Claude Code给我带来的震撼观感

​

![图片展示了Mac 自动生成](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MDU1NWZkYTZmNjlkZjc2NDczNWFlNDNhMWZlNDNlMjRfODhlNmFiOWQ5MTFmYzM4ZGNkY2IwYjI3Yzc3MmI4MDBfSUQ6NzY0NjMwNDU0MDExOTMwNTE1NF8xNzgyMDk4OTY5OjE3ODIxMDI1NjlfVjM)

这是这个系列的第五篇文章，我会把自己最近从零开始梳理，整理 Mac 使用过程中的经验与步骤记录下来，作为留存与分享。如果拿到一台新的Mac电脑，我觉得你有必要来试试这个神级的OpenCode，相同模型他很多情况下竟然比Claude Code还强？

我的Mac使用指南系列文章如下：

- 1、<cite doc-id="JsWtwVCx5iszo4kM19jcWv8lnmd" file-type="wiki" title="Mac使用指南系列文章：Homebrew软件包管理器从入门到精通" type="doc"></cite>
- 2、<cite doc-id="QKCZwzUPBilOBzkdgoKckEITnme" file-type="wiki" title="Mac使用指南系列文章：从零搭建Codex App桌面端结合GitHub CLI，体验 AI 自动化克隆与提交" type="doc"></cite>
- 3、<cite doc-id="Bxb2wD7NJiZ6GqkMtzOcluCunvg" file-type="wiki" title="Mac使用指南系列文章：告别自带终端，Mac装机首选的 AI 友好型终端 Ghostty 配置指南" type="doc"></cite>
- 4、<cite doc-id="AE2AwTWllii3Wqkt4gNcdQeCncf" file-type="wiki" title="Mac 新机一条 Prompt 搞定 3 个 AI 开发工具：Claude Code + Codex CLI + Gemini CLI" type="doc"></cite>

首先就是在 Mac 电脑上，先安装好Homebrew软件包管理工具（可参考系列第一篇），然后通过Homebrew将Codex App 桌面端安装好（可参考系列第二篇）。

如果你不想装或者用不了Codex App，可以直接下载OpenCode客户端。

官网地址：[https://opencode.ai/download](https://opencode.ai/download)，下载对应的版本进行安装即可，window和mac都支持的，同时mac的话他竟然还支持老的intel芯片系列，非常不错，我的8G 256 mac 战机还能继续再战。并且里面有免费模型可以使用。

![图片展示了mac下安装的OpenCode客户端界面。界面上方显示“New session”，并有“你好”按钮。中间有提示语“你好！很高兴为您服务，请问有什么可以帮您的吗？”。下方有一个输入框，提示“随便问点什么...”，并有“+”图标。底部显示“Build - <inclusionAI: Ring-2.6-1T (free)>”。该图片与文档中介绍mac下安装OpenCode客户端的内容相关，直观呈现了客户端的初始界面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OGE3ZTY2YmVjNDI1Mjc3ZWRhMjdhNGFjNmZkNzk2YmZfNGM1NWQwZDQwYjU3ZWMyNDU3MjM0NjJlNDdiYjZlYWVfSUQ6NzY0NjMwNDU2MTMwMDY1NTA3MF8xNzgyMDk4OTY5OjE3ODIxMDI1NjlfVjM)

在电脑上安装好第一个AI 客户端之后，就可以践行AI First理念，能让AI来帮我们完成的，就坚决不动手了，除非AI搞不定了，那我们再上手干。

本文内容目录如下，可进行选看

- 一、给OpenCode客户端配置免费模型
- 二、准备nodejs环境
- 三、通过OpenCode客户端安装OpenCode CLI
- 四、安装Claude Code并给他配置同样的免费模型
- 五、全文重点：四个终端执行同一个提示词任务
- 六、最后总结

> 第五部分有我录制的精彩小视频可以直接跳过去查看

## 一、给OpenCode客户端配置免费模型

上面文章开头我们已经下载了OpenCode客户端

![图片展示的是OpenCode客户端的“New session”界面。界面上方显示“图片描述专家 自动生成图片描述](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MjU4MzNlYTQwYjNiMDFkYzExYTYzNjNlNGM4MTk1ODZfZTc1OTFhM2Y0NDJiZDFhNGI0ZTA2MzFiNDEwNzg4N2RfSUQ6NzY0NjMwNDU4MTY4OTY5MTA3Ml8xNzgyMDk4OTY5OjE3ODIxMDI1NjlfVjM)

按照上面箭头的位置进行点击选择模型，然后再点击连接提供商

![图片展示的是OpenCode客户端配置免费模型的界面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODNiZDk4YzY2NTBkZjU5YWYwZmNmMDBkYmNiODk4ODRfOTRlMjI1NmI3NTM2Mjc2ZTQ3ODY5Y2I5MjAyNzE4NDhfSUQ6NzY0NjMwNDYxMDY3OTk4MzA1M18xNzgyMDk4OTY5OjE3ODIxMDI1NjlfVjM)

选择OpenRouter，这里为什么选择OpenRouter呢，因为最近蚂蚁百灵刚好开源了一个大模型inclusionai/ring-2.6-1t:free，而且免费到5月15日。

链接地址：[https://openrouter.ai/inclusionai/ring-2.6-1t:free](https://openrouter.ai/inclusionai/ring-2.6-1t:free)

> Ring-2.6-1T 是万亿参数规模的思考模型(激活参数 630 亿),面向真实场景的智能体工作流,擅长编码、工具调用和长程任务,在 PinchBench、ClawEval、TAU2-Bench、GAIA2-search 等基准上表现领先。它支持 high 与 xhigh 两档自适应推理,可按任务复杂度动态分配推理预算,在工具密集和多轮交互中以更低的 token 开销实现更强性能。适用于高级编码智能体、复杂推理流水线及大规模自主系统等对质量、延迟和成本均有严苛要求的场景。

继续操作，选择上图中的OpenRouter

![图片展示的是OpenCode客户端中连接OpenRouter的界面。界面上方有“连接OpenRouter”提示，下方有“OpenRouter API 密钥”输入框，提示输入OpenRouter API密钥以连接账户，并在OpenCode中使用OpenRouter模型。界面底部有“Shell: Install Node.js via Homebrew”提示，以及“提交”按钮。该图片与文档中“给OpenCode客户端配置免费模型””部分相关，是按照文档指引进行操作时，需在OpenRouter平台申请API Keys前的界面展示。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NDA5ZDNjNTBlNWI1MmQ2ZjIzZDU4ZDdkZDcwOWQ2YzVfMzU2YTNjMDgyMTQ3MWQwN2MzMDM1ZDBiNGUzMzI2ODhfSUQ6NzY0NjMwNDYyOTIxMzMwMTY5Nl8xNzgyMDk4OTY5OjE3ODIxMDI1NjlfVjM)

到这里就需要在OpenRouter平台申请API Keys。

在OpenRouter平台[https://openrouter.ai/workspaces/default/keys](https://openrouter.ai/workspaces/default/keys) 设置通用的API Keys，然后复制到上面的截图中点击提交。

> 注意：我超出了每天针对免费模型50次的请求限额，于是我添加 10个积分（也就是充值10美元）之后，即可解锁每日 1000 次免费模型请求。貌似就是20倍请求数量，还是很香的，偶尔想测试一个新模型的长任务应该是绰绰有余了，有兴趣的可以去绑定一下。

API密钥设置好了，该怎么配置我们上面说的免费模型呢

```JSON
"openrouter": {

  "models": {

    "inclusionai/ring-2.6-1t:free": {

      "cost": { "input": 0, "output": 0 },

      "limit": { "context": 262144, "output": 65536 },

      "modalities": { "input": ["text"], "output": ["text"] },

      "name": "inclusionAI: Ring-2.6-1T (free)",

      "reasoning": true,

      "temperature": true,

      "tool_call": true

    }

  }

}


```

直接将上面的json内容拷贝给OpenCode客户端，帮我将上面的模型配置配置到opencode.json中进行使用（它可能找不到路径，你可以根据我下图所示的路径）

![图片展示了在mac下安装OpenCode后，配置免费模型的操作步骤及结果。先是检查opencode配置目录是否存在，接着创建opencode.json配置文件，内容包含schema、provider、models等信息，如inclusionai/ring-2.6-1t:free模型的名称、cost、limit、modalities等参数。最后显示已创建配置文件并配置了openrouter模型，还提及Build - Minimax M2.5 Free耗时1m 29s。该图片与文档中配置免费模型的操作步骤 自动生成](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZjRjNzI4ODA5ZjdlYzYxYTMxMzYwYzQ2MjAyM2IzMWJfZWJmYmM4NTcxNTI1YThlNWFjZWZiN2IyMTE3N2ZkMjhfSUQ6NzY0NjMwNDY1MTgyODQxNTQ1NF8xNzgyMDk4OTY5OjE3ODIxMDI1NjlfVjM)

如上图所示代表暂时配置完毕，关掉OpenCode客户端进行重启

![图片展示了OpenCode客户端界面，搜索框内输入“ring”，下方显示了“inclusionAI: Ring-2.6-1T (free)”等模型选项。该图片与文档中配置免费模型的内容相关，对应上文提到的将json内容拷贝给OpenCode客户端，配置inclusionai/ring-2.6-1t:free模型，重启客户端后可直接选择该模型并输入“你好”测试回消息。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MTA1NmQ4YWFmZjExODhlYTY1ZDZhODlkN2M4ZmI3NDZfYTYyMzZmYzY0Mzg0ZTc0YmZmMmI1NDUxMjA3YjFhMTRfSUQ6NzY0NjMwNDY3MDY4NDg3NTcxOV8xNzgyMDk4OTY5OjE3ODIxMDI1NjlfVjM)

此时就能直接找到我们上面配置的inclusionai/ring-2.6-1t:free，选择之后，再输入个"你好"，看看回不回复消息。

![图片展示了㎞ addCriterion addCriterion addCriterion addCriterion addCriterion](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NDhmNzlmY2JjOTYyMTVkMzhmOWU3NjUzMWMwYzUzNjlfMGZhOTA3NWY5NTNmYjE1Yjk4Y2M1ODEzYmMwYzhkOTlfSUQ6NzY0NjMwNDY5MzU5MzY1NjI1OF8xNzgyMDk4OTY5OjE3ODIxMDI1NjlfVjM)

## 二、准备nodejs环境

为什么要装 Node.js？因为 Claude Code、Codex CLI、Gemini CLI、OpenCode 等 AI 命令行工具都是基于 Node.js 开发的，安装和运行它们都需要 Node.js 环境。

直接打开本地的命令行中输入 \\\`node -v\\\` 如果你看到如下的截图，那就说明node还没有安装

![图片展示的是Mac系统终端界面，显示了用户登录信息及当前时间。在终端命令行中输入“node -v”后，出现“zsh: command not found: node”提示，表明当前系统中未安装Node.js。该图片与文档中介绍准备nodejs环境的内容相关，用于说明若在本地命令行中node -v时出现此提示，即说明node尚未安装，需进行安装操作。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZjMzMTAyOTc2NDZhMjRiZTAwNzQ4YzExZThiMTk5NWFfZGZmYmM1MWVhNmU1YzVhYjRhMTdmZmM5NTJmMTdjZjFfSUQ6NzY0NjMwNDcxNTgwMzg1NTg0NF8xNzgyMDk4OTY5OjE3ODIxMDI1NjlfVjM)

本着AI first的理念，我还是使用Codex App或者OpenCode客户端来安装nodejs，两者都是非常优秀的AI Agent客户端。原则就是能用homebrew来安装的尽量就用homebrew来安装，方便统一。

![图片展示的是OpenCode客户端界面，用户询问“帮我用homebrew安装一下nodejs”，AI回复已用Homebrew安装好Node.js，当前终端默认使用Homebrew版本v25.9.0，npm版本11.12.1，验证结果为`which node`指向`/opt/homebrew/bin/node`。该图片与文档中“准备nodejs环境”部分相关，直观呈现了使用Open文档中提及的安装命令后，OpenCode客户端的反馈情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NTkxOTFjZDljYzE5MGE2NTIwZjlhNTJiZDNjNmJjMmJfZmQzYTU2ZGM2Yjc0MzI0OTI5N2NmODMxM2Y5NWM3MmJfSUQ6NzY0NjMwNDczNzI0NzYyODI2MF8xNzgyMDk4OTY5OjE3ODIxMDI1NjlfVjM)

## 三、通过OpenCode客户端安装 OpenCode CLI

访问opencode官网首页 [https://opencode.ai](https://opencode.ai/)

就可以看到很多种安装方法，这里我使用的是npm进行安装

直接在OpenCode客户端输入安装命令即可

![图片展示了mac下安装OpenCode CLI后OpenCode客户端的界面。界面显示“New session”新会话，提示“Shell 全局安装 opencode - ai npm 包”，并说明opencode - ai已成功安装完成，全局安装了2个包，耗时34秒。还提供了验证安装的命令“opencode --version”。下方有“还有其他需要我帮助的吗？”的询问，以及“随便问点什么...”的输入框，底部有“Build”和“inclusionAI: Ring - 2.6 - 1T (free)”的下拉选项。该图与文档中介绍通过OpenCode客户端安装OpenCode CLI后启动的内容相关。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZTdmNzg4YmQ1ODE4ZjliMjE5MzZhMTYwM2M4NjJhOWFfNTQ4YTA1ZTcxYzU0NDc2MmQxOGFhMGY5MzkyOWYxYTRfSUQ6NzY0NjMwNDc1ODY5MzQ2NTAzMF8xNzgyMDk4OTY5OjE3ODIxMDI1NjlfVjM)

启动之后如下图所示安装

![图片展示了Open OpenCode 客户端的界面。界面上方显示“OpenCode”，中间大字为“opencode”，下方有提示“Ask anything... 'Fix a TODO in the codebase'”和“Build - MiniMax M2.5 Free OpenCode Zen”，底部有“tab agents”“ctrl+p commands”等选项，还提示按“Ctrl+X S”或“/status”查看系统状态信息。界面左下角显示“~/Desktop/github/claudecode-opencode”，右下角显示版本号“1.14.41”。该图片与文档中介绍通过 OpenCode 客户端安装 OpenCode CLI 的上下文对应，直观呈现了安装后的客户端界面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YzFhOTI4YTQyOTMyNTc3MTRhNGZkZmFiZTExYjg5YWNfNjlmN2NhMjY5OTc2ZWFkMDZmY2Y5ZjVmMjExYWZjZDJfSUQ6NzY0NjMwNDc3OTkwNDAxMTIwN18xNzgyMDk4OTY5OjE3ODIxMDI1NjlfVjM)

OpenCode客户端和OpenCode CLI读取的模型都是同一份配置，所以我们在OpenCode客户端中指定的免费模型，在OpenCode CLI 中也是可以使用的。

![图片展示了OpenCode客户端的界面面，背景为蓝色渐变。界面上方显示“OpenCode”标题，下方有“你好”及后续的对话内容，包括系统对用户问候的思考及回应，还提到当前使用的模型为“inclusionAI: Ring-2.6-1T (free)”。界面底部有“Build · inclusionAI: Ring-2.6-1T (free) OpenRouter”字样，以及“11.1K (4%)”和“ctrl+p commands”等信息。该图片与文档中介绍OpenCode客户端安装及使用的内容相关，直观呈现了客户端运行状态。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NDU2MDA4NjJkZGNlMTJjOWY5YmMxYmFkN2MxODAxYmVfN2NmMjg1MjhkNjU5MTEzNWIwNDcyNTVmMDU3MzZmMTBfSUQ6NzY0NjMwNDgwMTAxMzY5NzQ2Nl8xNzgyMDk4OTY5OjE3ODIxMDI1NjlfVjM)

## 四、安装Claude Code并给他配置同样的蚂蚁百灵大模型

在文章开头的mac系列文章的第四篇，里面有详细的安装过程，在文章最后也有配置蚂蚁百灵大模型的方式，只需要重新修改一下模型名称就可以了。

![图片展示的是在macOS系统下，使用vim编辑器打开settings.ring.json文件的内容。文件中“env”部分包含多个配置项，其中“ANTHROPIC_MODEL”和“ANTHROPIC_DEFAULT_HAIKU_MODEL”两个配置项被红色箭头突出显示，其值均为“inclusionai/ring-2.6-1t:free”，表明所使用的模型为蚂蚁百灵大模型。该图片与文档中“安装Claude Code并给他配置同样的蚂蚁百灵大模型”部分内容相关，用于说明配置模型时的具体设置。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YzI2MjZlYWYzMTc2OGM2M2RjYzVmZDE4MmZmNmM4M2VfNThiMTc0MDlkZDEwOTVkMTFlMDllMzE2OWE1NTkxYTFfSUQ6NzY0NjMwNDgyMjQ4MDAxNDI3OF8xNzgyMDk4OTY5OjE3ODIxMDI1NjlfVjM)

然后设置命令行快捷别名

![图片展示的是macOS系统下终端界面，显示了vim编辑的.zshrc文件内容。其中，cc-ring别名被突出显示，其设置为“claude --dangerously -skip -permissions --settings /Users/aehyok/.claude/settings.ring.json”。箭头指向该别名设置，表明这是设置命令行快捷别名cc-ring的步骤。该图片与文档中“设置命令行快捷别名”部分内容对应，是设置cc-ring别名操作的示例呈现。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MTUzMDRkYjYzODYxOTE5ZWJiZTBiY2M3NTAyNTFiNGVfNmIwZWEzODRlNWQ3OWVkMjAzYWUzODI3ZjVhODJlNzJfSUQ6NzY0NjMwNDg0MzkxNzAzNjUwOF8xNzgyMDk4OTY5OjE3ODIxMDI1NjlfVjM)

然后退出并重新加载配置文件，或者关闭当前终端窗口，重新打开一个终端执行cc-ring命令

![图片展示了mac下安装体验OpenCode后，通过OpenCode CLI启动的界面。界面上方显示“Claude Code v2.1.138”，并有欢迎信息及版本号。左侧列出“inclusional/ring-2.6.1t:free”等信息，右侧有“Tips for getting started”等内容。下方是与模型交互的对话区域，显示了“你好”及后续对话内容。底部提示“bypass permissions on (shift+tab to cycle)”。该图与文档中介绍通过OpenCode客户端安装OpenCode CLI并启动的内容相关，直观呈现了启动后的界面情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZWVlZmEwZWM2ZWEyYjYxZjVkYWIwMTkyMmI0MDMzMDZfYzhiNDZiYTA4YzY2YTczNWE0ODgwMTM5ZGY3MjYzZWVfSUQ6NzY0NjMwNDg2NDc4ODAwNzg5Ml8xNzgyMDk4OTY5OjE3ODIxMDI1NjlfVjM)

## 五、全文重点：四个终端执行同一个提示词任务

![图片展示了mac下安装体验OpenCode时，四个终端执行同一个提示词任务的效果。左上为ClaudeCode中蚂蚁百灵大模型，左下为OpenCode中蚂蚁百灵大模型，右上为ClaudeCode中DeepSeek，右下为ClaudeCode中Claude Opus 4.7。四个终端都执行了“生成一个html小游戏：坦克自动对战，并写入到当前文件夹中的单个的html文件，cc -ring.html”任务，先自主规划，然后实现，效果均为一次性执行完毕。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MDExMGM4Yzk0NjQzZDU5ZGI2NDEwZjU0YThlN2MwOGNfMGIyOTE5YzVjMjM2YTI3YTY4OTBlYzAxZDIxNjk4YTZfSUQ6NzY0NjMwNDg4NzcyNjU3NDUyMl8xNzgyMDk4OTY5OjE3ODIxMDI1NjlfVjM)

- 左上：ClaudeCode中蚂蚁百灵大模型
- 左下：OpenCode中蚂蚁百灵大模型
- 右上：ClaudeCode中DeepSeek
- 右下：ClaudeCode中Claude Opus 4.7

四个维度：相同模型不同终端，相同终端不同模型，不同模型不同终端，再加上地标最强Claude Code+ Claude Opus 4.7

四个终端都执行的提示词任务是：

```Plain Text
给我生成一个html小游戏：坦克自动对战,并写入到当前文件夹中的单个的html文件，xxxxx.html


```

四个终端先自主规划，然后实现，都是一次性执行完毕后的效果。下面请看视频的对比效果，跟上面终端的位置是一一对应的。



![图片展示了四个终端执行同一个提示词任务的界面。左上角是Claude Code，使用模型Cla addCriterion图片内容](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OWIzOGRlNTBlZGQ2NWVlNzE0NmZiMjVkYmVhMGVjYjJfZTBhZWE1ZTQ0MzIyZGE4NzZiOThkY2IyZGJmZTc1NTlfSUQ6NzY0NjMwNDkwODA2OTI3NjYwOF8xNzgyMDk4OTY5OjE3ODIxMDI1NjlfVjM)

## 六、最后总结

右下角Claude Code中使用模型Claude Opus 4.7 生成的是最快的，而且多坦克对战，效果还是非常不错的，应该再微调一下效果会更好一些。

左下角OpenCode中使用蚂蚁百灵免费模型的效果还是让我最意外的，没想到能有这样的效果。

而且比左上角同模型的Claude Code中的效果还要好很多，我本以为Claude Code的效果肯定比OpenCode要好的，没想到结果有点意外，当然了测试数据相对样本比较少，应该可以继续多抽几次卡。

右上角的DeepSeek感觉也一般般，甚至也比不上OpenCode的，难道OpenCode的Agent设计有他的独到之处吗？

看来是时候深度体验一波OpenCode，趁着蚂蚁百灵还在免费期也继续深度体验一波。
