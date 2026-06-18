# Mac 新机一条 Prompt 搞定 3 个 AI 开发工具：Claude Code + Codex CLI + Gemini CLI

# Mac 新机一条 Prompt 搞定 3 个 AI 开发工具：Claude Code + Codex CLI + Gemini CLI

​

![图片展示了Mac新机必装的AI命令行工具全家桶，包括Claude Code、Codex CLI、Gemini CLI。Claude Code界面有“Logged in”标识，下方有“Redey to help you build anything”的提示图片与上下文的关系是，上下文提到Mac新机使用时，先安装Homebrew，再通过Homebrew安装Codex App桌面端，此图直观呈现了Mac上可用的AI命令行工具，与上下文介绍的Mac AI开发工具安装背景相契合。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NDQ1MzZmMTlhMjc1MzMwOTE0MTk0NTAwMzZjOWQ5MGNfODAzZjI3ODc0YjEwYzIzYzcxNDk2YTFlNmFjYmY2ODdfSUQ6NzY0NjMwMzQ0ODk3MTIxNzg1OF8xNzgxNzcwNzk2OjE3ODE3NzQzOTZfVjM)

这是这个系列第四篇文章，我会把自己最近从零开始梳理，整理 Mac 使用过程中的经验与步骤记录下来，作为留存与分享。如果拿到一台新的Mac电脑，我最先安装的AI命令行工具肯定是Claude Code了，其实安装也超级简单。

我的Mac使用指南系列文章：

- 1、**<cite doc-id="JsWtwVCx5iszo4kM19jcWv8lnmd" file-type="wiki" title="Mac使用指南系列文章：Homebrew软件包管理器从入门到精通" type="doc"></cite>**
- **2、<cite doc-id="QKCZwzUPBilOBzkdgoKckEITnme" file-type="wiki" title="Mac使用指南系列文章：从零搭建Codex App桌面端结合GitHub CLI，体验 AI 自动化克隆与提交" type="doc"></cite>**
- 3、<cite doc-id="Bxb2wD7NJiZ6GqkMtzOcluCunvg" file-type="wiki" title="Mac使用指南系列文章：告别自带终端，Mac装机首选的 AI 友好型终端 Ghostty 配置指南" type="doc"></cite>

首先就是在 Mac 电脑上，先安装好Homebrew软件包管理工具（可参考系列第一篇），然后通过Homebrew将Codex App 桌面端安装好（课参考系列第二篇）。

在电脑上安装好第一个AI 客户端之后，就可以践行AI First理念，能让AI来帮我们完成的，就坚决不动手了，除非AI搞不定了，那我们再手动上。

本文内容目录如下，可进行选看

- **一、准备nodejs环境**
- **二、一个提示词一起安装三个AI终端工具**
- **三、三个终端工具分别网页授权登录**
- **四、在Ghostty中一个屏幕一起运行三个终端**
- **五、nodejs多版本管理nvm工具使用**
- **六、最后**

## 一、准备nodejs环境

为什么要装 Node.js？因为 Claude Code、Codex CLI、Gemini CLI 等 AI 命令行工具都是基于 Node.js 开发的，安装和运行它们都需要 Node.js 环境。

