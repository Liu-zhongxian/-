# Claude Desktop 配置第三方 API 保姆级教程

# Claude Desktop 配置第三方 API 保姆级教程

![图片展示了Claude Desktop配置第三方API的保姆级教程，强调不消耗官方额度、支持Cowork/Projects/Artifacts等功能。画面左侧有四个图标，分别代表不消耗官方额度、支持Cowork/Projects/Artifacts、本地配置安全可控、快速接入简单高效。右侧是配置界面，显示使用第三方API配置成功，有“配置成功”标识及“第三方API调用生效”提示，还展示了API相关配置项。该图与文档中介绍Claude Desktop配置第三方API的内容相契合，直观呈现了配置步骤及成功状态。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MzI5ZjE2M2UzZTc4OTg3Y2JlMTI4MjBiMWQ1ZGJhZGNfZjg2ZGIzOTk2Y2U1ZjUxZGEzMmRmMzkwYjExMGRiMDdfSUQ6NzY0NTcxMjI1ODgyMDczODI2NV8xNzgxNzcwNzg4OjE3ODE3NzQzODhfVjM)

这个功能可以把 Claude Desktop 变成你自己的第三方 API 桌面客户端。配置完成后，模型调用会走你填写的第三方 API，不再消耗 Claude 官方订阅额度；但会消耗第三方 API 的额度或余额。

它适合想在 Claude Desktop 里使用 Cowork、Projects、Artifacts 等功能，同时又希望接入自己 API 服务的用户。需要注意的是：第三方模式并不是“完整网页版 Claude”的替代品，官方普通 Chat 标签在这个模式下不可用，主要使用的是 Cowork / Code / Projects / Artifacts 这些能力。

## ⚠️ 重要前提（必须看）

- **必须使用最新版 Claude Desktop**：低版本可能没有开发者模式或第三方推理配置入口。
- **建议先保持未登录状态**：不需要先登录 Claude 官方账号。如果已经登录，建议先退出后再配置。
- **必须使用支持 Anthropic-compatible 的第三方 API**：单纯 OpenAI-compatible 的接口不一定能用。
- **Gateway base URL 需要是 HTTPS 地址**：并且对应服务需要支持 Anthropic Messages API，通常也就是能处理 /v1/messages 请求。
- **注意隐私风险**：你的提示词、文件内容、项目上下文可能会经过第三方 API 服务。不要把敏感资料交给不可信的中转站。
- 本教程以 **Windows** 为例，截图也是 Windows 环境下的界面。

## 步骤 1：打开 Claude Desktop 并启用开发者模式

1. 打开 Claude Desktop，先不要登录官方账号。
2. 如果当前界面不好直接点菜单，可以按键盘 Tab 切到左上角菜单区域，再按回车打开菜单。
3. 在顶部菜单栏选择 **Help（帮助）** → **Troubleshooting（疑难解答）**。
4. 在弹出的子菜单里点击 **Enable Developer Mode（启用开发者模式）**。

![图片展示了Claude Desktop软件的菜单界面。左侧是主菜单栏，有File、Edit、View、Help等选项。右侧是Help菜单下的Troubleshooting子菜单，其中“Enable Developer Mode（启用开发者模式）”选项被红色框线突出显示。该图片与文档中“步骤1：打开Claude Desktop并启用开发者模式”内容相关，直观呈现了在Help菜单下找到并点击“Enable Developer Mode”以启用开发者模式的操作位置。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZWE4ZjgyOTYwMTVmMTYyNTljNDkzNjQ0ODdjYjBmMzVfYmJhYTk5MmY5NTVhNTA4NGVjYTUzMDNlYmQ0NmNhMjlfSUQ6NzY0NTcxMjI3MTA2NjYxNDk2M18xNzgxNzcwNzg4OjE3ODE3NzQzODhfVjM)

启用成功后，顶部菜单栏会多出一个 **Developer（开发者）** 菜单。

## 步骤 2：进入第三方 API 配置页面

1. 点击新出现的 **Developer** 菜单。
2. 选择 **Configure Third-Party Inference…（配置第三方推理…）**。

![图片展示了Claude Desktop软件的开发者菜单界面。在“Developer”下拉菜单中，“Configure Third-Party Inference...”选项被红色框线突出显示。该图片与文档中“步骤2：进入第三方API配置页面”内容相关，对应选择“Configure Third-Party Inference...”这一步骤，是后续填写Base URL和API Key等配置操作的前提，直观呈现了操作入口位置。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=N2VlNWRlMGY1YzNjYWU5MTM0ZDBjYWVjZmJlNTdlNmRfNzI2YTcxZWVjZWQyM2Q5ODZjZjUyNjFhZjI5YTYxZTlfSUQ6NzY0NTcxMjI4ODU4NTk0NDI3OF8xNzgxNzcwNzg4OjE3ODE3NzQzODhfVjM)

## 步骤 3：填写 Base URL 和 API Key（最关键一步）

打开配置窗口后，按下面方式设置：

- **Use this configuration**：打开开关，必须开启。
- **Gateway**：选择 **Anthropic-compatible**。
- **Gateway base URL**：粘贴你的第三方 API Base URL。
- **Gateway API key**：粘贴你的 API Key，也就是中转站后台复制出来的那串密钥。
- **Gateway auth scheme**：一般保持默认即可。
- **Gateway extra headers**：一般不用填写，除非你的服务商明确要求额外请求头。

设置完后，点击右下角 **Apply locally（本地应用）**。

