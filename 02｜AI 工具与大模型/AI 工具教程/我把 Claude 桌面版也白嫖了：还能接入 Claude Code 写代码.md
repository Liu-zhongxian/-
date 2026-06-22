# 我把 Claude 桌面版也白嫖了：还能接入 Claude Code 写代码

![图片展示了接入OpenRouter的CC Switch方案，可让Claude桌面版免费使用。左侧是零成本方案，中间是CC Switch，右侧分别指向Claude Code和Claude Desktop。CC Switch可一键切换模型，支持可视化配置，本地代理支持。OpenRouter提供免费模型，CC Switch可接入Claude Code和Claude Desktop，实现零成本接入。该图与文档中介绍接入OpenRouter方案的内容相契合，直观呈现了方案流程及优势。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MjU2MDA4NjMyYjdlMzk2NTA5NzhmNjk3Y2NhYWM1OGFfNWRlOTA5YmNlYzEwODVjN2Q1NDMzOTJjNGY0MDI4ZjVfSUQ6NzY0NTcxNDY0NzM5MTIyNzA2NV8xNzgyMDk4OTYwOjE3ODIxMDI1NjBfVjM)

> 本文介绍一种零成本使用 Claude Code 和 Claude Desktop 的方案：通过 OpenRouter 上的免费模型 Ling-2.6-1T，配合 CC Switch 这款可视化管理工具，一键切换 API 提供商，实现完全免费的 AI 编程体验。

## 前言

Claude Code 和 Claude Desktop 是 Anthropic 推出的两款强力工具——一个是终端里的 AI 编程助手，一个是桌面端的 AI 对话应用。但它们默认使用 Anthropic 官方 API，按 token 计费，用起来肉疼。

有没有办法白嫖？有。

核心思路：**OpenRouter 提供了免费模型，CC Switch 让你一键把这些模型接入 Claude Code 和 Claude Desktop**，不用手动改配置文件，全程可视化操作。

## 方案概览

```Plain Text
OpenRouter（免费模型 Ling-2.6-1T）
        ↓
  CC Switch（可视化管理 + 一键切换）
        ↓
  Claude Code / Claude Desktop

```

整个流程分三步：

1. 在 OpenRouter 注册并获取 API Key
2. 安装 CC Switch
3. 在 CC Switch 中添加 OpenRouter 提供商，一键切换给 Claude Code 和 Claude Desktop 使用

## 第一步：注册 OpenRouter 并获取 API Key

## 1\\. 注册账号