直接打开本地的命令行中输入 \\\`node -v\\\` 如果你看到如下的截图，那就说明node还没有安装

![图片 自动生成图片描述图片展示的是Mac系统终端界面，显示了用户登录信息及时间，当前目录为“~/”。用户在终端中输入“node -v”命令，但终端提示“zsh: command not found: node”，表明系统中未找到node命令。该图片与文档中 addCriterion在介绍准备nodejs环境时相关，用于说明直接在本地命令行中输入“node -v”命令时，若出现此提示，即说明node尚未安装，需通过Codex App等途径安装nodejs。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZGRkNGZkNDYyMDIwOGUyY2FlZDhiMmQ2NzhhZWY0ZDVfNWNmMDU3ZDc0MWM0NWJkNWFkYWIwMzNiYjgyZjdmNTBfSUQ6NzY0NjMwMzQ2ODA3MzU4NTYyNV8xNzgxNzcwNzk2OjE3ODE3NzQzOTZfVjM)

本着AI first的理念，我还是使用Codex App 来安装nodejs。原则就是能用homebrew来安装的尽量就用homebrew来安装，方便统一，。

![图片展示的是Claude Code在Codex App中的安装界面。界面中显示“帮我用homebrew安装一下nodejs”，下方有“已处理1m”提示。下方内容为AI助手回复，称已用Homebrew装好Node.js，当前终端默认使用的是Homebrew版本，给出具体版本号及npm版本号。还提到验证结果是`which node`指向`/opt/homebrew/bin/node`，可直接运行`node -v`和`npm -v`。该图片与文档中准备nodejs环境及Codex App安装Claude Code等内容相关，直观呈现了安装过程中的关键信息。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NTVkODkxZjY2ZmNhOGYzOTc4MWZlZmM4Yjk3OTFhMGRfOTk3ZGFlYWZkYjI5M2U0OTdjNDhlZTI2NjRiNTI1MWVfSUQ6NzY0NjMwMzQ5MjE0NzM2Njg3OF8xNzgxNzcwNzk2OjE3ODE3NzQzOTZfVjM)

## 二、Codex App下安装Claude Code、Codex CLI、Gemini CLI

看下图就是直接告诉Codex App，“帮我安装Claude Code、 Codex CLI 、 Gemini CLI”。

![图片展示的是Codex App安装Claude Code、Codex CLI、Gemini CLI后的处理结果界面。上方显示“帮我安装Claude Code、Codex CLI、Gemini CLI”，下方提示已处理2分24秒。中间内容表明已安装好三个命令，分别在/opt/homebrew/bin下可用，列出claude、codex、gemini的版本号。底部还提到已确认三个命令指向Homebrew Node的全局安装路径，可直接在终端运行claude、codex、gemini开始登录使用。该图片与文档中介绍在Codex App下安装AI开发工具的内容相关，直观呈现了安装结果。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MTkyNWRhZTEzMzE4MTIzNGQ0YjRmNmEzN2YzZGYzY2VfNDM2YmQ5NDkxYjE1NTU1ZWEwNDQzMThiNjFkN2U1YjlfSUQ6NzY0NjMwMzUxMTcwOTU2Nzk1MF8xNzgxNzcwNzk2OjE3ODE3NzQzOTZfVjM)

三个直接一起安装好了，其实中间处理过程它就是要先检查环境，再进行检查当前命令行终端是否已经安装，没安装就继续执行，安装了，就跳过进行下一个。然后可以分别继续授权登录使用了。

## 三、网页授权登录

第一个先网页授权登录Claude Code

![图片展示的是Claude Code网页授权登录界面。上方有“帮我用网页授权登录一下Claude Code”按钮。下方提示Claude Code网页登录页已打开，当前可选择Google、邮箱、SSO等方式登录，询问用户要走哪种方式，如需代填邮箱可直接发送。界面底部有“要求后续变更”“完全访问权限”等选项，以及“本地模式59%”标识。该图片与文档中网页授权登录Claude Code的内容相关，直观呈现了登录操作界面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZWI1Zjk3NjExOGE2NDhhMWI4OGUwZWJmODRiMTY2OTlfYzZkNDI1MmU4YzY1M2JmZjA0ZjRlMWRiYjRhYzlhNTNfSUQ6NzY0NjMwMzUyOTM3MjI5MDAyMF8xNzgxNzcwNzk2OjE3ODE3NzQzOTZfVjM)

跳转到网页，如果你之前已经在网页登录claude.ai的官网的话，就可以直接点击「授权」就能登录了。

第二个网页授权登录Codex CLI

![图片展示了在Mac新机上使用Claude Code时网页授权登录Codex CLI的操作界面。界面中显示已处理55秒，告知当前停在OpenAI登录页，可选邮箱、Google、Apple、Microsoft、手机登录，询问登录方式。下方显示已处理4秒，确认登录成功，codex login 回调结果为Successfully logged in，codex login status也显示Logged in using ChatGPT，表明Codex CLI已登录状态，可直接使用。该图片与文档中网页授权登录Codex CLI的操作步骤相关，直观呈现了登录过程中的界面情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NDliNzQ0ZmU5OWFhNTJlYWEzMWUxYmE1NWE4ZmNmYmZfNWQ4MzFmMTZhZWEwNjQwNmM0MWNkMGYwN2Q4NDY3M2VfSUQ6NzY0NjMwMzU0ODgwMTYwMDQ4Nl8xNzgxNzcwNzk2OjE3ODE3NzQzOTZfVjM)

第三个网页授权登录Gemini CLI

![图片展示的是Gemini CLI网页授权登录成功后的界面。上方显示“已处理 3m”，”，中间有登录成功提示，表明Gemini CLI已授权登录成功，并用一条最小测试命令验证过登录状态。下方有“请求后续变更”“完全访问权限”等选项，以及“本地模式81%”等信息。该图片与文档中“网页授权登录Gemini CLI”部分对应，直观呈现了Gemini CLI网页授权登录成功的界面情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MDIzMTFjNGQ0MGRiYjEzOGI4NWVhMGU1MDdjZTk5ZTJfNjA5NjIxYmU5ZjFmNzEyNzc1ZTcxZjRhNzRiNmY3MzJfSUQ6NzY0NjMwMzU3MjYxMTA5MTQyMF8xNzgxNzcwNzk2OjE3ODE3NzQzOTZfVjM)

Gemini 网页授权在Codex App 中有一点点奇怪，不过也还好，反正不用自己进行操作Copy ，Codex App会自己进行处理。

![图片展示的是Gemini](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MjcyNzM0M2ZiMWYzMGViMWU5NDA2Yjc0ZWNjMzhlN2ZfOTIyNTZmMmEwZmYxNmNjMmUxMWNjMDQzZmI1MWUyY2NfSUQ6NzY0NjMwMzU5Mzg4ODUzMzQ3OF8xNzgxNzcwNzk2OjE3ODE3NzQzOTZfVjM)

## 四、看终端效果

我本地使用是Ghostty终端。如果你也想安装使用，可以参考我系列文章的第三篇，在开头部分。

![图片展示了Mac新机安装Claude Code、Codex CLI、Gemini CLI后在Ghostty终端的运行效果。左侧Claude Code界面显示欢迎信息，可用Opus 4.7，可使用“/model to change”指令切换模型。中间Codex CLI界面有提示信息，可输入“/”打开命令弹窗。右侧Gemini CLI界面显示欢迎信息，提示可输入消息或文件路径，当前工作空间为“sandbox”。该图直观呈现了三个AI开发工具在终端的运行状态，与文档中介绍安装及使用效果的内容相呼应。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MTgxMTU2N2E3ODdkMTc2YmQ0YmFkMTc2MGJiODA4NjlfZTA1Yzk3MGMwMDRjMTVkMjg3NjdjNTU5MDEwMWY5MzNfSUQ6NzY0NjMwMzYxNDkxMDQzNDI1M18xNzgxNzcwNzk2OjE3ODE3NzQzOTZfVjM)

Ghostty一个屏可以并排或者竖排随意组合，如上图就是1:2:1四个终端一起运行。而且切换方便。

## 五、nodejs多版本管理nvm工具使用

这个多版本管理可能大部分人是不需要的，但是像很多开发者有这个需求，比如有些最新的工具可能需要的nodejs版本比较高，但是自己手里有一些比较老的项目，那么nodejs版本可能就比较低。如何进行切换两个nodejs版本，那么nvm这个工具应运而生了。

还是直接在Codex App中询问AI，一般都是先确认一下，然后再让他直接安装

![图片展示的是Claude Code界面，左侧为项目列表，右侧是查找nvm的对话框。对话内容显示AI少年回复Homebrew里有nvm，可使用brew install nvm安装。对话框下方有“要求后续变更”按钮，右下角显示评分5.5。该图片与文档中介绍nvm工具使用相关，是先确认nvm工具时AI给出的回复示例，体现了在Claude Code中询问AI工具使用情况的操作场景。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NmI3MDEwZWI3OGEzODk4NDViZGJhNjI1NzZlN2QzZWZfMDE1OTllNDZhMzI2NjliNzg0NTg0ODFlMTc0ZDEzNGZfSUQ6NzY0NjMwMzYzNTc3NzE2MjIwMl8xNzgxNzcwNzk2OjE3ODE3NzQzOTZfVjM)

上图就是先简单的确认nvm这个工具。

![图片展示了Claude Code界面中关于nvm工具的使用内容。左侧为聊天记录，右侧是搜索结果，显示了安装nvm，推荐使用Homebrew安装，可直接执行brew install nvm。下方有nvm版本信息及配置情况说明，如创建了~/.nvm等。底部有“直接帮我安装”按钮，以及“要求访问权限”](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZWY0ODcwMDQzNmY2ZGE5NjYxNjE3NzdiM2Y2ZGQzZDZfYTcxMmE2ZmYzYjcxMWI0MzM5ZTIyMjgzZGY1Y2QyNmVfSUQ6NzY0NjMwMzY2MTg3MTY5Njg1NF8xNzgxNzcwNzk2OjE3ODE3NzQzOTZfVjM)

nvm常用指令，可以作为简单的参考，直接问AI它基本都可以帮我直接执行的

![图片展示了nvm常用指令及其作用，包括查看nvm版本、查看本机已安装Node.js版本、查看所有可安装远程Node.js版本、安装最新LTS稳定版、安装指定大版本、安装指定精确版本、切换当前终端使用Node.js版本、查看当前正在使用的Node.js版本、设置默认Node.js版本、查看所有别名、卸载指定Node.js版本、给当前项目指定Node.js版本、根据当前目录的.nvmrc自动切换版本等，这些指令可作为nvm工具使用时的参考。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NmFlYTk2MWRmNGY5NTQyNDMxNzEyYTMzNDdhY2ZjNjFfOTZlMmUzNjcyMDBlNTg0ZGY1ZjA0NDE4YTgwYjE2NzhfSUQ6NzY0NjMwMzY4MDcyMTIyNjY5NF8xNzgxNzcwNzk2OjE3ODE3NzQzOTZfVjM)

## 六、最后

如果你还想在Claude Code中接入第三方大模型 。

例如蚂蚁百灵目前在OpenRouter上直接免费使用：inclusionai/ling-2.6-1t:free，直接链接：[https://openrouter.ai/inclusionai/ling-2.6-1t:free](https://openrouter.ai/inclusionai/ling-2.6-1t:free) 。

这是马爸爸蚂蚁旗下 百灵 Ling-2.6-1T，万亿参数，推理快，适合Agent场景，在AIME26和SWE-bench上的成绩尚可。

具体在Claude Code对接如下：

先找到这个路径：\~/.claude/settings.ling.json（mac），window上可能是C:\\\Users\\\Administrator\\\\.claude。

![图片](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MGQwNDkzZTE0YmY2NjNhMmY1NmZhYWMyOTI2MDY3MzlfODg0OTQ2NDViZTA4MGQ3OGExMjcxM2FlMmM0N2ZjZjdfSUQ6NzY0NjMwMzcwMTQ5NDEwNzA3Nl8xNzgxNzcwNzk2OjE3ODE3NzQzOTZfVjM)

具体配置文件如下

```Plain Text
{

  "env": {

    "ANTHROPIC_BASE_URL": "https://openrouter.ai/api",

    "ANTHROPIC_AUTH_TOKEN": "sk-or-v1-xxxxxxxxxxxxxxxxxxxxxxxx",

    "API_TIMEOUT_MS": "600000",

    "ANTHROPIC_MODEL": "inclusionai/ling-2.6-1t:free",

    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "inclusionai/ling-2.6-flash:free",

    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1"

  }

}