![图片展示了Claude Desktop配置第三方API的“Gateway”页面。左侧导航栏有多个选项，当前选中“Connection”。右侧“Connection”区域中，“Gateway”选项被红色框突出显示，下方有Gateway base URL和Gateway API key两项，Gateway base URL处显示网址，Gateway API key处以星号遮挡。右下角有“Apply locally”按钮。该图片与文档中步骤2的内容相关，用于指导用户在配置第三方API时，选择Gateway连接方式并填写相应凭证后点击“Apply locally”以完成本地应用设置。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZjkzN2E3ZDdiYTAxZmVlMTBjMzFjOTExMWMxNGQ1MmNfMWZhNmM4NjEzNzkyZWQ3ZTg0OWNlZGIwNzIyMzk3NmRfSUQ6NzY0NTcxMjI5OTU0NTcwOTc4N18xNzgxNzcwNzg4OjE3ODE3NzQzODhfVjM)

## 步骤 4：验证是否成功

1. 配置完成后，Claude Desktop 可能会提示重启；如果没有提示，也建议手动完全退出后重新打开。
2. 重新打开后，进入 Cowork、Code 或 Projects 相关页面。
3. 输入一个简单问题测试。
4. 如果模型能正常响应，或者界面中显示的是你第三方 API 提供的模型，就说明配置成功。

![图片展示了Claude Desktop的界面，左侧为Code页面，有New session、Customize等选项，当前选中General coding session。右侧显示“你好！有什么我可以帮你的吗？”的对话框，下方有Type / for commands输入框。该图片对应文档中步骤2后的成功测试结果，说明在输入简单问题后，界面显示的是第三方API提供的模型，表明配置成功，模型调用走第三方API，不消耗Claude官方订阅额度，可使用相关功能，响应速度受API服务和网络影响。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MGY4NTJiYWM0YTA1MjUxMDQ1NGMwNGMxNWMxMzlmZTlfOTkzZTI3NWUzOTUzM2YzNzkwMjkyNTEzM2JhNmQ0YjNfSUQ6NzY0NTcxMjMxMzgxNDgzMDI3MF8xNzgxNzcwNzg4OjE3ODE3NzQzODhfVjM)

![图片展示了Claude Desktop的Code页面，左侧栏选中“Code”选项，右侧显示“你好！有什么我可以帮你的吗？”的对话框。右侧列表中，以红色框突出显示了多个Claude模型选项，如“claude-2.0”“claude-2.1”等，还有“Haiku 4.5”“Instant 1”等模型。该图片与文档中“步骤2：进入第三方API配置页面”相关，用于说明在进入第三方API配置页面后，可看到的Claude模型选项，以供用户选择。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NTUxN2U4MDJmYmFiYWI2ZjNlZTVmNDk3ZTlmZGI0YThfNTljMGViMDJiMWMzNTQ1ZTViMjA3MmJlNDUxMTM3YjNfSUQ6NzY0NTcxMjMyMzQ5OTQyOTA3MV8xNzgxNzcwNzg4OjE3ODE3NzQzODhfVjM)

成功后你会看到：

- 模型调用走第三方 API，不消耗 Claude 官方订阅额度。
- 可以使用 Cowork / Projects / Artifacts 等第三方模式支持的功能。
- 响应速度取决于你的第三方 API 服务质量和网络延迟。

## 常见问题 & 解决办法

## Q1：找不到 Developer 菜单怎么办？

可以按下面顺序检查：

- 确认已经点击 **Help → Troubleshooting → Enable Developer Mode**。
- 完全退出 Claude Desktop 后重新打开。
- 确保 Claude Desktop 已经更新到最新版本。

## Q2：配置后还是进了普通 Claude 登录页？

可能是配置没有生效。可以尝试：

- 确认 **Use this configuration** 已经打开。
- 确认填写了 Gateway、Base URL 和 API Key。
- 点击 **Apply locally** 后完全退出并重新打开 Claude Desktop。
- 如果仍不生效，可以在 **Help → Troubleshooting** 里查看配置报告或错误提示。

## Q3：报错或无法连接怎么办？

重点检查这几项：

- API Key 是否复制完整，前后不要多空格。
- Base URL 是否是 https:// 开头。
- 你的第三方 API 是否真的支持 Anthropic-compatible，而不是只支持 OpenAI-compatible。
- 服务商是否要求额外请求头，如果要求，就需要填到 **Gateway extra headers**。
- 第三方 API 余额、额度或模型权限是否正常。

## Q4：为什么我填了 OpenAI 格式的接口不能用？

因为 Claude Desktop 这里需要的是 Anthropic-compatible 接口。 如果你的服务只提供 OpenAI-compatible 接口，需要先通过支持协议转换的网关，转换成 Anthropic Messages API 后再接入。

## Q5：想切换回官方 Claude 怎么办？

可以直接关闭 **Use this configuration**，然后完全退出并重新打开 Claude Desktop。 如果重新打开后出现官方登录入口，选择官方账号登录即可。

## Q6：免费用户能用 Cowork 吗？

第三方模式本身不依赖 Claude Pro 额度，模型调用走你自己的第三方 API。 但具体哪些功能可用，会受 Claude Desktop 当前版本和官方策略影响，后续可能变化。

## 小贴士

- 这个配置是本地保存的，只影响当前这台 Windows 电脑上的 Claude Desktop。
- 它不影响网页版 Claude，也不会改变你的 Claude 官方账号设置。
- 第三方 API 的质量很关键，建议优先选择稳定、透明、可信的服务。
- 官方客户端和相关功能可能随时更新，如果界面变化，以最新版本里的菜单和提示为准。

配置完成后，可以直接去试试 Cowork 或 Projects。桌面版体验确实很顺手。

**更多 AI 干货同步更新公众号：雨哥聊AI，关注我带你玩转 AI 时代**
