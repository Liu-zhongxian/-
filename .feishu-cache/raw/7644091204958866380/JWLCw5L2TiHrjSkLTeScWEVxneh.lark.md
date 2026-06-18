# 0 元打通 Claude + Codex + OpenCode：一个免费模型，6 个入口，20 分钟搞定

![图片展示了一款AI编程工具的宣传内容。上方文字为“0元打通Claude+Codex+OpenCode，一个免费模型，6个入口，20分钟搞定”，强调其免费、多入口、快速搞定的特点。画面右侧有一个人站在数字“2”前，周围环绕着代码符号和数字。下方列出6个入口，分别是Claude命令行、桌面端，Codex CLI命令行、桌面端，OpenCode命令行、桌面端。底部有“20分钟快速搞定”“0费用免费畅用”“6个入口全部验证通过”等标识。该图片与文档中介绍接入多个AI编程工具的方案内容相契合。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OTU3MDY3YjEzNWYwOTU3NmE1MzYyNTdkNzdiNWJjNDRfMmEzYTlkMzc2MjQ4ZTBmMDJhZTIxNWQ4OGQwNzAxYjRfSUQ6NzY0NTcxMTQ5MjM4NTQ0MzAyMF8xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

20 分钟，0 费用，6 个 AI 编程工具全部接入同一个免费模型。

这是我用 **CC Switch + OpenRouter** 跑通的结果。模型是 OpenRouter 最近上的 **Ring-2.6-1T**（免费版），Claude Code、Codex、OpenCode 的命令行和桌面端全部验证通过。

免费窗口期不知道能撑多久，下面直接上手。

## 一、最终效果

这套方案可以接入 6 个入口：

```Plain Text
Claude Code 命令行
Claude 桌面端
Codex CLI
Codex 桌面端
OpenCode 命令行
OpenCode 桌面端

```

使用的免费模型是：

```Plain Text
inclusionai/ring-2.6-1t:free

```

作为上游配置时，OpenRouter 地址一般填：

```Plain Text
https://openrouter.ai/api/v1

```

![图片展示的是inclusionAI: Ring - 2.6 - 1T (free)的介绍页面。页面上方有“Chat”和“Compare”按钮。下方介绍该模型为1T参数的超大规模语言模型，适用于需要强大能力与操作效率的现实世界代理工作流，优化了编码代理、工具使用及长时任务执行，且在多个基准测试中表现出色。还提到其动态分配推理预算，适合高级编码代理、复杂推理管道及执行质量、延迟和成本效率至关重要的大规模自主系统。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OTkyNTA0ZWZmZTc2OTlkNDRkZDRjYzY4Yjg1MDVmZDlfZjlhYmNlM2Y5ZTMxNDRkMWVhNWQxMjkwOGQ3ZWYzODZfSUQ6NzY0NTcxMTUwNDkzMDY3MTgzNV8xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

## 二、准备 OpenRouter Key

先打开 OpenRouter 的 API Key 页面，新建一个 Key。

```Plain Text
https://openrouter.ai/keys

```

创建后复制保存，后面主要填到 CC Switch 里；Claude 桌面端这种特殊入口，会通过本地路由间接使用。

![图片展示的是OpenRouter的API Keys页面。左侧导航栏中“API Keys”选项被红色框突出显示。页面上方有“Create and manage your API keys”提示。下方表格列出了已有的两个API Key，包括Key名称、Guardrails、Expire、Last Used、Usage、Limit等信息，如cc和claude的Key，均无Guardrails，Expire为Never，Last Used分别为Never和1小时前，Usage均为$0.000，Limit均为unlimited。右上角有“New Key”按钮。该图与上文“先打开OpenRouter的API Key页面，新建一个Key”的内容相关，展示了新建Key的页面位置。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZGVjNzEyODU3MDEwNGYxNDVmMjBlYzdiYzZhNzI5MDBfZGRlODI0NTlkOTE3NWQ3MDNkMGZmYTIwMjFkZTVlNTBfSUQ6NzY0NTcxMTUyMDUyMDg2NzAzMF8xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

## 三、安装并打开 CC Switch

下载安装 CC Switch，打开后先看一下首页里有哪些入口。

![图片展示的是CC Switch的GitHub页面。页面上方显示仓库名称为“cc - switch”，右上角有“Fork”和“Star”按钮，当前有4.2k个fork和84.6k个star。页面中部是仓库的文件列表，下方有“Releases”区域，其中“CC Switch v2.14.1”被红色框突出显示。该图片与文档中“安装并打开CC Switch”部分相关，用于说明下载安装CC Switch后，打开后需查看首页里有哪些入口，以及CC Switch的版本信息。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZTY3ZjMwNWY1YjQ5YTJjODNjMzgyN2ViNWRjMTU0Y2RfYTE3MWZlYmRlNDBiOGI4ODFjZTMzMzExZGExZmMxZmNfSUQ6NzY0NTcxMTUzMzg3MTQxODU5Ml8xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

这里有一个容易误会的地方：**不要把 CC Switch 当成只配置一次、所有入口都自动通用的地方。**

Claude、Codex、OpenCode 每个入口在 CC Switch 里的配置页面和生效方式都不完全一样。所以后面我会按入口分别写：OpenCode 怎么配、Claude 怎么配、Codex 怎么配。

不过 CC Switch 连接 OpenRouter 这一层，都会用到同一组基础配置：

```Plain Text
供应商：OpenRouter
API 地址：https://openrouter.ai/api/v1
API Key：你的 OpenRouter Key
模型：inclusionai/ring-2.6-1t:free

```

> ⚠️ 模型名一定要手动填完整，注意最后的 :free 不要漏。后面每个入口的配置都用这组信息，不再重复列出。

## 四、OpenCode 接入

OpenCode 这边最顺，命令行和桌面端都已经验证通过。

## OpenCode 命令行

在 CC Switch 里切到 OpenCode，按第三节的基础配置填好 OpenRouter 信息，然后保存启用。

![图片展示了CC Switch界面，其中“OpenCode”标签被红色框突出显示。界面下方有多个模型选项，包括“Antigravity Local”“Codex proxy”“Imported 2026-04-24 11:13”等，以及“OpenRouter”选项，其下方有网址。右上角有一个红色加号。该图片与文档中介绍OpenCode接入的内容相关，对应文档中提到的在CC Switch里切到OpenCode，按基础配置填好OpenRouter信息后保存启用的操作步骤。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZGYxZWI4YzBlMGM4MWE4MGVmMDdmMTg3NDhmZmVkMzVfNTA0NmRmNDIxMmE3ZTk0ZTNlYWJmN2FjNTIyNGJjNjRfSUQ6NzY0NTcxMTU1MDg1Mzk5MTYwNF8xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

![图片展示了OpenCode接入时在CC Switch里配置的基础信息界面。界面中有多个配置项，其中“API Key”和“Reg. Code”两个框被红色框突出显示，分别对应API密钥和注册码。此外，“My provider”下拉框也被红色框突出显示。界面右下角有“取消”和“确定”两个按钮。该图片与文档中OpenCode命令行接入配置的内容相关，直观呈现了配置时需填写的关键信息位置。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MWE5NmJhZDljYmRmNzRlNDllZjhmZDkxM2YwYTI4NWJfMDc0OGM5OGVlZmNkZWM2ZTBhYWQyYmRmMzhlYTM4ZTRfSUQ6NzY0NTcxMTU1OTQ4NTk4Mzk2NV8xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

![图片展示了CC Switch界面中OpenCode接入的相关内容。界面左侧有多个模型选项，其中“OpenCode”被红色框突出显示。右侧是OpenCode的配置区域，显示其为“Imported 2026-04-24 11:13 (OMO)”，并有“+ 确定”按钮。该图片与文档中OpenCode接入部分上下文对应，直观呈现了在CC Switch里切到OpenCode后，按基础配置填好OpenRouter信息并保存启用的操作界面情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MGExZDM5MGQ3ODNlMTE3NTk0YmYyNGExZTgxMjU4YzBfOWI4N2RmOTc0YmRkYmI4OGQ3NGY2MGIxMDY1YzkxNmFfSUQ6NzY0NTcxMTU2Nzg5NTkwNzUyOF8xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

打开 OpenCode 命令行，问 你是什么模型？，能正常回答就说明接入成功。

![图片展示了OpenCode命令行接入成功后的界面。上方显示“你是什么模型”，下方回复“我是你妈妈的白大褂模型（Ring），属于通用语言大模型系列...”，并明确指出模型为“Ring-2.6-1t”。界面底部有“Sisyphus - Ultraworker”和“Ring-2.6-1t OpenRouter”标识。该图片与文档中OpenCode命令行接入成功的内容相关，直观呈现了接入后的身份确认情况，验证了OpenCode命令行接入的顺利。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MjVjZDI5NTRjOWJhMDAxMzI2YTY3ODI3YzkwY2UzZmZfNmRlMmI3ODNiMjMyMGNkZDQzZGNmMDEzZTVhM2M2YmRfSUQ6NzY0NTcxMTU4NjM1ODc5MTM1Nl8xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

## OpenCode 桌面端

OpenCode 桌面端也能用，但这里有个细节：

如果只在 OpenCode 桌面端里直接添加 OpenRouter Key，不一定能看到这个免费模型。

正确做法是先在 CC Switch 的 OpenCode 页面里把 OpenRouter 配好（包括手动填写模型名 inclusionai/ring-2.6-1t:free），然后回到 OpenCode 桌面端选择对应模型。

![图片展示了OpenCode桌面端中模型选择界面。搜索框内显示“OpenRouter”，下方列出多个模型选项，其中“Ring-2.6-1t”被红色框突出显示，并有红色勾选标志。该图片与文档中介绍OpenCode桌面端使用方法的内容相关，用于说明在OpenCode桌面端选择对应模型的操作步骤，即先在CC Switch的OpenCode页面配好OpenRouter，然后回到桌面端选择对应模型，此图直观呈现了选择模型时的界面及操作要点。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NjZjZjBhYjg3N2Y5NTNiMjIxMzE1MzA1NDI3YjQ0YjhfYWUwNWU4OGFiODQ3ODA1OTJmMmYxYjJkMzNhOTQwM2NfSUQ6NzY0NTcxMTYwMTAxNzk4MjE0MV8xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

问 你是什么模型？，能正常回答就说明 OpenCode 桌面端也通过。

![图片展示了Claude Code命令行界面。界面中显示“你好！我是百灵大模型（Ling），由柏松编程开发，是一个通用语言大模型”，并有“请问我用的什么模型？”的提示。下方“Build”选项处显示“Ring-2.6-1t”。该图片与文档中“打开Claude Code命令行，问你是什么模型？”的内容对应，直观呈现了在Claude Code命令行中询问模型信息的操作界面及显示结果。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MGJjYWI2Mjg2Mzk3ZjM2NTY0MGRkNTgyYzAwNzM3OWNfMWM5MTI1NTMxYjZlOGExMzBhOTI2NjY0YzUzNjAzMTFfSUQ6NzY0NTcxMTYxMzAzODk4ODQ3OV8xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

## 五、Claude 接入

Claude 分命令行和桌面端，两边方式不一样。

## Claude Code 命令行

Claude Code 命令行比较简单，在 CC Switch 的 Claude Code 页面里按基础配置填好 OpenRouter 信息即可。

![图片展示的是CC Switch平台的Claude页面。页面顶部有“Claude”标识，下方有多个模型选项，如Claude Official、default等。其中“OpenRouter”选项被红色框线突出显示。页面中部有“添加”按钮，可添加新模型。页面底部还有XueDingToken、Nvidia、DeepSeek等其他模型选项。该图片与文档中“Claude Code命令行”部分内容相关，直观呈现了在CC Switch平台添加Claude模型的操作界面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MGMzNzE4NGZmMDc2YWQxYzYzNTcxODEzN2E3OWNlYjNfNDAwNDVmY2M5NWY2YmFkMjU2MWMyNWM1MjcxMjgxOTlfSUQ6NzY0NTcxMTYzMDM5ODk4MzM3OV8xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

![图片展示了CC Switch的编辑供应商页面，用于接入Claude Code命令行。页面中突出显示了API Key和主模型、Sonnet预训练模型、Inclusions预训练模型等关键信息。API Key部分以红色框标注，下方有“API Key”字样。主模型、Sonnet预训练模型、Inclusions预训练模型部分也用红色框突出显示。该图片与文档中接入Claude Code命令行的内容相关，直观呈现了接入时所需填写的关键信息。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NjNmZTljZGNmNmM2ZmZiNDI0MTNjNmY0MjgyMmEyYjhfNmM4ZGI3Mzc1MWZlNzdmMDM0ZTIxZWE4NzRlNTljM2ZfSUQ6NzY0NTcxMTY0MDk1MDkwMTk4MV8xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

![图片展示的是CC Switch的Claude Code页面。页面上方有多个导航标签，其中“Claude Code”被红框突出显示。页面主体部分列出了多个模型，包括Claude Official、default、XunDingToken、Nvidia、DeepSeek、OpenRouter等，每个模型名称后有其对应网址。其中，OpenRouter模型被红框圈出，其网址为https://openrouter.ai，右侧有“+添加”按钮。该图片与文档中介绍Claude Code命令行配置内容相关，直观呈现了页面中模型配置的界面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZjIwNzEzMjIyZWZjZGE0OTg4NmEzMmE5YWU0YjYyN2FfYzcyYTI0ZTRlYjc0MjYzYTNkNjI3YzU3NjVmOWRiZmVfSUQ6NzY0NTcxMTY1MDQ1NjIyNzAwNV8xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

打开 Claude Code 命令行，问 你是什么模型？，能正常回答就说明通过。

![图片展示了Claude Code命令行界面，显示了Claude Code V2.1.132版本信息及API Usage Billing状态。下方对话框中，用户询问“你是什么模型？”，系统回复其为百灵大模型（Ling），由蚂蚁集团开发，是通用语言大模型，还介绍了Ling、深度推理模型（Ring）及任意多模态模型（Ming）的特点。该图片与文档中Claude Code命令行接入部分相关，用于验证命令行接入是否成功。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=Mjk2OTY0MTcxYTU0Nzc4YzliMzVkOGExZTc3YTlkZGZfYzI1ZjMxM2IxNmU3ZTk0Zjg5MTVjZWZmMGFjZjEyNjlfSUQ6NzY0NTcxMTY2NDE3MTY2NjY0MV8xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

## Claude 桌面端

Claude 桌面端这里和前面不一样，不能按"直接填 OpenRouter 地址、Key、模型"的方式来配。

原因是：Claude 桌面端不一定支持直接选择 inclusionai/ring-2.6-1t:free 这个模型，也不适合把 OpenRouter 的参数直接填进去。

正确思路是：**先在 CC Switch 里开本地路由，再让 Claude 桌面端连接这个本地路由。**

先回到 CC Switch，确认 OpenRouter 和 Ring 免费模型已经配置好，然后开启本地路由 / 本地代理。

本地地址一般类似这样：

```Plain Text
http://127.0.0.1:15721

```

端口以你自己的 CC Switch 显示为准，不一定每个人都一样。

![图片展示了CC Switch的设置界面。画面中“路由总开关”和“本地路由”开关被红色框突出显示，均处于开启状态。本地路由部分，Claude开关被红色框标出，其对应地址为“http://172.16.4.1:19755”。该图片与文档中“先回到CC Switch，确认OpenRouter和Ring免费模型已经配置好，然后开启本地路由/本地代理”内容相关，直观呈现了开启本地路由的操作位置及对应地址。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZTQ5YTk2ZjU1NTlmZmQyMjU1ZTI4MDJjYzBmOGRjZGZfODIyZTVjNDA0ZGFlNzVjNGIxZWM4NmEzZTFhODlmMGRfSUQ6NzY0NTcxMTY3OTQzNDY1Njk3N18xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

然后打开 Claude 桌面端，进入开发者配置入口：

```Plain Text
Help → Troubleshooting → Enable Developer mode
Developer → Configure third-party inference

```

连接方式选择 Gateway，然后填写代理参数：

```Plain Text
Gateway base URL：http://127.0.0.1:15721
Gateway API key：PROXY_MANAGED
Gateway auth scheme：bearer

```

这里要注意：Claude 桌面端填的是 CC Switch 的本地地址，不是 OpenRouter 地址；API Key 通常也不是 OpenRouter Key，而是 PROXY\\\_MANAGED。

真正的 OpenRouter Key 和 Ring 模型，仍然放在 CC Switch 里管理。可以把它理解成两层：Claude 桌面端前面只认 Gateway 和 Claude 模型名，CC Switch 后面负责转到 OpenRouter 和 Ring 模型。

这里还有一个关键点：Claude 桌面端这一层要配置它自己能识别的 Claude 模型名，不能直接填 Ring 的模型名。比如可以填：

```Plain Text
claude-opus-4.7

```

也就是说，Claude 桌面端看到的是 Claude 自己的模型名；真正请求到后面走哪个 OpenRouter 模型，由 CC Switch 负责转发。

如果这里直接填 inclusionai/ring-2.6-1t:free，Claude 桌面端可能识别不了，导致配置看起来对，但实际跑不通。

![图片展示了Claude桌面端的Connection配置界面。关键部分有：Gateway选择为Anthropic - compatible；Gateway base URL为http://127.0.0.1:5721；Gateway API key和Gateway auth scheme分别为“bearer”和“bearer”；Model list中选中claude - opus - 4.7，其Model ID为claude - opus - 4.7。该图片与文档中介绍Claude桌面端配置内容相关，直观呈现了配置时的参数设置情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZGUzMmE1ZmExYzI2MDhlNDI0YmEzMzBjYzNlYTAzOTVfNzYxNzA0NzgzYWUyMWRiN2Y1YmI5Y2I1ZTYxZGE3ZThfSUQ6NzY0NTcxMTY5MjQ0OTY4MDU5M18xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

配置好之后，重启 Claude 桌面端，问 你是什么模型？，能正常回答，并且 CC Switch 里能看到请求记录，就说明 Claude 桌面端通过。

![图片展示了Claude桌面端界面，左侧为功能菜单栏，其中“Code”选项被红色框突出显示。右侧显示“你是什么模型”对话框，内容为“我是百灵大模型（Ling），由蚂蚁集团研发，是通用语言大模型，擅长提供通用场景下的智能交互服务，隶属于蚂蚁集团的AGI技术体系”。底部“Opus 4”也被红色框标出。该图片与文档中介绍Claude桌面端配置及使用的内容相关，展示了配置好后，重启Claude桌面端，问其模型信息时的界面情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NTE0MDJlZDM4MDNmMjJhYWZhZTE1YTAzMWE2ZGU4NmZfY2JiZGQ1MzIwNzQyOGJiYThhNGZiNDkxNjgxZTU0OGFfSUQ6NzY0NTcxMTcwNzcwMDIzNTQ4NV8xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

![图片展示的是OpenRouter平台的请求记录界面。记录中显示了多个请求，时间均为09:05:26，请求方均为OpenRouter，请求内容为“claude - halu - 4 - 5 - 20231001 - inclusion / ring - 2.6 - 1t”，请求次数均为1，金额均为$0.0000，响应时间为1.7s - 7.7s不等，响应大小均为200字节，状态均为“procy”。其中，有两条记录被红色框突出显示，表明这些是重点关注的请求记录。该图片与文档中介绍Claude桌面端配置好后，重启后查看请求记录的内容相关，用于展示请求记录界面及重点关注记录。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NzUwZGM0Y2QwYTVjNDU4MjlhZTk2ZDJiYWRmZGQyYzlfN2QzODBmZDUxYTkyZjBiZWVhYmRkNmNmY2U1ZmM4N2FfSUQ6NzY0NTcxMTcyMDAwNjE1OTU0Nl8xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

## 六、Codex 接入

Codex 这边也分命令行和桌面端。

## Codex CLI

在 CC Switch 的 Codex 页面里按基础配置填好 OpenRouter 信息，保存并启用。

![图片展示了CC Switch的界面，上方有Claude、Codex、Gemini等模型标识。Codex标识被红色框突出显示。下方有“default”和“OpenRouter”两个选项，其中“OpenRouter”后有蓝色的“+”号。该图片与文档中“在CC Switch的Codex页面里按基础配置填好OpenRouter信息，保存并启用”的内容相关，直观呈现了在CC Switch中配置OpenRouter的界面情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=NTgzNjFjMjJlYzQzMzI1MGZlMjA2ODY1M2RhOGU1ODNfYTIxNzcyZTA1NGVjYzU1ZWVkNTBjNWUwMjkwYjNjZGFfSUQ6NzY0NTcxMTczMjUyNjE1NzAwMF8xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

![图片展示的是CC Switch平台添加新供应商界面，用于接入Codex模型。界面中“添加新供应商”标题下有多个供应商选项，其中“OpenRouter”被红色框突出显示。下方有供应商名称、备注、API Key、API 请求地址等输入框，API Key处有红色框标注。右侧“模型列表”区域显示了多个模型名称，如“inclusions/ing-2.6-1other”等，其中“inclusions/ing-2.6-1other”被红色框突出显示。该图片与上下文介绍的在CC Switch的Codex页面里按基础配置填好OpenRouter信息，保存并启用的内容相关。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ODE2YTM3MzZjNjdhOWQ3ZDc5NTQyOTAxZTJjMmM0ZWVfN2RjNzUxMzMwNDEwYjJmYjJhOGM4NzhjYTJjMWUzMTFfSUQ6NzY0NTcxMTc0MzA3MDYzNzI2OF8xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

在 Codex 页面里，把 Codex 切换到刚才配置好的 OpenRouter 供应商。

![图片展示了CC Switch的界面，其中OpenRouter供应商已配置好。界面中有多个模型标签，如Claude、Codex、Gemini等。在OpenRouter供应商配置区域，显示其官网地址为https://openrouter.ai，右侧有“启用”按钮被红色框突出显示。该图片与文档中“在CC Switch的Codex页面里按基础配置填好OpenRouter信息，保存并启用”的内容对应，直观呈现了配置后的状态，帮助用户确认配置是否成功。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YzlkODg3OWU4NTVjNWVjZjQwZTM4MWQ5M2Y5NzQ2MzNfN2RhYTJiZjFhNWRjOGRjMTVhYmMwOGFhMmVmOGNkMzdfSUQ6NzY0NTcxMTc1ODY2OTE1NTUzOV8xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

打开 Codex CLI，如果配置成功，命令行里可以看到这个模型，也可以切换到对应模型正常使用。

![图片展示的是Codex CLI命令行界面。界面上方显示“claude code”窗口标题，下方提示有更新可用，版本从0.128.0升至0.130.0。关键信息是模型信息，显示为“inclusionai/ring-2.6-lt:free medium”，并有“/model to change”提示。界面底部还有一条提示信息，介绍GPT-5.5模型可用，可访问链接了解更多信息。该图片与文档中介绍Codex CLI配置成功后，命令行能看到模型并能正常使用的内容相关，直观呈现了配置成功后的CLI界面状态。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZmZmNzk4ZDI5YjMxY2EyYmY4MmI3N2ZhYTYzMjQ2YjBfYjY0OWRmN2RkZDZkODZhNTRjODBhZjJkNGFjMmZkMjBfSUQ6NzY0NTcxMTc3MTAxNDY2MzM4N18xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

问 你是什么模型？，能正常回答就说明 Codex CLI 通过。

![图片展示了尝试运行的跨平台PowerShell界面，显示OpenAI Codex模型信息，模型为inclusionai/ring-2.6-1t:free high，目录为D:\\codex。下方提示GPT-5.5在Codex中可用，是其最强的代理编码模型。还出现“Model metadata for 'inclusionai/ring-2.6-1t:free' not found”等错误信息。底部有模型家族介绍及开放生态与开源理念说明。该图片与文档中验证Codex CLI通过的上下文相关，用于展示模型运行情况及遇到的错误提示。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=ZDQ2ZGJmNTUzNTM1OWJmMDI1M2RiZGFlYjgyYmVlM2RfYzllOWEwNjMyZmVlZTgyOGEyZTk0YTg2OTgyNGU4OGRfSUQ6NzY0NTcxMTc4OTAwNjUyMzYxMl8xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

## Codex 桌面端

Codex 桌面端也能用，但显示上不如命令行清楚。同样在 CC Switch 里确认 Codex 已经走 OpenRouter 配置。

我们验证到的现象是：供应商能看到 OpenRouter，但具体模型不显示 Ring-2.6-1T，模型位置显示为"自定义"。**不用慌**，只要能正常请求，就说明它实际已经走到了对应配置。

问 你是什么模型？，能正常回答就说明 Codex 桌面端通过。

另外补一句：目前 CC Switch 对 Codex 的兼容性还不是特别完善，我这边发现的问题是历史会话可能无法正常加载。如果你只是新开会话测试和使用，影响不大；如果很依赖历史会话，建议先注意一下这个限制。

![图片展示了OpenRouter平台中Ling模型的介绍界面。界面顶部显示“你是什么模型”，下方介绍Ling为通用语言大模型，擅长高效语言理解和生成任务，其模型家族包括Ring和Ming。Ring专为深度推理与复杂问题设计，Ming支持图像、音频等多模态能力。底部有“自动审查”和“自定义”两个选项，其中“自定义”选项被红色框突出显示。该图片与文档中验证Codex接入时供应商能看到OpenRouter但模型不显示的情况相关，展示了Ling模型的介绍界面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OGFjMTg4NjVjNjg4YzgwYjQ0ZDVjNmNjNjFjNjUxNmJfODNhOTAxNTNlYWMyM2Y5YTdhYjFhMTVkOGJhMzU4MzVfSUQ6NzY0NTcxMTgwNDExODYzMzY4Nl8xNzgxNzcwNzg2OjE3ODE3NzQzODZfVjM)

## 七、验证结果

6 个入口全部用同一个问题测试：你是什么模型？

判断标准很简单——不要求模型准确自报名字（很多模型做不到），只要能发出请求、能收到回答、切换后能正常工作，就算通过。

这次验证结果如下：

- OpenCode 命令行：通过
- OpenCode 桌面端：通过
- Claude Code 命令行：通过
- Claude 桌面端：通过，需要通过 Gateway 本地路由接入
- Codex CLI：通过
- Codex 桌面端：通过，模型显示为“自定义”，不影响使用

以上只是基础接入验证。长任务稳定性、复杂代码修改、大项目表现，建议按你自己的真实场景再测。

## 写在最后

这篇教程不是在推荐 Ring-2.6-1T 这个模型本身——免费模型的能力上限大家心里有数。

真正的价值在于：**你现在花 20 分钟跑通这套配置，以后不管 OpenRouter 上出什么新模型，都只需要在 CC Switch 里改一行模型名，6 个入口同时切换，不用每个客户端都从头折腾一遍。**

这才是 CC Switch + OpenRouter 这套组合的意义：不是绑死在某个模型上，而是建好一条管道，让你随时能换水。

免费模型的窗口期不会一直在，趁现在还能用，先把管道搭起来。等哪天 OpenRouter 上线了更强的免费模型，你只需要回来换个名字就行。

**更多 AI 干货同步更新公众号：雨哥聊AI，关注我**[@xiangxiang103](https://x.com/@xiangxiang103)**带你玩转 AI 时代！**