访问 [OpenRouter](https://openrouter.ai/)，使用 Google 账号或邮箱注册。

## 2\\. 获取 API Key

登录后，进入 **Keys** 页面（[https://openrouter.ai/keys](https://openrouter.ai/keys)），点击 **Create Key**，复制生成的 API Key。

![图片展示了OpenRouter的API Keys页面。左侧导航栏中“API Keys”被红色框突出显示。右侧显示API Keys管理界面，上方有“Create”按钮，下方列出了已有的API Key，其中“claude”API Key被红色框标出。该图片与文档中“获取API Key”步骤相关，对应登录OpenRouter后进入Keys页面，点击Create Key复制生成的API Key这一操作，直观呈现了API Key的管理界面及已生成的API Key示例。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MzNjOTVkMGI3OGE0MzZhZjM2OGVjMWFkNmVhNDcxNzVfZTYzNjhkZWI4NWJhMjRmMDE2MTFiM2Q0OWVjNmYzNWRfSUQ6NzY0NTcxNDY2MDE5MjM3Mzk3MF8xNzgyMDk4OTYwOjE3ODIxMDI1NjBfVjM)

> ⚠️ API Key 只会显示一次，务必保存好。

## 3\\. 找到免费模型 Ling-2.6-1T

在 OpenRouter 的模型列表中，搜索 ling-2.6。这是一个免费模型（标记为 Free），输入和输出都不计费。

![图片展示了OpenRouter平台上的模型列表页面。上方有“Text”“Image”“Embeddings”“Audio”“Video”“Rerank”“Speech”等选项卡。下方列出两个模型，分别是inclusionAI: Ling-2.6-1T (free)和inclusionAI: Ling-2.6-flash (free)。前者为免费模型，将于2026年4月30日到期，适用于Finance和Programming领域；后者同样为免费模型，将于2026年4月29日到期，适用于Finance、Programming和Technology领域。该图片与文档中找到免费模型Ling-2.6的内容相关，直观呈现了可选的免费模型信息。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NmQ5ZDZmM2Y2OWE4ODYyMDM5MzQ5ODhkMzhhNTNlNGNfYTc2N2FlMThlZmYyOTEzNjNiNTllNDZmODgxY2NkOWVfSUQ6NzY0NTcxNDY3NTg5NTY4NDMxNl8xNzgyMDk4OTYwOjE3ODIxMDI1NjBfVjM)

模型 ID 为：

```Plain Text
inclusionai/ling-2.6-1t:free

```

> 💡 OpenRouter 上有不少免费模型，Ling-2.6-1T 是其中表现不错的一个。你也可以根据需要选择其他免费模型。

就算免费期结束，按当前公开价格看，Ling-2.6-1T 也属于很便宜的一档。最近同类模型的价格已经压得很低，后面继续降价也有可能。

## 第二步：安装 CC Switch

[CC Switch](https://github.com/farion1231/cc-switch) 是一款跨平台的桌面应用，专门用来管理 Claude Code、Codex、Gemini CLI、OpenCode、OpenClaw 等 AI 编程工具的 API 提供商。它的核心价值在于：**不用手动编辑配置文件，所有操作都通过可视化界面完成**。

## 主要功能

- **50+ 内置提供商预设** — 包括 OpenRouter、AWS Bedrock 等，填入 Key 即可一键导入
- **一键切换** — 在主界面或系统托盘中直接切换提供商，Claude Code 甚至不需要重启
- **统一 MCP 管理** — 一个面板管理多个工具的 MCP 服务器配置
- **用量追踪** — 跟踪花费、请求数和 token 用量

## 下载安装

前往 [Releases 页面](https://github.com/farion1231/cc-switch/releases) 下载最新版本：

![图片展示的是CC Switch在GitHub Releasess页面的Assets部分。其中，CC Switch-v1.14.1 - Windows Portable.zip和CC Switch-v1.14.1 - Windows.msi两个文件被红色框突出显示。这两个文件分别是CC Switch的便携版和安装版，版本号为v1.14.1，分别有10.9 MB和11.2 MB的大小，发布日期为3天前。该图片与文档中下载安装CC Switch的内容相关，直观呈现了下载链接。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NDZhNGQwMWQ5NDc4NzUyMGE3Yzk5NGE4MzRkMmJjY2FfZGY5ZjhlMzM2NjE2NTcwZDRlM2JlNzNmZDRkYWYyZDhfSUQ6NzY0NTcxNDY4OTk2MzM5NjI4OV8xNzgyMDk4OTYwOjE3ODIxMDI1NjBfVjM)

**Windows：**

下载 CC-Switch-v{version}-Windows.msi 安装包，或 CC-Switch-v{version}-Windows-Portable.zip 便携版，双击安装即可。

**macOS（推荐用 Homebrew）：**

```Plain Text
brew tap farion1231/ccswitch
brew install --cask cc-switch

```

**Linux：**

下载对应格式的安装包（.deb / .rpm / .AppImage）。

## 第三步：在 CC Switch 中配置 OpenRouter

安装完成后，打开 CC Switch，按以下步骤操作：

## 1\\. 添加提供商

点击 **“Add Provider”（添加提供商）**，在预设列表中选择 **OpenRouter**（CC Switch 内置了 50+ 提供商预设，OpenRouter 就在其中）。

![图片展示的是CC Switch中添加新提供商的界面。界面上方有“Claude 供应商”和“统一供应商”选项卡，当前选中“Claude 供应商”。下方是预设供应商列表，其中“OpenRouter”以红色框突出显示。右下角有“取消”和“+ 添加”按钮。该图片与文档中“第三步：在CC Switch中配置OpenRouter”内容相关，用于指导用户在CC Switch中添加OpenRouter提供商。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZjUxMGJlNzlmYTBmNmFkMzc2ZjcyMTA3YjZlYWZlOTFfYWZkZGVkOGRhYjdiNWM3NWRhZmEzNmYyY2FlM2E3NmZfSUQ6NzY0NTcxNDcwMTk5Njk4NTUzMl8xNzgyMDk4OTYwOjE3ODIxMDI1NjBfVjM)

## 2\\. 填入配置

- **API Key**：粘贴你在第一步获取的 OpenRouter API Key
- **Model**：填入 inclusionai/ling-2.6-1t:free（或你选择的其他免费模型 ID）
- **Base URL**：预设会自动填好 [https://openrouter.ai/api/v1](https://openrouter.ai/api/v1)，无需手动修改

![图片展示了Claude桌面版中OpenRouter提供商的配置界面。其中，API Key、Base URL和认证密钥（ANTHROPIC_API_KEY）等关键信息被红色框突出显示。API Key为系统自动生成的密文，Base URL为https://openrouter.ai/api/v1，认证密钥为ANTHROPIC_API_KEY。该图片与文档中“填入配置”步骤相关，直观呈现了配置时需填写的关键信息，帮助用户准确无误地完成配置操作。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=M2JlZmRjYTk4YzBiNDYyYWRlMWU4MGEwOTRiNjIyNzNfNGU3OTIyMDUyOGZmY2IzYWU2ZGM4OTgxMzdiNTMwZmZfSUQ6NzY0NTcxNDcxNjAzMjc5NzkxNl8xNzgyMDk4OTYwOjE3ODIxMDI1NjBfVjM)

## 3\\. 启用提供商

配置完成后，在主界面选中刚添加的 OpenRouter 提供商，点击 **“Enable”（启用）**。

![图片展示了CC Switch界面，其中列出了多个提供商，如default、XueDingToken、Nvidia、DeepSeek、OpenRouter等。OpenRouter提供商下方有一个蓝色的“启用”按钮，该按钮被红色框突出显示。这与文档中“配置完成后，在主界面选中刚添加的OpenRouter提供商，点击‘Enable（启用）’”的内容对应，直观呈现了启用提供商的操作位置。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YmFmNzY0NmZlODZlOThjYTYzNjkzZjYzMDU2OGQwNTJfMzQ1OTcwZDMwOTkxYTMwZjJjMWM0MDg3NWY5YjM5ZGVfSUQ6NzY0NTcxNDczMzMzMjQ2Njg3M18xNzgyMDk4OTYwOjE3ODIxMDI1NjBfVjM)

也可以通过 **系统托盘** 快速切换：右键点击托盘图标，直接选择要使用的提供商，即时生效。

> 💡 Claude Code 切换提供商后**不需要重启**，直接生效。其他 CLI 工具可能需要重启终端。

## 在 Claude Code 中使用

CC Switch 启用 OpenRouter 提供商后，Claude Code 会自动使用新的 API 端点和模型。直接在终端中启动：

```Plain Text
claude

```

![图片展示了Claude Code在终端中启动后的界面。左侧显示当前目录为D:\\claude code，右侧是Claude Code的介绍，包括其基于Anthropic的Claude模型家族，可帮助编写代码、调试程序等。下方有“hi”指令及雨哥回复，表明配置成功。该图与文档中“在Claude Code中使用”部分对应，直观呈现了CC Switch启用OpenRouter提供商后，Claude Code自动使用新API端点和模型的运行状态。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YTcxNDYwZmJkM2NiNzI1OWVlZjZjNzg4NmJjOTI5ZTlfMDI4NzM3MDM1N2E5NjlhMWQ1ZjRlN2RlZTE0ZjhmZDJfSUQ6NzY0NTcxNDc0NzQyNTM2MTEyMF8xNzgyMDk4OTYwOjE3ODIxMDI1NjBfVjM)

发送一条消息测试，如果正常回复，说明配置成功。此时你使用的是 OpenRouter 的免费模型 Ling-2.6-1T，**完全不产生费用**。

## 在 Claude Desktop 中使用

Claude Desktop 不能像 Claude Code 那样直接被 CC Switch 接管配置，需要通过官方的 **3P Gateway** 功能，把桌面版的请求转发到 CC Switch 的本地代理。这样你在 CC Switch 里切换提供商时，桌面版也会跟着热切换。

## 1\\. 在 CC Switch 中开启本地代理

打开 CC Switch 的设置，找到**本地代理**开关并开启。开启后会显示本地代理地址，一般是：

![图片展示的是CC Switch的设置界面，当前处于路由设置页面。界面中“路由”选项被红色框突出显示。在“本地路由”部分，显示了本地路由开关及状态信息，其中“路由总开关”和“路由应用开关”均处于开启状态。下方“路由应用”部分，Claude、Codex、Gemini三个应用的路由开关均关闭。最下方“服务地址”处，显示为“http://127.0.0.1:15721”。该图片与文档中打开Claude Desktop的3P设置步骤相关，是后续配置本地代理地址等操作的界面呈现。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NWI3MzYyOTFiYWQyMDkxODZhOTI5MzgxZDAzNmFmMjJfOTUwYTQyNzZlM2Y4YzNhOGNkNDIyNGM1MDdiOTFhNThfSUQ6NzY0NTcxNDc2MTk3NTQ2NzIwOV8xNzgyMDk4OTYwOjE3ODIxMDI1NjBfVjM)

```Plain Text
http://127.0.0.1:15721

```

把这个地址复制下来，后面要用。

> ⚠️ 一定要通过 CC Switch 的本地代理接入，不要直接填某个 provider 的地址。否则你在 CC Switch 里切换提供商时，桌面版不会跟着切换。

## 2\\. 打开 Claude Desktop 的 3P 设置

在 Claude Desktop 中：

1. 点击左上角菜单（三条横线）
2. **Help → Troubleshooting → Enable Developer mode**
3. **Developer → Configure third-party inference**

![图片展示了Claude Desktop的菜单界面。左侧为菜单栏，点击“Developer”后弹出下拉菜单，其中“Configure Third-Party Inference...”选项被红色框线突出显示。该图片与文档中“打开Claude Desktop的3P设置”步骤相关，对应步骤中的“Developer→Configure third-party inference”操作，直观呈现了在Claude Desktop中开启官方3P配置面板的菜单路径。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YzMwYTNkZjE1OWJmMjM2OTlhNjkzMmM1NzdkZmFkNDlfNzEzNWY0NjRiZWQ4Yjc5ZDQ3MDcyNmMxM2U4OTQ0Y2JfSUQ6NzY0NTcxNDc3NDc0Mjk2MTM0OF8xNzgyMDk4OTYwOjE3ODIxMDI1NjBfVjM)

这会打开官方的 3P 配置面板。

## 3\\. 配置 Gateway 连接

在 Connection 页面选择 **Gateway**，然后填写：

- **Gateway base URL**：http://127.0.0.1:15721（你的本地代理地址）
- **Gateway API key**：PROXY\\\_MANAGED
- **Gateway auth scheme**：bearer
- **Skip login-mode chooser**：建议开启（跳过官方登录，直接走 Gateway）
- 其他字段留空即可
- 点击应用到本地即可

![图片展示了Claude桌面版Connection页面的配置界面。其中“Gateway”选项被红色框突出显示，其下方有Gateway base URL、Gateway API key、Gateway auth scheme等字段，对应填写了http://127.0.0.1:15721、PROXY_MANAGED、bearer等信息。右下角“Skip login-mode chooser”开关也被红色框标出，处于开启状态。该图片与文档中配置Gateway连接的内容相关，直观呈现了配置时的填写项及设置情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OWJmZTY1OGI0YjkyMjBiNjIxOWQzYzE2NzA1NjhkMDVfZWM4OTFkMzRmN2Q1Nzc2MmQxNDQ2NzVkOWZhYjZkY2JfSUQ6NzY0NTcxNDc4ODU1MDc0MTIwMV8xNzgyMDk4OTYwOjE3ODIxMDI1NjBfVjM)

## 4\\. 重启验证

完全退出 Claude Desktop（包括托盘图标），重新打开，发送消息测试。如果正常回复，说明已经成功通过 CC Switch 代理连接到 OpenRouter 的免费模型了。

![图片展示了Claude桌面版中“Code”页面的界面及部分说明。左侧导航栏选中“Code”，右侧显示“Introduction to Coding Session Features”标题，下方有“代码、函数、API、SQL等代码相关功能”等介绍。右侧红框内详细列出主要功能，如代码、函数、API、SQL等代码相关功能，代码文件管理、代码文件搜索、代码文件版本、代码文件版本回滚、代码文件版本回溯、代码文件版本回溯等，还提及代码文件版本回溯、代码文件版本回溯等。该图片与文档中介绍Claude桌面版Code功能的内容相关。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZTBmNmUzNmZmMGM3YWU1YWVmYzBkZDI0ZTJjZDFjZThfYTEzYWI1OTdjOGZiYWRkNmNkZWY3ODE5Y2Q3ZGFmOGFfSUQ6NzY0NTcxNDgwNDgwMzQzOTgyNV8xNzgyMDk4OTYwOjE3ODIxMDI1NjBfVjM)

![图片展示的是CC Switch的设置界面，处于“使用统计”标签页。界面显示了从2024年4月26日19:18到19:17的使用记录，供应商均为OpenRouter，计费模型为claude - haiku - 4 - 5 - 20251001，总成本均为$0.0000，输入输出均为0，用时/首字均为0.8s - 4.1s，状态均为200，来源均为proxy。该图片与文档中配置Gateway连接后重启验证的内容相关，用于展示通过CC Switch连接后的使用情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MTZlYWM2MDE1YjMwYjI2MjYzMDFkMWI1YzYyZjgzYmFfNmNiZWZiN2ZmYTFlYjQyNjhiZTdiOGYxOTI2MTgxYzZfSUQ6NzY0NTcxNDgxNDk0NTMxNjAxOV8xNzgyMDk4OTYwOjE3ODIxMDI1NjBfVjM)

## 注意事项

1. **免费模型的限制**：免费模型通常有速率限制（如每分钟请求次数、每天总 token 数），高频使用可能会被限流。
2. **模型能力差异**：Ling-2.6-1T 并非 Claude 原版模型，能力上会有差异。对于日常编程辅助够用，但复杂推理任务可能不如 Claude 原版。
3. **API 兼容性**：OpenRouter 兼容 OpenAI API 格式，大部分功能可以正常使用，但某些 Anthropic 特有功能可能不支持。
4. **隐私考虑**：你的对话数据会经过 OpenRouter 服务器，注意不要在对话中包含敏感信息。
5. **切换回官方**：想切回 Claude 官方 API？在 CC Switch 中添加一个 “Official Login” 预设，启用后重启 CLI 工具，走官方登录流程即可。

## 总结

1. **注册 OpenRouter** — 注册账号，获取 API Key（2 分钟）
2. **安装 CC Switch** — 下载安装桌面应用（2 分钟）
3. **配置提供商** — 添加 OpenRouter + Ling-2.6-1T，一键启用（1 分钟）

总共不到 5 分钟，你就能拥有一个零成本的 Claude 编程环境。CC Switch 的可视化界面让整个过程告别了手动编辑配置文件的痛苦——添加提供商、切换模型、管理 MCP，全部点点鼠标就搞定。

虽然底层跑的不是 Claude 原版模型，但借助 Claude Code 和 Claude Desktop 优秀的交互体验，日常开发完全够用。

如果你也想低成本把 Claude Code 和 Claude Desktop 跑起来，可以先按这篇试一遍。跑通了的话，也欢迎回来告诉我你用的是哪个模型，实际效果怎么样。

**更多 AI 干货同步更新公众号：雨哥聊AI，关注我带你玩转 AI 时代**
