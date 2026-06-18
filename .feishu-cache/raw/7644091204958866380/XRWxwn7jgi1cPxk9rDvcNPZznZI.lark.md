# 原来 Claude Code 还可以这样免费用！5 分钟接入 2300 亿参数模型



![图片展示了Claude Code的免费使用方式。左侧标注“烧钱”和“Claude Code (Anthropic格式)”，中间有“claude”标识，右侧是“free-claude-code代理(8082)”及“格式转换+请求优化”。右侧是“MiniMax M2.7 (23000亿参数)”和“20万上下文”，并有“完全免费”“无需信用卡”“元万上下文”“20万上下文”等标识。该图与文档中介绍免费使用Claude Code的内容相关，直观呈现了其免费代理及模型信息。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=M2U2MDQ0NjlkMzNiZjVkNDE2NjZjZjFhYzg4M2ZjYzVfOWEzNTgyYmE2NWM0NmUxNzc3MDE3ZTg2MjgwZGY5MzJfSUQ6NzY0NTcxMzg4NTA4NDkyOTIxMF8xNzgxNzcwNzkyOjE3ODE3NzQzOTJfVjM)

Claude Code 好用是真好用，烧钱也是真烧钱。

好消息是，NVIDIA 的 [NIM 平台](https://build.nvidia.com/) 免费提供了 100 多个模型的 API，其中就包括 MiniMax 最新发布的 **M2.7** —— 一个 2300 亿参数（MoE 架构，实际激活 100 亿）、20 万上下文窗口、专为编码和 Agentic 场景设计的开源模型。

关键信息：

- **完全免费** —— 不需要信用卡，注册就能用，没有过期时间
- **速率限制** —— 约 40 次请求/分钟，日常开发够用
- **可商用** —— Modified MIT License

模型详情可以看 [NVIDIA 模型页](https://build.nvidia.com/minimaxai/minimax-m2.7) 和 [MiniMax 官方发布说明](https://www.minimax.io/news/minimax-m27-en)。

问题是：Claude Code 默认使用 Anthropic 的接口，而 NVIDIA NIM 提供的是 OpenAI 兼容接口。所以我们需要一个代理，把两边的格式转换一下。

本文用的是社区项目 [free-claude-code](https://github.com/Alishahryar1/free-claude-code)：轻量、Python 运行、不需要 Docker。

整体结构如下：

```Plain Text
Claude Code  ──>  free-claude-code 代理 (:8082)  ──>  NVIDIA NIM (MiniMax M2.7)
Anthropic 格式       格式转换 + 请求优化            OpenAI 兼容格式

```

最终效果是保留两个命令：

```Plain Text
claude       # 原版 Claude Code
claude-free  # 免费代理版，走 MiniMax M2.7

```

这样最清楚：日常轻量任务用 claude-free，关键任务继续用原版 claude。

## 手把手教程：五步接入

## 第一步：注册 NVIDIA 账号并获取 API Key

## 1\\. 注册账号

访问 [build.nvidia.com](https://build.nvidia.com/)，点击右上角的 **“Login”**。

![图片展示的是NVIDIA官网的登录页面。页面上方有“Search”和“Create”按钮，右上角有“Login”按钮。页面中间有“Start Building Your AI Here.”的标题，下方有搜索框及“Build a Clone”按钮。页面左侧有“Use Inference Endpoints”和“Launch a GPU Instance”两个板块，分别列出多种模型和GPU实例选项，如“gpt-neo-4-31b-ll”模型和“NVIDIA S300”“NVIDIA S200”等GPU实例。该图片与文档中“注册NVIDIA账号并获取API Key”步骤相关，是登录NVIDIA官网的界面展示。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Y2M5YTBiMDhhZWE0NzZiOTYzY2E2NjU5ZWQwYTQ4NTJfZjU4YzYyYzJiMTFiNmYyYTE3NjNjNTg3NTQ3NjZhZDFfSUQ6NzY0NTcxMzg5NjY1MjkwMTU1NF8xNzgxNzcwNzkyOjE3ODE3NzQzOTJfVjM)

如果你还没有 NVIDIA 账号，点击 **“Create Account”** 注册。

填写邮箱和密码后，NVIDIA 会发送验证码到你的邮箱。填入验证码后，就能完成邮箱验证。

![图片展示的是NVIDIA官网注册账号页面。页面上方显示“创建您的账户”，下方有“电子邮件”“密码”“确认密码”等输入框，其中“电子邮件”框内显示邮箱地址，密码框为星号。下方有“保持登录”选项，以及“我是真实访客”和“hCaptcha”验证选项。最下方有“创建账户”和“更多注册选项”按钮。该图片与文档中“注册账号”步骤相关，直观呈现了注册NVIDIA账号时的邮箱、密码等输入界面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MTllODkyYjg0NGQ4MjhkZDhkNTY4OTU1NWQ4MGI2N2NfNWU0MWY0ZDY4YzkzM2NmNmYzMGY4ZmZhZmFlOTIwY2VfSUQ6NzY0NTcxMzkxMzg5NTUwNTA3NF8xNzgxNzcwNzkyOjE3ODE3NzQzOTJfVjM)

## 2\\. 手机号验证

邮箱验证通过后，系统会要求进行 **手机号验证**（SMS Verification）：

- 选择国家代码（中国选 +86）
- 输入手机号
- 接收并填写验证码

![图片展示的是MiniMax M2.7模型页面。页面上方有“Verify”按钮，左上角有“Please verify your account to get API access”提示。页面中部有“Start Building Your AI Here.”标题，下方有搜索框及“Build a Claw”按钮。下方展示了“Sequence Endpoints”和“Launch a GPU Instance”部分内容，包括不同模型的名称、参数等信息，部分有“Start”按钮。该图片与文档中“打开MiniMax M2.7模型页面”步骤相关，直观呈现了页面界面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YzE3OGI4NjNmZmYxMDg2NzA5NTU3YTcxYTViOTI3ZjlfMDA4YzI2YWRkZGFjOTczN2YwMGZjMzY4MGI0NmExOGNfSUQ6NzY0NTcxMzkyNzQ0NzM4MzI1Ml8xNzgxNzcwNzkxOjE3ODE3NzQzOTFfVjM)

![图片展示的是MiniMax M2.7模型登录后进行手机号验证的界面。上方提示需通过一次性密码（OTP）验证手机号，以生成API密钥。下方有“Location”下拉框选择国家代码（已选中国+86），“Phone Number”输入框显示手机号码。下方有三个功能介绍框，分别是“Unlimited API requests without daily limits”（无每日限制的无限API请求）、“Launch GPU cloud sandboxes”（启动GPU云沙盒）、“Protect developer community from fraud and abusive users”（保护开发者社区免受欺诈和滥用用户）。最下方有“Send Code via SMS”按钮。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZDIzMjRiZTc4MzZkM2IxYWY1ZmRmMWNmZTcxNzgzZDRfZjM2ZTExNmY1MGQ4N2M4OWE0MTAzZWNhMTg4NDgyMWNfSUQ6NzY0NTcxMzkzNDgwODU1MDYwN18xNzgxNzcwNzkyOjE3ODE3NzQzOTJfVjM)

> **注意：** 部分地区可能收不到验证码。遇到这种情况，可以换手机号，或者过几分钟再试。

## 3\\. 打开 MiniMax M2.7 模型页面

登录后，直接访问：

👉 [build.nvidia.com/minimaxai/minimax-m2.7](https://build.nvidia.com/minimaxai/minimax-m2.7)

这里可以看到模型介绍，也可以直接在右侧 Playground 里试用。

![图片展示了MiniMax M2.7模型页面右上角的用户菜单界面。菜单中“claudecode”选项被高亮显示，其下有“API Keys”“Integrations”“Sign Out”三个选项，其中“API Keys”被红色框线突出显示。该图片与文档中“创建API Key”步骤相关，对应点击页面上“Get API Key”后，再点击“Create API Key”这一操作，直观呈现了操作位置。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OWQ3ZTU4OTEyYjE3ZjgzZWM3OTU4NzIyYjQwZGY3YmZfNmQ5ZTEyZTFiOGYwZGM5ZGJmZWEwNTZjYjg4MjMyZDJfSUQ6NzY0NTcxMzk1Mjg4NTc1NTA5MF8xNzgxNzcwNzkxOjE3ODE3NzQzOTFfVjM)

## 4\\. 创建 API Key

点击页面上的 **“Get API Key”**，再点击 **“Create API Key”**。

系统会生成一个以 nvapi- 开头的 Key。**立即复制保存**，这个 Key 只展示一次。

![图片展示的是Claude Code API Key申请成功后的界面。界面上方显示“API Key Granted”，并说明这是唯一一次显示API Key的机会，仅限API测试使用，有效期为1年。下方有ID、Name、Expiration（到期日）等信息，其中Expiration处以红色框突出显示为“04/19/2027”。下方还有一段提示，强调要保密API Key，不要分享或存储在他人可看到或复制的地方。底部有“Cancel”和“Copy API Key”按钮。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZWFhZjU2ZmRhNWI0ZWI0N2RkYmIzOTk0NmUxYTI2ZWJfM2Q3NTFhNDczOGJmNjEzMmVlOGIwYmE4YTMzZDYzNTNfSUQ6NzY0NTcxMzk2MzQ4OTI5OTY3M18xNzgxNzcwNzkyOjE3ODE3NzQzOTJfVjM)

Key 格式类似：

```Plain Text
nvapi-xxxxxxxxxxxxxxxxxxxxxxxxxx

```

> 后续可以在 [build.nvidia.com/settings/api-keys](https://build.nvidia.com/settings/api-keys) 管理你的 Key。

## 第二步：安装 free-claude-code

前置要求：已安装 **Python 3.14+** 和 [uv](https://docs.astral.sh/uv/)。

如果 Python 版本不够，可以用 uv 安装：

```Plain Text
uv python install 3.14

```

然后克隆项目：

```Plain Text
# 安装 uv（如果还没有）
pip install uv

# 克隆项目
git clone https://github.com/Alishahryar1/free-claude-code.git
cd free-claude-code

```

![图片展示的是在Windows PowerShell中安装uv和克隆free-claude-code项目的操作界面。先是使用pip install uv命令安装uv，显示下载和安装进度；接着执行git clone命令克隆项目，显示远程仓库信息及下载进度。该图片与文档中“第三步：配置代理的.env”内容相关，是安装free-claude-code项目前的准备工作步骤，确保已安装Python 3.14+和uv。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZDM0YzczMzRjMzdjNzI0NWMxYzgyMzRkN2RmZTY2Y2VfNTMyZTJhZTczZTliNGQ1NTE4NTUyMDdhOTJkZGE5MDRfSUQ6NzY0NTcxMzk4MDcwMjQ2MTEzN18xNzgxNzcwNzkyOjE3ODE3NzQzOTJfVjM)

## 第三步：配置代理的 .env

在 free-claude-code 目录下创建 .env 文件：

```Plain Text
# 你的 NVIDIA API Key
NVIDIA_NIM_API_KEY=nvapi-你的实际Key

# 指定使用 MiniMax M2.7
MODEL=nvidia_nim/minimaxai/minimax-m2.7

```

![图片展示了在free-claude-code目录下创建的.env文件内容。文件中包含两个变量设置，分别是NVIDIA_NIM_API_KEY，其值为nvapi，以及MODEL，其值为nvidia_nim/minimaxai/minimax-m2.7。该图片与文档中“第三步：配置代理的.env”内容相关，用于说明在free-claude-code目录下创建.env文件时，变量设置的具体格式和内容，以正确配置代理。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NWZiOGI3ZTkwOWY5MmU2NWVmMDgzNzRmM2JmOTZlMDhfZjZjZDlkYjQ5MGVjYmNiNjViNWY2YmE3MjljZmFlMjZfSUQ6NzY0NTcxMzk5NDE3NDYxNDczMl8xNzgxNzcwNzkyOjE3ODE3NzQzOTJfVjM)

注意变量名必须是：

```Plain Text
NVIDIA_NIM_API_KEY

```

不要写成旧的：

```Plain Text
NVIDIA_API_KEY

```

否则会报：NVIDIA\\\_NIM\\\_API\\\_KEY is not set。

## 第四步：创建 claude-free 命令

不建议直接把代理配置写进全局 settings.json，也不建议长期使用 [\$env](https://x.com/search?q=$env&src=cashtag_click):...; claude 这种临时命令。

原因很简单：Claude Code 启动时仍会读取原来的 settings。如果你的全局 settings 里有 ANTHROPIC\\\_API\\\_KEY、ANTHROPIC\\\_MODEL 之类的配置，临时环境变量可能会和原配置混在一起。

更稳的做法是：给免费代理单独建一个 settings 文件，再用 claude-free 明确加载它。

## 1\\. 创建代理专用 settings 文件

例如放到：

```Plain Text
D:\claude code\configs\claude-free-minimax.json

```

内容如下：

```Plain Text
{
  "autoUpdates": false,
  "autoUpdatesChannel": "stable",
  "env": {
    "ANTHROPIC_BASE_URL": "http://localhost:8082",
    "ANTHROPIC_AUTH_TOKEN": "freecc",
    "DISABLE_AUTOUPDATER": "1",
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1"
  }
}

```

这里的 ANTHROPIC\\\_AUTH\\\_TOKEN=freecc 不是 NVIDIA Key，只是让 Claude Code 不再提示“未登录”。真正调用 NVIDIA 的 Key 已经写在代理的 .env 里。

## 2\\. 添加 PowerShell 函数

打开 PowerShell 配置文件：

```Plain Text
notepad $PROFILE

```

如果文件不存在，先创建：

```Plain Text
New-Item -ItemType File -Force $PROFILE
notepad $PROFILE

```

把下面这段加进去：

```Plain Text
function claude-free {
    & claude --setting-sources project --settings "D:\claude code\configs\claude-free-minimax.json" @args
}

```

保存后，重新打开 PowerShell，或者运行：

```Plain Text
. $PROFILE

```

以后就是两个入口：

```Plain Text
claude       # 原版
claude-free  # 免费代理版

```

## 第五步：启动代理并运行 Claude Code

先打开一个终端，进入 free-claude-code 目录，启动代理：

```Plain Text
uv run free-claude-code

```

也可以用：

```Plain Text
uv run uvicorn server:app --host 0.0.0.0 --port 8082

```

看到类似输出，就说明代理已就绪：

```Plain Text
INFO:     Uvicorn running on http://0.0.0.0:8082

```

![图片展示的是Windows PowerShell界面，显示了启动Claude Code代理的相关信息。界面中输入命令“uv run free-claude-code”，并输出了代理启动的相关日志，如“Started server process”“Master server started”“Application startup complete”等，还提示Uvicorn在http://0.0.0.0:8082运行，按Ctrl+C可退出。该图片与文档中第五步“启动代理并运行Claude Code”的内容相关，直观呈现了代理启动后的状态。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MTk2MjlhNDNmNzZiNjk0MjlhMmIzMDdmNGY0NTdmM2FfODRlYzAzNmVkYTcxOWNkOTZlNGI0M2UwNmM0YjE4MDRfSUQ6NzY0NTcxNDAwODY5MjY0MDk1NF8xNzgxNzcwNzkxOjE3ODE3NzQzOTFfVjM)

保持这个窗口不要关。

然后新开一个终端，运行：

```Plain Text
claude-free

```

![图片展示的是在PowerShell中运行claude-free命令后的界面。界面显示Claude Code v2.1.98版本信息，支持API Key和Usage Billing。下方有“你是什么模型”提示，回答为“我是Claude Sonnet 4.6，由Anthropic开发的大语言模型，我是你的AI内容创作助手，可以帮助你进行文章写作、配图、发布到各种平台等工作，有什么我可以帮你的吗？”。界面底部有“? for shortcuts”提示。该图片与文档中第五步“启动代理并运行Claude Code”内容相关，用于验证claude-free启动成功。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZmMwNzU0YzM1YmM2ZTY1MzQ4ZjdmMWQzYjBjZWU1YmRfZTYxYjRmZDUyMzkxNGQwYzZmOWJhZWUzYmJkOWEzNmJfSUQ6NzY0NTcxNDAxOTc1NTgyMjI2NV8xNzgxNzcwNzkyOjE3ODE3NzQzOTJfVjM)

如果能进入 Claude Code，说明 claude-free 启动成功。至于是否真的走到 NVIDIA NIM，用下一节的方法验证。

## 验证是否生效

不要用“你是什么模型？”来判断是否成功。

原因是：Claude Code 的界面和提示词里仍然可能出现 Claude / Sonnet 字样，后面的模型也可能照着自我介绍说“我是 Claude”。这不一定代表没有走代理。

更可靠的验证方式有两个。

## 方法一：检查代理当前配置

代理启动后，新开一个 PowerShell，运行：

```Plain Text
Invoke-RestMethod -Uri "http://localhost:8082/" -Headers @{ Authorization = "Bearer freecc" }

```

如果返回类似下面这样，就说明代理已经使用 NVIDIA NIM 和 MiniMax M2.7：

```Plain Text
{
  "status": "ok",
  "provider": "nvidia_nim",
  "model": "nvidia_nim/minimaxai/minimax-m2.7"
}

```

![图片展示的是Windows PowerShell界面，显示了检查Claude Code代理配置的命令执行结果。命令为“Invoke-RestMethod -Uri “http://localhost:8882/” -Headers @{ Authorization = “Bearer freecc” }”，返回结果中“status”为“ok”，“provider”为“nvidia_nim”，“model”为“nvidia_nim/minimaxai/minimax-m2.7”。该图片与文档中“方法一：检查代理当前配置”部分对应，用于验证Claude Code代理是否已使用NVIDIA NIM和MiniMax M2.7。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=N2Y3NzZiMmY1YmQyOTA5Njk2OTExZjIxNGViZTM5OTlfMTM5MmQ2MTY3ZjY4M2IwYjY1NDZkZjM0MTM1YTM1YzNfSUQ6NzY0NTcxNDAzNzEyNDE0MDIxMF8xNzgxNzcwNzkyOjE3ODE3NzQzOTJfVjM)

也可以检查健康状态：

```Plain Text
Invoke-RestMethod -Uri "http://localhost:8082/health"

```

返回：

```Plain Text
{
  "status": "healthy"
}

```

## 方法二：看代理窗口日志

运行 claude-free 后，在代理窗口里应该能看到请求日志。只要 Claude Code 发出的请求进了 free-claude-code 代理，就说明它没有直接走原版 Claude API。

你也可以直接让它写代码试试：

```Plain Text
帮我写一个 Python FastAPI 应用，包含用户注册和登录接口

```

![图片展示的是Windows PowerShell界面，显示了大量HTTP请求信息。其中，绿色字体的“200 OK”和“204 No Content”占多数，表明请求成功。还有部分“INFO”信息，如“POST /v1/messages?beta=true HTTP/1.1”等。该图片与文档中“验证是否生效”部分相关，用于直观呈现安装Claude Code后，通过命令行发送请求时的响应状态，辅助验证安装是否成功。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZWRlN2I3ODgwYzExNjRkNDNlZWUwYWMzZmU5YzUwMzRfMGE0ZDRiNDFjNDY0N2I3YTk5MzAxNzg2YmY1NGI2ODVfSUQ6NzY0NTcxNDA0OTYwMjM1ODQ4N18xNzgxNzcwNzkyOjE3ODE3NzQzOTJfVjM)

## 常见问题

![图片是一张表格，列出了使用Claude Code时可能出现的报错或现象、原因及解决办法。如“Not logged in - Please run /login”因缺少ANTHROPIC_AUTH_TOKEN，解决办法是检查代理专用settings里是否有；“NVIDIA_NIM_API_KEY is not set”因变量名写错，解决办法是改成NVIDIA_NIM_API_KEY并重启代理等。该表与文档中“常见问题”部分对应，为用户解决使用中遇到的问题提供了参考。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Njk3YzJkODFjZThlMmYyYjg5YmFkNmI1Yzk5NTIzZTNfYjIwYmIwZTJlZTA4ZDc2MjU2ZWI0MDFiYWZkYWE5YmRfSUQ6NzY0NTcxNDA2MzcyMDQ2NzY2MV8xNzgxNzcwNzkyOjE3ODE3NzQzOTJfVjM)

Windows 如果遇到安装异常，可以试试：

```Plain Text
npm uninstall -g @anthropic-ai/claude-code
npm install -g @anthropic-ai/claude-code@stable
claude --version

```

如果最新版本在你机器上反复安装异常，就先固定在能正常运行的 stable 版本，并关闭自动更新。

## 实际体验与注意事项

## 适合做什么

- ✅ 日常代码生成和编辑
- ✅ 代码解释和技术问答
- ✅ 简单代码审查
- ✅ Bug 修复
- ✅ 原型验证

## 需要注意什么

- ⚠️ 它不是 Claude，风格和能力边界会有差异
- ⚠️ 复杂多步工具调用不如原版稳定
- ⚠️ 免费服务可能遇到限流和排队
- ⚠️ 关键任务建议切回原版 Claude

## 总结

这个方案最适合作为 **Claude Code 的免费备用入口**。

推荐保留两个命令：

```Plain Text
claude       # 原版 Claude Code
claude-free  # 免费代理版，走 MiniMax M2.7

```

日常轻量任务、学习、原型验证，用 claude-free 很划算；复杂多步任务、重要项目，还是建议切回原版 Claude。

一句话：**不要把它当成 Claude 的完全替代品，把它当成一个免费、够用、随时可切换的备用方案，体验最好。**

**觉得有用？转发给身边还在为 Claude Code 账单发愁的朋友，一起白嫖。**

**💡** **更多 AI 干货同步更新公众号：雨哥聊AI，关注我带你玩转 AI 时代**