```

这是settings.ling.json中的配置内容，直接复制然后修改成自己的ApiKey就可以使用了。然后就可以直接使用命令

```Bash
claude --settings /Users/aehyok/.claude/settings.ling.json


```

如果觉得敲这个命令有点麻烦可以直接通过alias 设置命令别名，参加下图所示，最终通过cc-ling命令就可以使用，甚至可以更短来呼叫我们的AI终端。

![图片展示了Mac新机使用Claude Code等AI开发工具的界面。上方显示了设置环境变量的代码，包括添加ghostty和Claude Code等命令。下方是终端界面，有多个命令别名设置，如cc-ling等。还呈现了Claude Code的欢迎界面，显示版本号、欢迎语及可用功能，如代码生成等。该图片与文档中介绍Mac新机使用Claude Code等AI开发工具的内容相关，直观呈现了相关操作及工具界面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZjYyMmMyNmE5NDY5NmZhNWYyMDQxMzE0ZWJiMzg4ZTRfOTA3ZGZjMWYxYjkxMjY3ZDI0OGE4ZWY2YjA4M2EwYTFfSUQ6NzY0NjMwMzcyMzI4MzM2ODkyMl8xNzgxNzcwNzk2OjE3ODE3NzQzOTZfVjM)

如果不知道如何通过alias来设置永久短别名，可以简单的叫AI帮你设置，使用。

最后在mac下安装AI终端工具，不知道你有没有体会到简单，就是这么so easy。没有那么多的弯弯绕绕，环境配置。让你在搭建AI环境以及后续使用AI的路上更加顺畅。
