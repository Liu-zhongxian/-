# 我的Opencode终于用上了免费的Claude Opus 4.5（赶紧跟上）



![图片展示了opencode接入Antigravity-Manager的示意图。左侧是opencode图标，中间是Antigravity-Manager（Local Proxy），右侧是Claude和Gemini模型图标。文字说明“本地代理使用Claude/Gemini模型，告别API付费烦恼”，并有“FREE ACCESS”被红色叉号覆盖。该图与文档中介绍opencode接入Antigravity-Manager配置步骤的内容相关，直观呈现了配置后模型使用情况。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=YjE5MDEyZTlkZWRhOTE0MDcwOTYzN2NhZWVmYjQ3NTVfYTk5NGYwMTZlNGE0YzdkM2VmMjExM2QyMjViZWE0NzRfSUQ6NzY0NTcxNTI3ODc1NTU5NzUwMl8xNzgxNzcwNzk1OjE3ODE3NzQzOTVfVjM)

好多朋友一直想用**Claude Opus 4.5**，但是苦于没有好的ip无法订阅Anthropic产品，再就是Anthropic真是一家封号狂魔公司，动不动就把账号封了，也是醉了，算了，不吐槽他了，步入正题。

**\\## 你需要准备什么**

\\- Windows 或者 MAC

\\-全程梯子打开

\\- Antigravity-Manager（务必升级到 4.x 最新版）

\\- opencode

\\- 一个已授权的 Google 账号

**\\## Step** **1️⃣** **配置 Antigravity-Manager**

\\\*\\\*添加账号\\\*\\\*

账号页面 → 添加账号 → OAuth → 完成 Google 授权

不会的可以参考：

\\\*\\\*开启反代\\\*\\\*

API 反代页面 → 启动服务

\\- 端口：8045

\\- 自启动：跟随应用自启动

\\- 访问授权：关闭

\\- 局域网访问：按需

![图片展示的是Antigr addCriterion()函数的代码示例。代码中定义了两个函数，分别是`addition`和`subtraction`。`addition`函数接受两个参数`a`和`b`，返回它们的和；`subtraction`函数同样接受两个参数`a`和`b`，返回它们的差。该](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=OWZkNzA0ODZlODY2OTE3YzUwYTUxNzU4MzlmNmY5YjFfMDFhMjEwMzhhZWM3ZjE2MmE3YjUwMTkzMDRkN2MxMGJfSUQ6NzY0NTcxNTI5MzExNjk5MjcwMV8xNzgxNzcwNzk1OjE3ODE3NzQzOTVfVjM)

\\\*\\\*验证\\\*\\\*

浏览器访问 http://127.0.0.1:8045/v1/models

看到 JSON 模型列表 = 成功

![图片展示的是浏览器访问http://127.0.0.1:8045/v1/models后的JSON模型列表页面。页面显示了多个模型信息，如claude-3-5-sonnet-20240620、claude-opus-4-5-thinking等，每个模型有创建时间、ID、所属对象、拥有者等字段。该图片与上文“验证”步骤相关，用于验证配置Antigravity- Manager后，浏览器访问该地址能看到JSON模型列表即为成功。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MWEwZWE4ZTQ3MjYzNDJmMWUzMzZhNmZlMjk0NjRjODFfMDYyYmVlODk5MDZhZTg1MGU5NDQ5ZjAxOTgzNWRmOTZfSUQ6NzY0NTcxNTMwODM3MTY0MzU4M18xNzgxNzcwNzk1OjE3ODE3NzQzOTVfVjM)

\\---

**\\## Step** **2️⃣** **配置 opencode**

Opencode按照默认路径安装即可

下载地址：[https://opencode.ai/](https://opencode.ai/)

找到配置文件添加Opus 4.5以及其他Gemini3模型：

\\\`\\\`\\\`

C:\\\Users\\\你的用户名\\\\.config\\\opencode\\\opencode.json

\\\`\\\`\\\`

替换为以下内容：

\\\`\\\`\\\`json文件内容

{

"\$schema": "[https://opencode.ai/config.json](https://opencode.ai/config.json)",

"provider": {

"antigravity-local": {

"npm": "[@ai](https://x.com/@ai)\\-sdk/openai-compatible",

"name": "Antigravity Local",

"options": {

"baseURL": "http://127.0.0.1:8045/v1",

"apiKey": "not-needed"

},

"models": {

"claude-opus-4-5-thinking": {

"name": "Claude Opus 4.5 Thinking"

},

"claude-sonnet-4-5": {

"name": "Claude Sonnet 4.5"

},

"gemini-3-flash": {

"name": "Gemini 3 Flash"

},

"gemini-3-pro-high": {

"name": "Gemini 3 Pro High"

}

}

}

}

}

\\---

**\\## Step** **3️⃣** **开始使用**

1\\. 确保 Antigravity 反代已开启

2\\. 启动 opencode

3\\. 模型选择器 → Antigravity Local → 选择模型

4\\. 开聊！

![图片展示的是opencode模型选择器界面。界面中“显示步骤”显示为3分钟27秒，下方有“回复”区域，提示“雨哥，我先读取一下”。模型选择器中，有“OpenCode Zen”“OpenAI”“GPT-5.2”“GPT-5.2 Codex”“Antigravity Local”等模型选项，其中“Claude Opus 4.5 Thinking”模型被红色框突出显示。该图片与上下文紧密相关，直观呈现了在opencode中选择Claude Opus 4.5 Thinking模型的操作界面。](https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/authcode/?code=MDE2NTAwNmZmMjU1ZDYwNTQ1YzA3NWVkYjcyMDU4ZWRfNTRhOWQwZmJhNGUyMzc4MTIxOGRlMGRjMTBlMzJjNmRfSUQ6NzY0NTcxNTMyMDQ1OTcyNjAzOF8xNzgxNzcwNzk1OjE3ODE3NzQzOTVfVjM)

\\---

**\\## 常用模型速查**

| 模型 | 用途 |

|------|------|

| claude-opus-4-5-thinking | 深度思考，复杂任务 |

| claude-sonnet-4-5 | 日常对话，性价比高 |

| gemini-3-flash | 快速响应 |

| gemini-3-pro-high | 高质量输出 |

| gemini-3-pro-image | 图像生成 |

\\---

**\\## 踩坑指南**

\\\*\\\*429/503 错误？\\\*\\\*

→ 升级 Antigravity 到最新版（版本号问题是大坑）

→ 刷新账号配额 + 清除限流记录

\\\*\\\*连接被拒绝？\\\*\\\*

→ 检查 Antigravity 是否启动

→ 检查反代服务是否开启

\\\*\\\*找不到 Antigravity Local？\\\*\\\*

→ 检查 JSON 格式

→ 重启 opencode

\\\*\\\*想开鉴权？\\\*\\\*

把 apiKey 改成你的真实密钥即可

\\---

\\## 总结

核心就三步：

1\\. Antigravity 开反代

2\\. opencode 配 provider

3\\. 选对模型开聊